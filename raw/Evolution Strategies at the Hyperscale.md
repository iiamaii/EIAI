# Evolution Strategies at the Hyperscale — 섹션별 한국어 번역 및 해설

> **원문**: Sarkar, Fellows, Duque et al. (Oxford FLAIR / WhiRL, MILA, NVIDIA, 2025)  
> **번역 원칙**: 전문 용어 원어 병기, 수식 유도 및 노테이션 상세 설명, 이론/실험 중심 서술

-----

## 핵심 기호 표기 정리 (Notation)

|기호                        |의미                                                           |
|--------------------------|-------------------------------------------------------------|
|`f : ℝᵈ → ℝ`              |적합도 함수 (fitness function), 최적화 목적함수                          |
|`x⋆`                      |최적 파라미터 벡터 (genotype, 유전자형)                                  |
|`π(x|θ)`                  |집단 분포 (population distribution)                              |
|`J(θ)`                    |기대 적합도 (expected fitness)                                    |
|`μ ∈ ℝᵈ`                  |가우시안 ES의 집단 평균 (population mean)                             |
|`σ_d`                     |노이즈 표준편차 (d에 의존)                                             |
|`v ~ N(0, I_d)`           |표준 정규 탐색 벡터 (search vector)                                  |
|`N(M, U, V)`              |행렬 가우시안 분포 (matrix Gaussian distribution)                    |
|`E ∈ ℝ^{m×n}`             |ES 탐색 행렬 교란 (full-rank perturbation)                         |
|`A ∈ ℝ^{m×r}, B ∈ ℝ^{n×r}`|EGGROLL 저랭크 인수 행렬                                            |
|`r`                       |EGGROLL 랭크 (r ≪ min(m,n))                                    |
|`M ∈ ℝ^{m×n}`             |평균 가중치 행렬 (mean weight matrix)                               |
|`ĝ_LR`                    |EGGROLL 저랭크 업데이트 벡터                                          |
|`‖·‖_F`                   |프로베니우스 노름 (Frobenius norm)                                   |
|`vec(·)`                  |행렬 벡터화 연산자                                                   |
|`mat(·)`                  |벡터화의 역연산 (vec의 역함수)                                          |
|`V ⊗ U`                   |크로네커 곱 (Kronecker product)                                   |
|`α-Hölder`                |α-횔더 연속성: ‖∇f(x)−∇f(y)‖ ≤ L‖x−y‖^α                           |
|`Θ(·), O(·), o(·)`        |빅-세타, 빅-오, 리틀-오 점근 표기법                                       |
|`N_workers`               |병렬 워커 수 (= 집단 크기, population size)                           |
|`α_t`                     |학습률 (step t)                                                 |
|`K_n(z)`                  |n차 제2종 변형 베셀 함수 (Modified Bessel function of the second kind)|
|`GG(s, p)`                |일반화 가우시안 분포 (Generalised Gaussian Distribution)              |

-----

## 초록 (Abstract)

진화 전략 (Evolution Strategies, ES)은 고도의 병렬화가 가능하며 미분 불가능하거나 잡음이 많은 목적함수도 처리할 수 있는 강력한 블랙박스 최적화 (black-box optimisation) 알고리즘 군입니다. 그러나 GPU에서 나이브한 ES는 구조화되지 않은 무작위 교란 (unstructured random perturbations)에 대한 배치 행렬곱 (batched matrix multiplications)의 낮은 산술 집약도 (arithmetic intensity) 문제로 인해 대규모 모델에서 금지적으로 비싸집니다.

본 논문은 **EGGROLL** (Evolution Guided GeneRal Optimisation via Low-rank Learning)을 제안합니다. 개별 교란을 **랭크-r 행렬**로 구조화하여 산술 집약도를 향상시킴으로써, 대규모 집단 크기에서 10억 파라미터 모델의 학습 속도를 **100배** 향상시키고, 순수 배치 추론 처리량의 최대 **91%**를 달성합니다.

고차원 파라미터 목적함수에 대한 가우시안 ES의 수렴 이론을 엄밀하게 분석하고, EGGROLL이 파라미터 차원 증가에 따라 ES와 일관성을 갖는다는 것을 이론적으로 증명합니다.

실험적으로 EGGROLL은:

1. 순수 정수 데이터타입 (integer datatypes)으로 동작하는 비선형 순환 언어 모델의 안정적 사전학습 가능
1. 추론 과제에서 LLM 후학습을 위한 GRPO와 경쟁력 있는 성능
1. 속도 향상에도 불구하고 표준 RL 환경에서 ES 대비 성능 저하 없음

-----

## 1. 서론 (Introduction)

진화 전략 (ES; Rechenberg 1978)은 역전파 기반 1차 방법 (first-order methods based on gradient backpropagation)의 매력적인 대안입니다. 주요 장점:

**1) 미분 불필요성**: 이산 파라미터화 (discrete parametrisation, 예: cellular automata) 또는 LLM 파인튜닝에서 outcome-only 보상처럼 기울기를 구할 수 없거나 잡음이 많은 시스템도 최적화 가능합니다.

**2) 강건성**: 집단 기반 탐색 (population-based exploration)이 불규칙성을 부드럽게 하고, 불연속성, 비조건부 곡률 (ill-conditioned curvature), 소실·폭발 기울기 문제에 강합니다.

**3) 확장성**: 집단 구성원의 적합도 평가 (fitness evaluation)가 독립적이며 스칼라 적합도만 통신하면 되어, 대규모 클러스터에서 근선형 속도 향상 (near-linear speedups)을 가능하게 합니다. 역전파는 기울기를 통신하고 집계해야 하므로 메모리와 계산 비용이 큽니다.

**실용적 장애물**: 딥러닝 아키텍처에서 대부분의 파라미터는 행렬로 표현된 선형 매핑입니다. 나이브 ES는 모든 집단 구성원에 대해 전체 파라미터 세트를 복제하는 **풀랭크 (full-rank) 행렬 교란**을 생성해야 하며, 이는:

- 메모리 비용 폭증 (large weight tensor 빈번한 이동)
- 낮은 산술 집약도 (batched matmul의 산술 집약도 상한 = 1)

을 야기합니다.

**핵심 기여**: LoRA (Hu et al., 2022)의 저랭크 어댑터와 유사하게, EGGROLL은 ES를 위한 저랭크 파라미터 공간 교란을 생성합니다. 전체 랭크 행렬 `E ∈ ℝ^{m×n}` 대신, `A ∈ ℝ^{m×r}`와 `B ∈ ℝ^{n×r}`를 샘플링하여 `E = (1/√r) AB⊤`을 형성합니다 (`r ≪ min(m,n)`). 보조 교란 행렬 저장이 `mn`에서 `(m+n)r`로 감소합니다.

-----

## 2. 예비 지식 (Preliminaries)

### 2.1 저랭크 행렬 근사 (Low-Rank Matrix Approximations)

LoRA (Low-Rank Adaptation; Hu et al., 2022)는 기반 모델의 행렬 파라미터를 동결한 채 파인튜닝 시 저랭크 분해로 비용을 줄이는 방법입니다. 모델 내 각 행렬 `Mᵢ ∈ ℝ^{m×n}`에 대해:

$$M_i \approx M_i^0 + A_i B_i^\top$$

- `M⁰ᵢ := StopGrad(Mᵢ)`: 동결된 기반 모델 행렬
- `Aᵢ ∈ ℝ^{m×r}`, `Bᵢ ∈ ℝ^{n×r}`: 좁은 열 행렬 (`r ≪ min(m,n)`)로, 태스크 특화 학습에서 기울기 기반 최적화로 업데이트

각 행렬의 최적화 파라미터 수가 `mn`에서 `r(m+n)`으로 감소합니다. EGGROLL은 동일한 저랭크 근사를 진화 전략에 적용합니다.

-----

### 2.2 진화 전략 (Evolution Strategies)

#### 문제 정의 (Problem Formulation)

목적함수 `f : ℝᵈ → ℝ` (적합도, fitness)를 최대화하는 파라미터를 찾는 것이 목표:

$$x^\star \in \arg\max_{x \in \mathbb{R}^d} f(x)$$

파라미터 집합 `x`를 **유전자형 (genotype)**이라 하며, d차원 벡터로 수집합니다. `∇_x f(x)|_{x=a}`를 `∇f(a)`로 표기합니다.

1차 기울기 기반 방법과 달리, 진화적 방법은 적합도 파라미터 공간에 대한 **매개변수적 집단 분포 (parametric population distribution)** `π(x|θ)`를 업데이트합니다. 이 분포에서 생성된 샘플 `x ~ π(x|θ)`를 **변이 (mutation)**이라 합니다. `f(x)` 최적화 문제는 θ의 최적화 문제로 환원됩니다:

$$J(\theta) = \mathbb{E}_{x \sim \pi(x|\theta)}[f(x)]$$

> **핵심 통찰**: 집단 분포의 도입으로 적합도 지형 (fitness landscape)이 부드러워집니다. `π(x|θ)`가 θ에 대해 부드러우면, `f(x)`가 불연속이더라도 측정 가능하고 적분 가능한 한 `J(θ)`는 θ에 대해 부드럽습니다.

#### 점수 함수 기울기 추정 (Score Function Gradient Estimation)

`J(θ)`의 기울기는 **점수 함수 (score function)** `∇_θ log π(x|θ)`를 이용해 계산합니다:

$$\nabla_\theta J(\theta) = \mathbb{E}*{x \sim \pi(x|\theta)}\left[\nabla*\theta \log \pi(x|\theta) \cdot f(x)\right]$$

**도출 과정**: `J(θ)`를 미분하면

$$\nabla_\theta J(\theta) = \int \nabla_\theta \pi(x|\theta) f(x) dx = \int \pi(x|\theta) \frac{\nabla_\theta \pi(x|\theta)}{\pi(x|\theta)} f(x) dx = \mathbb{E}*{x \sim \pi}\left[\nabla*\theta \log \pi(x|\theta) f(x)\right]$$

이를 N개의 탐색 변이를 샘플링하여 **몬테카를로 추정 (Monte Carlo estimate)**합니다:

$$\hat{\nabla}*\theta J(\theta) = \frac{1}{N} \sum*{i=1}^N \nabla_\theta \log \pi(x_i|\theta) f(x_i) \quad \cdots \text{(수식 1)}$$

학습률 `α_t`를 사용한 **확률적 기울기 상승 (stochastic gradient ascent)**으로 업데이트:

$$\theta_{t+1} \leftarrow \theta_t + \alpha_t \hat{\nabla}_\theta J(\theta_t)$$

> **주의**: ES는 적합도 함수의 도함수를 직접 구하지 않습니다. 각 변이 `xᵢ`에 대해 `f(xᵢ)`를 평가하기만 하므로 **0차 최적화 (zeroth-order optimisation)** 방법입니다.

#### 가우시안 ES (Gaussian ES)

이 논문은 가우시안 집단 분포 `π(x|θ) = N(μ, I_d σ²)`를 연구합니다. 변수 변환 `v = (x-μ)/σ`를 통해 ES 업데이트를 표준 정규분포의 기대값으로 표현합니다.

**도출 과정**: `x = μ + σv`, `v ~ N(0, I_d)`로 치환하면, log 가우시안의 점수 함수는 `∇_μ log π(x|θ) = (x-μ)/σ² = v/σ`이므로:

$$\nabla_\mu J(\theta) = \frac{1}{\sigma} \mathbb{E}_{v \sim \mathcal{N}(0, I_d)}[v \cdot f(\mu + \sigma v)] \quad \cdots \text{(수식 2)}$$

이 형태는 가우시안 ES가 평균 파라미터 μ 주위의 표준 정규분포에서 탐색 벡터를 생성하여 적합도를 최적화함을 보여줍니다. 분산 파라미터 σ²은 조정 가능한 하이퍼파라미터입니다.

> **왜 가우시안인가?** (1) 수학적 편의성, (2) 중심극한정리 (Central Limit Theorem, CLT)로 인해 EGGROLL의 저랭크 근사가 랭크 증가에 따라 가우시안으로 수렴, (3) 대부분의 널리 사용되는 ES 알고리즘이 가우시안 집단 분포를 가정합니다.

-----

### 2.3 행렬 파라미터에 대한 진화 전략

#### 행렬 가우시안 분포 (Matrix Gaussian Distribution)

행렬 공간에서 작업 시 **행렬 가우시안 분포** (Dawid, 1981)를 사용합니다. `X ∈ ℝ^{m×n}`에 대해:

$$\mathcal{N}(M, U, V) = \frac{1}{(2\pi)^{mn/2} \det(U)^{n/2} \det(V)^{m/2}} \exp\left(-\frac{1}{2} \text{tr}\left(V^{-1}(X-M)^\top U^{-1}(X-M)\right)\right)$$

- `M ∈ ℝ^{m×n}`: 평균 행렬
- `U ∈ ℝ^{m×m}`: 행 공분산 (row covariance)
- `V ∈ ℝ^{n×n}`: 열 공분산 (column covariance)

**벡터화 연산자 (vectorisation operator)**:

$$\text{vec}(X) := [x_{1,1}, \ldots, x_{m,1}, x_{1,2}, \ldots, x_{m,n}]^\top$$

이에 대응하는 역연산: `mat(vec(M)) = M`

**행렬 가우시안 → 다변수 가우시안 동치**: `X ~ N(M, U, V)` 샘플링은 `vec(X) ~ N(μ, Σ)` (μ=vec(M), **Σ=V⊗U**, ⊗는 **크로네커 곱 (Kronecker product)**)와 동치입니다. 등방성 (isotropic) 경우 `U=σI_m`, `V=σI_n`이면 `Σ=σ²I_{mn}`.

**프로베니우스 노름 (Frobenius norm)**:

$$|M|*F := \sqrt{\sum*{i,j} m_{i,j}^2} = |\text{vec}(M)|_2$$

#### 행렬 파라미터에 대한 ES 업데이트 유도

`W ∈ ℝ^{m×n}`을 행렬 파라미터 (일반적으로 신경망 선형 레이어의 가중치)라 하면, 수식 (2)의 가우시안 ES 업데이트를 행렬 파라미터에 적용합니다.

**도출 과정** (부록 B): `vec(W)` = `x`의 부분 집합이라 하면, `v_M ~ N(0, I_{mn})`을 샘플링하는 것은 `E ~ N(0, I_m, I_n)` (등방성 행렬 가우시안)을 샘플링하여 `v_M = vec(E)`로 설정하는 것과 동치입니다. 따라서:

$$\nabla_M J(\theta) = \frac{1}{\sigma} \mathbb{E}_{E \sim P(E)}[E \cdot f(W = M + \sigma E)] \quad \cdots \text{(수식 3)}$$

여기서 `P(E)`는 표준 행렬 정규 분포 `p(E) = N(0, I_m, I_n)`. 몬테카를로 추정:

$$\hat{\nabla}*M J(\theta) = \frac{1}{\sigma N} \sum*{i=1}^N E_i \cdot f(W = M + \sigma E_i)$$

-----

## 3. 관련 연구 (Related Work) — 요약

**3.1 진화 알고리즘**: 역전파 대안으로서 오랜 연구 역사. 분산 병렬 확장성 (Salimans et al. 2017), 딥RL 정책 학습, 메타러닝 (Lu et al. 2022; Goldie et al. 2024), 하이퍼파라미터 튜닝, 약물 발견 등에 적용. 저랭크 구조 선행 연구: PCA 기반 활성 부분공간 탐색 (Choromanski et al. 2019), 저랭크 인수분해 직접 최적화 (Garbus & Pollack 2025).

**3.2 LLM을 위한 ES**: 2-point 0차 기울기 추정기 (MeZO, Malladi et al. 2023), 저랭크 부분공간 투영 (Yu et al. 2025), LoRA 행렬에 직접 ES 적용 (Jin et al. 2024). 최근 Korotyshova et al. (2025)의 ESSA와 Qiu et al. (2025)은 LLM 추론을 위한 ES를 탐구하지만, 모두 상대적으로 작은 집단 크기 (수백 개)를 사용합니다. EGGROLL은 최대 집단 크기가 최대 추론 배치 크기와 같아 수백만 개의 고유 교란을 처리 속도 저하 없이 사용할 수 있습니다.

-----

## 4. EGGROLL 알고리즘

### 4.1 저랭크 진화 전략 (Low-Rank Evolution Strategies)

#### 저랭크 탐색 행렬

수식 (3)의 가우시안 행렬 ES 업데이트에서 전체 랭크 행렬 대신 저랭크 행렬 `AB⊤`을 탐색 행렬로 사용합니다.

> **가정 1 (I.I.D. 샘플링)**: `A ∈ ℝ^{m×r}`와 `B ∈ ℝ^{n×r}`의 모든 원소 `aᵢ,ⱼ ∈ A`, `bᵢ,ⱼ ∈ B`가 영평균 (zero-mean), 대칭, 절대 연속 분포 `p₀(·)`로 **독립 동일하게 분포 (i.i.d.)**하며, 유한한 4차 모멘트 (fourth-order moments)와 단위 분산을 가집니다.
> 
> ※ 이 가정은 라플라스, 정규, 균등 분포 등 일반화 가우시안 분포 계열을 포함한 대부분의 ES 교란 분포를 만족합니다.

저랭크 탐색 행렬:

$$E = \frac{1}{\sqrt{r}} AB^\top$$

`1/√r` 스케일링은 모든 `r`에 대해 E의 분산을 유계로 유지합니다. E는 `ℝ^{m×n}`의 **랭크-r 행렬 다양체 (manifold)** `ℳ_r`에 매핑됩니다.

#### 근사 점수 함수 (Approximate Score Function)

E의 밀도 `p(E)`는 유클리드 공간의 표준 단위 부피에 대해 정의될 수 없고, `log p(E)`의 기울기도 표준 유클리드 공간에서 정의되지 않습니다. 따라서 점수 함수의 근사 `Ŝ(E) : ℝ^{m×n} → ℝ^{m×n}`를 사용하는 저랭크 업데이트를 도입합니다:

$$\hat{g}*{LR} = -\frac{1}{\sigma} \mathbb{E}*{E \sim p(E)}\left[\hat{S}(E) \cdot f(W = M + \sigma E)\right] \quad \cdots \text{(수식 4)}$$

논문의 실험과 분석에서는 **가우시안 근사 점수 함수**를 사용합니다:

$$\hat{S}(E) = -E \quad \cdots \text{(수식 5)}$$

이는 `N(0, I_m, I_n)`의 점수 함수입니다. 이 선택의 이론적 근거:

1. `AB⊤`은 독립적인 영평균 벡터 외적 (vector outer products)의 합으로 분해되므로, **CLT**에 의해 `P(E)`는 랭크 r 증가에 따라 `N(0, I_m, I_n)`으로 분포 수렴합니다.
1. 파라미터 차원 증가에 따라 ES와 EGGROLL 업데이트 모두 가우시안 근사 점수 함수를 사용하는 EGGROLL 업데이트와 일관되는 선형화된 형태로 수렴합니다 (섹션 5).

#### EGGROLL 업데이트 규칙

각 워커 i에 대해 (병렬로), `Aᵢ,ₜ ~ p(Aᵢ,ₜ)`, `Bᵢ,ₜ ~ p(Bᵢ,ₜ)`를 샘플링하고 저랭크 교란 `Eᵢ,ₜ = (1/√r) Aᵢ,ₜBᵢ,ₜ⊤`을 형성합니다. 행렬 파라미터를 다음으로 업데이트합니다:

$$M_{t+1} \leftarrow M_t + \frac{\alpha_t}{N_\text{workers}} \sum_{i=1}^{N_\text{workers}} E_{i,t} f(W = M_t + \sigma E_{i,t}) \quad \cdots \text{(수식 6)}$$

여기서 `1/σ`는 조정 가능한 학습률 `α_t`에 흡수됩니다.

> **중요**: 각 `Eᵢ,ₜ`는 거의 확실히 랭크 r이지만, N_workers개의 랭크-r 행렬의 합인 **전체 파라미터 업데이트의 랭크는 min(Nr, m, n)**입니다. 즉, EGGROLL의 전체 파라미터 업데이트는 저랭크로 제한되지 않습니다. 실험에서 `Nr > min(m,n)`이므로 업데이트는 풀랭크입니다.

-----

### 4.2 하드웨어 효율적 구현 (Hardware-Efficient Implementation)

#### 산술 집약도 분석 (Arithmetic Intensity Analysis)

단일 선형 레이어 (`M ∈ ℝ^{d_out × d_in}`)의 순전파를 고려합니다. 입력 `uᵢ ∈ ℝ^{d_in}`에 대해:

**표준 순전파**: `uᵢ Mᵀ`

- M이 모든 스레드에서 공유되는 효율적 행렬 곱셈
- 산술 집약도 = `Bm / (2B + m)` (B: 배치 크기, m: 차원)

**나이브 ES**: `uᵢ(M + σEᵢ)ᵀ`

- M+σEᵢ의 모든 원소가 단 한 번씩만 사용되는 비효율적 배치 행렬 곱셈
- **산술 집약도 상한 = 1** (배치 크기, 차원에 무관)

**EGGROLL**: `uᵢ(M + σEᵢ)ᵀ = uᵢMᵀ + (σ/√r)(uᵢBᵢ)Aᵢᵀ`

- 기반 활성화를 모든 교란에서 공유하는 표준 행렬 곱셈 보존
- `r=1`인 경우: `uᵢBᵢ`는 길이 `d_in`의 벡터-벡터 내적 배치 (N개의 스칼라 생성), `Aᵢᵀ`에 의한 스칼라-벡터 곱셈으로 처리
- vLLM 같은 배치 LoRA 추론 시스템과 동일한 구조 → 높은 산술 집약도 달성

**업데이트 최적화**: `Σᵢ Eᵢfᵢ` 계산 시 개별 Eᵢ를 명시적으로 구체화하지 않는 최적화를 사용합니다. 랭크-1 경우 `A ∈ ℝ^{N×d_out}`, `B ∈ ℝ^{N×d_in}`를 재구성하여 `(diag(f)A)ᵀB`로 단순 행렬 곱셈으로 계산합니다.

또한 **카운터 기반 결정론적 난수 생성기 (counter-based deterministic RNG**; Salmon et al. 2011; JAX)를 사용하여 필요 시 노이즈를 재생성하므로, 교란 행렬을 메모리에 유지할 필요가 없습니다.

**구체적 수치** (bfloat16, H100 GPU, m=8192):

- 표준 배치 추론에서 산술 집약도 300 달성에 필요한 배치 크기: 324
- EGGROLL (r=1)에서: 352 (표준 추론과 거의 동일)
- 나이브 Gaussian ES: 배치 크기에 무관하게 산술 집약도 < 1

-----

## 5. 이론 분석 (Analysis)

### 5.1 고차원 가우시안 ES (High-Dimensional Gaussian ES)

#### 분석 동기: 가우시안 환형 정리

수식 (2)의 가우시안 ES 업데이트를 고차원에서 분석합니다:

$$\nabla_\mu J(\theta) = \frac{1}{\sigma_d} \mathbb{E}_{v \sim \mathcal{N}(0, I_d)}[v \cdot f(\mu + \sigma_d v)]$$

**가우시안 환형 정리 (Gaussian annulus theorem**; Vershynin 2018)에 의해 표준 가우시안 분포의 확률 질량은 반경 `√d`의 얇은 껍질에 집중됩니다. 차원 d가 증가할수록 탐색 방향이 원점에서 멀어지므로, `σ_d`가 d에 의존하도록 설정하고 ES 업데이트의 수렴을 가져오는 `σ_d`의 **임계 감소율 (critical decay rate)**을 분석합니다.

#### 정규성 가정 (Regularity Assumptions)

> **가정 2 (국소 연속 적합도)**: μ의 무작위 초기화에 대해 거의 확실히 (almost surely), 고정 반경 `ρ > 0`의 볼 `B_ρ(μ) := {x' | ‖x'-μ‖ < ρ}`에서 `f(x)`가 C¹-연속이며, `∇f(x)`가 **α-횔더 연속 (α-Hölder continuous)**:
> $$|\nabla f(x) - \nabla f(y)| \leq L|x - y|^\alpha, \quad \alpha \in (0,1], \quad L = O(1)$$
> 
> ※ 전역 연속성 불필요. 불연속점, 꺾임점, 비미분 가능 영역이 존재할 수 있습니다. α-횔더 연속성은 가우시안 교란 하에서 소실하는 국소 기울기 변동을 보장하는 가장 약한 단순하고 차원-강건한 가정입니다 (α=1이면 립시츠 연속성 회복).

> **가정 3 (전역 다항식 성장)**: O(1)인 상수 `C > 0`와 유한 다항식 차수 `p ≥ 0`가 존재하여:
> $$|f(\mu + \sigma_d v)| \leq C(1 + |\mu + \sigma_d v|^p), \quad |\nabla f(\mu + \sigma_d v)| \leq C(1 + |\mu + \sigma_d v|^p)$$
> 
> ※ 불연속성 허용. 가정 2보다 약하며 (유계성보다 약함), ES에서 사용하는 거의 모든 적합도 함수에서 만족됩니다.

> **가정 4 (유계 도함수)**: `‖μ‖ = O(1)`이고 `‖∇f(μ)‖ = O(1)`, 즉 d 증가에 따라 증가하지 않습니다.
> 
> ※ NTK 레짐 (Neural Tangent Kernel regime; Jacot et al. 2018)에서 표준적이며, 파라미터를 `d^{-1/2}`로 스케일링하거나 `μ ~ N(0, (1/d)I_d)` 가우시안 초기화로 보장합니다.

#### 정리 1: 선형화로의 수렴 (Convergence to Linearity)

**가정 2, 3, 4**가 성립하고 `σ_d = o(d^{-1/2})`이면:

$$|\nabla_\mu J(\theta) - \nabla f(\mu)| = \Theta\left(\left(\sigma_d \sqrt{d}\right)^\alpha\right) = o(1), \quad \text{μ의 분포에 대해 거의 확실히}$$

**증명 핵심 아이디어**:

1. **경첩 함수** `ϕ(x)` (hinge function)를 이용해 `f(x)`를 부드럽게 잘라 `f̃(x) = f(x)·ϕ(x-μ)` 생성
1. ES 업데이트를 부드러운 부분 `∇_μJ̃(μ)`와 나머지 `Δ(μ)`로 분해: `‖∇_μJ(θ) - ∇f(μ)‖ ≤ ‖∇_μJ̃(μ) - ∇f(μ)‖ + ‖Δ(μ)‖`
1. **슈타인 보조정리 (Stein’s lemma)**를 적용하여: `(1/σ_d) E[v·f̃(μ+σ_d v)] = E[∇f̃(μ+σ_d v)]`
1. 볼 내부 (Iloc) — α-횔더 연속성과 `E[‖v‖^α] ~ d^{α/2}`를 이용: `I_loc = O((σ_d√d)^α)`
1. 볼 외부 (Itail) — **가우시안 집중 부등식 (Gaussian concentration inequality)** `P(|‖v‖-√d| ≥ t) ≤ 2exp(-Kt²)` 적용: 지수적으로 감소
1. **타이트니스**: `f(x) = L/2 Σᵢ xᵢ|xᵢ| + a⊤x` (C¹-연속, 립시츠 상수 L) 함수에 대해 하한 `σ_d√d·L√(2/π)`가 달성됨

**해석**: `σ_d = o(d^{-1/2})`이면, ES 업데이트가 국소 1차 도함수 `∇f(μ)`로 수렴합니다. 이는 NTK 유형 정리와 유사하며, d → ∞에 따른 집단 분포의 집중에서 비롯됩니다. 수렴 속도 `(σ_d√d)^α`는 **타이트**합니다.

-----

#### 정리 2: 3차 목적함수에서의 정확한 발산 (Exact Divergence for Cubic Objectives)

3차 다항식을 고려합니다:

$$f(x) = a^\top x + \frac{1}{2} x^\top B x + \frac{1}{6} C(x, x, x) \quad \cdots \text{(수식 7)}$$

여기서 `a ∈ ℝᵈ`, 대칭 `B ∈ ℝ^{d×d}`, 대칭 3-선형 텐서 `C ∈ ℝ^{d×d×d}` (`C(x,x,x) = Σᵢ,ⱼ,ₖ cᵢⱼₖ xᵢxⱼxₖ`).

**‖a‖=O(1), ‖B‖=O(1), ‖C‖=O(1)** (연산자 노름)하고 가정 4가 성립하면:

$$\nabla_\mu J(\theta) = \nabla f(\mu) + \frac{\sigma_d^2}{2} \mathbb{E}_{v \sim \mathcal{N}(0,I_d)}[C(v, v, \cdot)]$$

또한:

$$\left|\frac{\sigma_d^2}{2} \mathbb{E}[C(v,v,\cdot)]\right| = \Theta(\sigma_d^2 \cdot d) \quad \cdots \text{(수식 8)}$$
$$|\nabla_\mu J(\theta) - \nabla f(\mu)| = \Theta(\sigma_d^2 \cdot d) \quad \cdots \text{(수식 9)}$$

**증명 핵심**: `∇f(x) = a + Bx + (1/2)C(x,x,·)`. 슈타인 보조정리 적용 후:

- `B Ev[v] = 0` (영평균 항 소거)
- `σ_d C(v,μ,·)` 항: `C(v,μ,·)`이 v에 선형이므로 영평균 분포 하에서 기대값 0
- `E[‖v‖²] = d`이므로 `‖E[C(v,v,·)]‖ = Θ(d)`

**타이트니스**: `f(x) = u⊤x‖x‖²` (`u = (1/√d)[1,...,1]`)에서 `E[C(v,v,·)] = u(d+2)`, 즉 `Θ(d)` 달성

-----

#### 세 가지 레짐 (Three Regimes)

|레짐                      |조건                 |거동                                    |
|------------------------|-------------------|--------------------------------------|
|**I. 선형화로의 수렴**         |`σ_d = o(d^{-1/2})`|`‖∇_μJ - ∇f(μ)‖ = Θ((σ_d√d)^α) = o(1)`|
|**II. 임계 (Critical)**   |`σ_d ≍ d^{-1/2}`   |`Θ(1)` 크기의 3차 이상 도함수 항 유지             |
|**III. 발산 (Divergence)**|`d^{-1/2} = o(σ_d)`|`‖∇_μJ‖ = Θ(σ_d² d) → ∞`              |


> **임계 레짐에서의 홀수 차수 항**: 2차 항 `Bv`는 대칭성으로 인해 `E[Bv] = 0`으로 소거됩니다. 3차 (홀수) 항이 남는 것은 3차 함수의 `C∞`-연속성 때문으로, 더 빠른 `σ_d²d` 수렴률을 가집니다.

-----

### 5.2 고차원 EGGROLL 분석

#### 추가 가정

> **가정 5 (EGGROLL 국소 연속 적합도)**: `f(x)`가 `B_ρ(μ)` 내에서 C²-연속이며 `‖∇²f(μ)‖`가 d에 대해 다항식 유계이고, `∇²f(x)`가 립시츠 연속:
> $$|\nabla^2 f(x) - \nabla^2 f(y)| \leq L_d |x - y|$$
> ※ 가정 2보다 약간 강한 국소 연속성 요건 (헤시안의 립시츠 연속성). EGGROLL의 교란이 비가우시안이므로 추가 제어 필요.

> **가정 6 (서브-가우시안 꼬리)**: 가정 1에 추가로, `p₀(·)`는 **서브-가우시안 꼬리 (sub-Gaussian tails)**를 가집니다:
> $$P(|x_i| > t) \leq 2\exp(-Ct^2), \quad C < \infty$$
> ※ 가우시안, 균등 분포, 형태 파라미터 > 2인 일반화 가우시안 등에서 자동으로 만족됩니다.

**서브-가우시안 변수 동치 조건** (Vershynin 2018, 2.6.1): 다음 세 조건이 동치:

- `(E[|xᵢ|^p])^{1/p} ≤ C₁√p` (모든 p ≥ 1에 대해)
- `E[exp(xᵢ²/C₂²)] ≤ 2`
- `E[exp(λxᵢ)] ≤ exp(C₃²λ²)` (영평균 경우, 모든 λ)

#### 정리 3: EGGROLL 선형화로의 수렴

`W ∈ ℝ^{m×n}`, `d = mn`, `x = Vec(W)`. **가정 3, 4, 5, 6**이 성립하고, `σ_d = o(d^{-1/2})`, `L_d(σ_d d)² = o(1)`이면 `K > 0`가 존재하여:

$$|\hat{g}_{LR} - \nabla_W f(W=M)|_F = O\left(L_d(\sigma_d d)^2\right) + O\left(\frac{\sqrt{d}}{\sigma_d^2} \exp\left(-K \frac{\rho}{\sqrt{d}\sigma_d}\right)\right) = o(1) \quad \cdots \text{(수식 10)}$$

$$|\hat{g}_{LR} - \nabla_M J(\theta)|_F = O\left(\sigma_d \sqrt{d} \cdot \left(1 + L_d \sigma_d d^{3/2}\right)\right) = o(1) \quad \cdots \text{(수식 11)}$$

μ의 분포에 대해 거의 확실히.

**증명 핵심**: 정리 1의 기법을 저랭크 분포로 확장.

- `v = vec(E) = (1/√r) Σᵢ uᵢ` (`uᵢ = vec(aᵢbᵢ⊤)`)로 분해
- **서브-가우시안 집중 부등식**: `P(|‖a‖-√m| ≥ t) ≤ 2exp(-C't²)` → Lemma 2: `E[‖a‖ⁱ] = O(m^{i/2})`
- **지수 꼬리 한계**: `E ∈ ℝ^{m×n}`의 원소 `Eⱼ,ₖ = (1/√r) Σᵢ aᵢⱼ bᵢₖ` — 서브-가우시안 변수의 곱은 **서브-지수 (sub-exponential)** → Lemma 4: `P(‖σ_d v‖ ≥ ρ) ≤ 2d exp(-C·ρ/(√d σ_d))`
- 볼 내부 (Iloc): C² 연속성과 헤시안 리프시츠 조건으로 `O(L_d(σ_d d)²)` 추정
- 볼 외부 (Itail): 서브-지수 꼬리 한계로 지수적으로 작음

**해석**: 수식 (11)은 `d → ∞`에 따라 EGGROLL이 **r에 무관하게** 참 ES 업데이트 `∇_M J(θ)`로 수렴함을 증명합니다. NTK 레짐에서 `L_d = o(1)` (일반적으로 `d^{-1/2}` 또는 `d^{-1}` 속도)이므로, 수식 (10)에 대입하면 `O(σ²_d d^{3/2})` 또는 `O(σ²_d d)`의 수렴률을 얻습니다.

-----

### 5.3 랭크 분석 (Rank Analysis)

#### 정리 4: EGGROLL 랭크 수렴

> **가정 7 (유계 적합도)**: `f(W)`가 유계, 즉 `sup_W |f(W)| < ∞`.

> **정리 4**: 가정 1과 7이 성립하면:
> $$|\hat{g}^r_{LR} - \nabla_\mu J(\theta)|_F = O(r^{-1}) \quad \cdots \text{(수식 12)}$$

이 `O(r^{-1})` 수렴률은 일반적인 **파라메트릭 CLT (parametric CLT)**가 주는 `O(r^{-1/2})`보다 **빠릅니다**.

**증명 핵심 — 에지워스 전개 (Edgeworth expansion)**:

- `vʳ = (1/√r) Σᵢ uᵢ`의 특성 함수 (characteristic function):
  $$\phi_r(\omega) = \left(\phi_U\left(\frac{\omega}{\sqrt{r}}\right)\right)^r$$
- 로그 특성 함수의 테일러 전개 (4차까지):
  $$r K_U\left(\frac{\omega}{\sqrt{r}}\right) \approx -\frac{|\omega|^2}{2} + \frac{1}{4!r} \sum_{i,j,k,l} \omega_i\omega_j\omega_k\omega_l \kappa^4_{i,j,k,l}$$
- **가정 1의 대칭성 (symmetric zero-mean distribution)**에 의해 **모든 홀수 누율량 (odd cumulants)이 0**: `κ¹ = κ³ = 0`
- 따라서 `O(r^{-1/2})` 항들이 모두 소거되고, **4차 누율량 (fourth-order cumulants)**이 `O(r^{-1})` 속도로 수렴을 지배합니다
- **Bhattacharya & Ranga Rao (1976, Theorem 20.1)** 적용으로 기대값 차이 `O(r^{-1})` 확립

**실용적 함의**: `r=1`에서도 가우시안 근사와의 차이가 작고, `r=10` 이상에서 거의 수렴하며, `r=50` 이상에서 가우시안 극한과 시각적으로 구별 불가능합니다 (Figure 3 참조).

-----

## 6. 실험 (Experiments) — 요약

### 6.1 순수 정수 언어 모델 사전학습

EGGROLL의 일반 최적화 방법으로서의 잠재력을 보이기 위해 **EGG (Evolved Generative GRU)**라는 순수 int8 데이터타입의 비선형 순환 신경망 언어 모델을 사전학습합니다. 명시적 활성화 함수 없이 int8 연산의 클리핑이 암묵적 비선형성으로 작동합니다.

EGG 6L-256D 모델을 minipile 데이터셋에서 문자 수준 예측으로 학습합니다. 집단 크기 2에서 1,048,576 (2²⁰)까지 범위로 실험합니다. 최적 테스트 손실 **3.40 bits/byte**로, 동일 데이터 배치 크기로 역전파 SGD로 학습한 dense fp32 Transformer (3.58 bits/byte)를 능가합니다.

특히 집단 크기 2² (MeZO와 유사)는 대규모 집단보다 유의미하게 낮은 성능을 보여, 사전학습에는 대규모 집단 크기가 필수임을 시사합니다.

### 6.2 강화학습 벤치마크

16개 환경 (Navix, Craftax, Brax, Kinetix, Jumanji)에서 EGGROLL과 OpenES를 비교합니다. 3-레이어 MLP 정책 (256 은닉 유닛). 결과: 7/16 환경에서 동등, 2/16에서 열세, 7/16에서 우세. 배치 저랭크 구조로 인해 상당한 벽시계 시간 (wall-clock time) 개선 달성.

### 6.3 기반 모델 파인튜닝

RWKV-7 (Peng et al. 2025) 모델에 카운트다운 및 GSM8K 태스크 파인튜닝. **점수 함수** (GRPO의 그룹 상대적 이득과 유사):

$$\bar{s}*i = \frac{1}{m} \sum_j \frac{s*{i,j} - \mu_{q_j}}{\bar{\sigma}}$$

주요 결과: RWKV-7 1.5B 카운트다운 과제 35% vs 23%. 14B 파라미터 모델: AIME24 13% → 30%, AIME25 7% → 33% (32 GPU, 12시간). GRPO는 Adam 옵티마이저의 추가 메모리로 14B 모델에서 불가능.

### 6.4 정수 양자화 LLM 파인튜닝

Jacob et al. (2017) 절차로 RWKV-7 int8 양자화 후, EGGROLL+Adam으로 KL 발산 기반 모델 증류 (model distillation):

$$f_{\mu_i}(x_{1:T}) = \sum_t \mathrm{KL}(p_t | q_t(\cdot; \mu_i))$$

-----

## 7. 결론 (Conclusion)

EGGROLL은 저랭크 탐색 행렬을 사용하여 진화 전략을 10억 파라미터 이상의 모델로 확장하는 강력한 블랙박스 최적화 방법입니다. 랭크-1에서도 EGGROLL이 효과적이며, 전체 랭크 교란 대비 미미한 성능 하락으로 상당한 계산 및 메모리 절약을 달성합니다.

이론 분석은 랭크 r과 파라미터 차원 d 증가에 따라 EGGROLL 업데이트가 가우시안 ES 업데이트로 수렴하고, 고차원에서 수렴 및 선형화를 위한 필요충분 조건을 유도함을 보입니다.

향후 방향: EGGROLL은 미분 불가능한 구성요소를 가진 대규모 **신경기호 시스템 (neurosymbolic systems)**, 기호 모듈과 인터페이스하는 신경망, 복잡한 시스템에서 다른 에이전트와의 상호작용을 인식하는 LLM 시스템의 엔드-투-엔드 최적화를 가능하게 할 것입니다.

-----

## 부록 A. 표기법 (Notation)

증명에서 사용하는 적분 표기법 및 연산자 정의입니다.

**행렬 공간 적분**: `E ∈ ℝ^{m×n}`에 대해 `∫f(E)dE = ∫_{ℝ^{m×n}} f(E)dE`

**mat 연산자**: `v ∈ ℝ^{mn}`에 대해

$$\text{mat}(v) = \begin{pmatrix} v_1 & v_{m+1} & \cdots & v_{(n-1)m+1} \ v_2 & v_{m+2} & \cdots & v_{(n-1)m+2} \ \vdots & \vdots & \ddots & \vdots \ v_m & v_{2m} & \cdots & v_{mn} \end{pmatrix}$$

`mat(vec(M)) = M`이 성립합니다. **중요 등식**:

$$|M|_F = |\text{vec}(M)| \quad \cdots \text{(수식 13)}$$

**푸리에 변환 (Fourier transform)** (증명에서 활용):

$$\tilde{f}(\omega) = \mathcal{F}[f](\omega) := \int f(v) \exp(-i\omega^\top v) dv$$
$$f(v) = \mathcal{F}^{-1}[\tilde{f}](v) := \frac{1}{(2\pi)^d} \int \tilde{f}(\omega) \exp(i\omega^\top v) d\omega$$

-----

## 부록 B. ES 행렬 기울기 유도 (ES Matrix Gradient Derivations)

수식 (3)의 완전한 유도입니다.

`μ_M = vec(M) ∈ ℝ^{mn}`을 행렬 M의 평균 파라미터 벡터라 하고, `v_M ∈ ℝ^{mn}`을 대응하는 탐색 벡터라 하면, 각 원소가 독립적으로 표준 정규 `N(0,1)`에서 생성되므로 `v_M ~ N(0, I_{mn})`. 수식 (2)로부터:

$$\sigma \nabla_{\mu_M} J(\theta) = \mathbb{E}*{v_M \sim \mathcal{N}(0, I*{mn})}[v_M \cdot f(W = \text{mat}(\mu_M) + \sigma \text{mat}(v_M))]$$

`v_M = vec(E)`, `E = mat(v_M)`으로 치환하면 `v_M ~ N(0, I_{mn})`은 `E ~ N(0, I_m, I_n)` (등방성 행렬 가우시안)과 동치이므로:

$$= \mathbb{E}_{E \sim \mathcal{N}(0,I_m,I_n)}[\text{vec}(E) \cdot f(W = M + \sigma E)]$$

이제 mat 연산자를 적용하면:

$$\nabla_M J(\theta) = \text{mat}(\nabla_{\mu_M} J(\theta)) = \frac{1}{\sigma} \mathbb{E}_{E \sim \mathcal{N}(0,I_m,I_n)}[E \cdot f(W = M + \sigma E)]$$

마지막으로 등방성 행렬 가우시안의 점수 함수 `∇_E log p(E) = -E`를 이용하면:

$$= -\frac{1}{\sigma} \mathbb{E}_{E \sim \mathcal{N}(0,I_m,I_n)}[\nabla_E \log p(E) \cdot f(W = M + \sigma E)]$$

이는 수식 (3)을 확인합니다.

-----

## 부록 C. 고차원 분석 (High-Dimensional Analysis)

### C.1 정리 1 증명 보조 정리: 다항식 꼬리 한계 (Polynomial Tail Bounds)

> **보조정리 1 (다항식 꼬리 한계)**: `g(x)`가 `‖g(μ+σ_d v)‖ ≤ C‖v‖^q(1+‖μ+σ_d v‖^p)`로 다항식 유계이고, `A_d := {‖σ_d v‖ ≥ ε}`를 볼 외부 사건이라 하면, `σ_d = o(d^{-1/2})`이면 `K > 0`가 존재하여:
> $$\left|\mathbb{E}_{v \sim \mathcal{N}(0,I_d)}[g(\mu+\sigma_d v) \mathbf{1}(A_d)]\right| = O\left(d^{q/2} \exp\left(-K\left(\frac{\varepsilon}{\sigma_d}\right)^2\right)\right) = o(1)$$

**증명 핵심**:

- 코시-슈바르츠 부등식 (Cauchy-Schwarz inequality)과 다항식 유계 적용
- `‖v‖`는 χ_d 분포 → `E[‖v‖^i] = 2^{i/2} Γ((d+i)/2) / Γ(d/2) ~ d^{i/2}` (점근 공식 사용)
- 가우시안 집중 부등식: `P(|‖v‖-√d| ≥ t) ≤ 2exp(-Kt²)`

`P(A_d) = P(‖v‖ ≥ ε/σ_d)`를 바운딩하기 위해 `t = ε/σ_d - √d`를 설정합니다. `σ_d√d = o(1)` 조건이 `t ≥ 0`을 보장합니다. 따라서:

$$P(A_d) = O\left(\exp\left(-K\left(\frac{\varepsilon}{\sigma_d}\right)^2\right)\right)$$

이것이 수렴에 `σ_d√d = o(1)` 조건이 **필수적**인 이유입니다. 더 느린 속도 `1 = o(σ_d√d)`이면 가우시안 확률 질량이 국소 볼에서 빠져나가 꼬리가 증가합니다.

### C.2 임계 수렴률 (Critical Convergence Rate) — 정리 2 증명 개요

`f(x)`의 기울기: `∇f(x) = a + Bx + (1/2)C(x,x,·)`

슈타인 보조정리 적용 후 정리하면:
$$\nabla_\mu J(\theta) = a + B\mu + \frac{1}{2}C(\mu,\mu,\cdot) + \frac{\sigma_d^2}{2} \mathbb{E}[C(v,v,\cdot)]$$

처음 세 항이 `∇f(μ)`이고, 나머지가 오차항입니다. `B Ev[v]=0`과 `C(v,μ,·)`의 v에 대한 선형성 → 영평균 기대값 0.

`‖E[C(v,v,·)]‖ = Θ(d)` 타이트니스는 `f(x) = u⊤x‖x‖²` (`u⊤ = (1/√d)[1,...,1]`)에서 `E[C(v,v,·)] = u(d+2)`로 달성됩니다.

### C.3 EGGROLL 선형화 (정리 3 증명 개요)

`v = vec(E) = (1/√r) Σᵢ uᵢ` (`uᵢ = vec(aᵢbᵢ⊤)`)

**핵심 보조정리들**:

- **Lemma 2**: 가정 6 하에서 `E[‖a‖^i] = O(m^{i/2})`, `E[‖b‖^i] = O(n^{i/2})`  
  (층 케이크 표현, 서브-가우시안 집중 부등식으로 증명)
- **Lemma 3**: 고정 r에 대해 `E_v[‖v‖^i] = O((rmn)^{i/2})`
- **Lemma 4 (지수 꼬리 한계)**: 원소 `Eⱼ,ₖ = (1/√r) Σᵢ aᵢⱼ bᵢₖ` — 서브-가우시안 변수의 곱은 **서브-지수 (sub-exponential)** (Vershynin 2018, Lemma 2.8.6). 유한 합은 서브-지수 유지. 따라서:
  $$P(|\sigma_d v| \geq \rho) \leq 2d \exp\left(-C\frac{\rho}{\sqrt{d}\sigma_d}\right)$$
- **Lemma 5 (EGGROLL 꼬리 한계)**: 위를 이용하여 `‖E_v[g(μ+σ_d v)1(A_d)]‖ = O(√d \exp(-K·ρ/(√d σ_d))) = o(1)`

EGGROLL 업데이트를 볼 내부와 외부로 분해합니다. 내부는 2차 테일러 전개와 헤시안 립시츠 조건으로 `O(L_d(σ_d d)²)`, 외부는 Lemma 5로 지수적으로 작습니다.

-----

## 부록 D. 점근 랭크 분석 (Asymptotic Rank Analysis)

### 핵심 보조정리들

> **Lemma 6**: 가정 1 하에서 `uᵢ = vec(aᵢbᵢ⊤)`는 **항등 공분산 행렬**을 가집니다: `Σ_u = I_d`
> 
> **증명**: 대각 원소 `E[(aᵢbⱼ)²] = E[aᵢ²]E[bⱼ²] = 1`. 비대각 원소 `E[aᵢbⱼ aₖbₗ] = 0` (i≠k 또는 j≠l).

> **Lemma 7 (에지워스 전개)**: 2차 에지워스 전개에서 `P(vʳ)`의 근사 밀도:
> $$\hat{p}(v^r) = g(v^r) + \frac{1}{4!r} g(v^r) \sum_{i,j,k,l} \kappa^4_{i,j,k,l} H_{i,j,k,l}(v^r)$$
> 여기서 `H_{i,j,k,l}`은 4차 에르미트 다항식 (Hermite polynomial).
> 
> **증명**: 특성 함수의 로그 `r K_U(ω/√r)` 전개 → 3차 누율량 = 0 (대칭성) → 4차 항 `O(r^{-1})`만 남음

> **Lemma 8**: 가정 1, 7 하에서:
> $$\left|\mathbb{E}*{v^r}[v^r f(v^r)] - \mathbb{E}*{\hat{v}}[\hat{v} f(\hat{v})]\right| = O(r^{-1})$$

**정리 4의 완전한 증명**: 프로베니우스 노름을 벡터 형태로 변환 후,

$$|\nabla_\mu J(\theta) - \hat{g}^r_{LR}|*F = \frac{1}{\sigma}|E_v[vf(v)] - E*{v^r}[v^r f(v^r)]|$$

에지워스 전개가 `P(vʳ)`와 `P(v)` 모두에서 동일한 분포로 나타남을 이용하여:

$$|E_v[vf(v)] - E_{v^r}[v^r f(v^r)]| \leq |E_v[vf(v)] - E_{\hat{v}}[\hat{v}f(\hat{v})]| + |E_{\hat{v}^r}[\hat{v}^r f(\hat{v}^r)] - E_{v^r}[v^r f(v^r)]|$$

Lemma 8 두 번 적용 → 각각 `O(r^{-1})` → **정리 4 증명 완료**.

-----

### D.1 평균장 점수 함수 근사 (Mean Field Score Function Approximator)

**베셀 함수 (Bessel functions)** `Kₙ(z)` (제2종 변형 베셀 함수):

$$K_n(z) = \int_0^\infty \exp(-z \cosh\theta) \cosh(n\theta) d\theta$$

**핵심 관계식**:

- `dK₀(z)/dz = -K₁(z)` (재귀 관계)
- `dKₙ(z)/dz = (n/z)Kₙ(z) - Kₙ₊₁(z)` (일반 관계)

#### D.2 평균장 근사 유도 (Derivation of Mean-field Approximators)

> **가정 8**: 각 원소 `aᵢ,ⱼ ~ GG(s, p)`, `bᵢ,ⱼ ~ GG(s, p)` (**일반화 가우시안 분포**, Generalised Gaussian Distribution):
> $$\text{GG}(x|s,p) = \frac{p}{2s\Gamma(1/p)} \exp\left(-\left|\frac{x}{s}\right|^p\right)$$
> 
> - `p=1`: 라플라스 분포
> - `p=2`: 가우시안 분포
> - `p→∞`: `[-s, +s]` 균등 분포

원소들의 독립성을 가정하면 `p(E) ≈ ∏_{i,j} p(Eᵢ,ⱼ)` (평균장 근사). 점수 함수를 원소별로 적용:

$$[∇_E \log p(E)]*{i,j} \approx \hat{S}(E*{i,j}) = \partial_{E_{i,j}} \log p(E_{i,j})$$

> **정리 5** (`r=1`인 경우의 주변 분포): 가정 8과 `r=1` 하에서, `Eᵢ,ⱼ = aᵢbⱼ`의 분포:
> $$p(E_{i,j}) = \frac{p}{\left(s\Gamma(1/p)\right)^2} K_0\left(\frac{2|E_{i,j}|^{p/2}}{s^p}\right)$$
> 주변 점수 함수:
> $$\hat{S}(E_{i,j}) = -\frac{K_1\left(\frac{2|E_{i,j}|^{p/2}}{s^p}\right)}{K_0\left(\frac{2|E_{i,j}|^{p/2}}{s^p}\right)} \cdot \frac{p|E_{i,j}|^{p/2-1}\text{sign}(E_{i,j})}{s^p}$$
> 
> **증명**: 두 독립 GGD 변수 곱의 분포를 구하고, 치환 `x=(aᵢ/s)^p` 후 베셀 함수 적분 표현 `K₀(z) = (1/2)∫₀^∞ exp(-x-z²/(4x)) (1/x) dx` 활용.

> **정리 6** (`r > 1`, `p=2` 가우시안 경우): 가정 8과 `p=2` 하에서:
> $$p(E_{i,j}) = \frac{2\sqrt{r}|\sqrt{r}E_{i,j}|^{(r-1)/2}}{s^{r+1}\sqrt{\pi}\Gamma(r/2)} \cdot K_{(r-1)/2}\left(\frac{2|\sqrt{r}E_{i,j}|}{s^2}\right)$$
> 점수 함수:
> $$\hat{S}(E_{i,j}) = \frac{r-1}{E_{i,j}} - \frac{2\sqrt{r}\text{sign}(E_{i,j})}{s^2} \cdot \frac{K_{(r+1)/2}\left(\frac{2|\sqrt{r}E_{i,j}|}{s^2}\right)}{K_{(r-1)/2}\left(\frac{2|\sqrt{r}E_{i,j}|}{s^2}\right)}$$
> 
> **증명**: `Zᵢ,ⱼ = √r Eᵢ,ⱼ = Σᵢ uᵢ,ⱼ,ₗ` (r개 변수의 합). 각 `uᵢ,ⱼ,ₗ`의 분포 (정리 5 결과)를 r번 합성하기 위해 특성 함수 `F[K₀(2|·|/s²)](ω) = π/√(ω²+(2/s²)²)` 활용 → Gradshteyn & Ryzhik 적분표 사용.

-----

## 부록 E. EGGROLL 속도 측정 (EGGROLL Speed)

모든 타이밍은 단일 GPU (GH200 = H100 상당)에서 bfloat16, 선형 모델 차원 8192, 최대 배치 크기 1024로 측정합니다.

노이즈를 사전 생성한 경우: EGGROLL 91%, PPO 34%, OpenES 0.41% (최대 배치 추론 처리량 대비).

JAX PRNG로 온더플라이 (on-the-fly) 노이즈 재생성 시: EGGROLL 69%, OpenES 0.054%. 저랭크 교란은 소량의 메모리만 필요하므로 (원래 파라미터 행렬 크기의 제곱근에 비례) 사전 생성도 실용적입니다.

-----

## 부록 F. 산술 집약도 상세 분석 (Arithmetic Intensity Analysis)

`(b)float16` 데이터타입, H100 GPU: 약 1000 TFLOPS (연산), 3.35 TB/s (메모리 대역폭). **루프라인 임계값 (roofline threshold)**: 약 300 ops/byte.

단일 선형 레이어 `M ∈ ℝ^{d_out × d_in}`, 배치 `u ∈ ℝ^{B×d_in}`, 정밀도 s bytes/원소.

**F.1 표준 배치 추론**:
$$\text{산술 집약도} = \frac{B \cdot d_{in} \cdot d_{out} \cdot 2}{B \cdot d_{in} \cdot s + B \cdot d_{out} \cdot s + d_{out} \cdot d_{in} \cdot s} \overset{s=2, d_{out}=d_{in}=m}{=} \frac{Bm}{2B+m}$$

300 ops/byte 달성에 필요한 최소 배치 크기 `B = Am/(m-2A)` → m=8192이면 **B=324**

**F.2 Gaussian Matrix ES** (사전 생성된 교란 `R^{B×d_out×d_in}` 사용):
$$= \frac{d_{in} \cdot d_{out} \cdot 2}{d_{in} \cdot s + d_{out} \cdot s + d_{out} \cdot d_{in} \cdot s} \overset{s=2, m}{=} \frac{m}{2+m} < 1$$

**배치 크기에 무관하게 산술 집약도 < 1**. 이는 각 원소가 단 한 번만 사용되기 때문입니다.

**F.3 EGGROLL** (분해된 교란 `A ∈ R^{B×d_out×r}`, `B ∈ R^{B×d_in×r}` 사용):
$$\approx \frac{m+2r+1/2}{2+r(2+2/m)+m/B} \quad \text{(단순화된 형태)}$$

300 ops/byte 달성 최소 배치 크기: m=8192, r=1이면 **B=352** (표준 추론의 324와 거의 동일). 표준 추론 대비 추가 연산량: `(4r+1)/(2m)` — 큰 행렬에서 무시 가능.

**결론**: EGGROLL만이 naïve ES와 달리 표준 추론과 유사한 산술 집약도로 고유 교란을 포화 계산할 수 있습니다.

-----

## 부록 G. EGG 아키텍처 (EGG Architecture)

### G.1 설계 동기

EGGROLL이 역전파에 의존하지 않으므로, 추론 시 효율적이고 하드웨어 친화적인 언어 모델 아키텍처를 명시적으로 설계할 수 있습니다. EGG의 설계 제약:

- **순수 정수 학습**: int8은 H100에서 가장 빠른 데이터타입이며 int8 행렬 곱 + int32 누산이 가장 빠른 텐서 코어 연산입니다. 표준 양자화 인식 학습 (quantization aware training)과 달리 부동소수점 활성화가 불필요합니다.
- **비선형 RNN**: 역전파 불필요 → 비제한 시퀀스 길이에서 비선형 RNN 학습 가능. Transformer/SSM보다 단순한 상태 추적 가능.
- **활성화 함수 제거**: int8 연산의 클리핑이 암묵적 비선형성을 제공합니다 (Foerster 2017 영감).

### G.2 표기법 및 연산

- `Iₙ`: n비트 부호 있는 정수, `Uₙ`: n비트 부호 없는 정수
- 유효 범위: I8은 [-127, 127] (−2⁷은 무효)
- `u@M`: 스케일된 벡터-행렬 곱 `I₈ⁿ × I₈^{n,m} → I₈ᵐ` (int8 텐서 코어, int32 누산 및 스케일링)

### G.3 파라미터 초기화

표준 정규 × 16을 I8로 반올림. 모델 파라미터:

- `θ_emb ∈ I₈^{256×D}` (임베딩), `θ_head ∈ I₈^{256×D}` (출력 헤드)
- `θ_ln ∈ I₈^D` (레이어 정규화 가중치, 16으로 초기화)
- 총 파라미터: `513D + l(4D + 12D²)`

### G.4 행렬 곱셈

텐서 코어 스케일된 곱셈:

$$u @ M := I_8\left(\frac{uM}{16\sqrt{n}}\right)$$

`n=4d`이면 나눗셈이 오른쪽 비트 시프트 `4+d`로 구현됩니다. M의 원소가 `16 × N(0,1)`에서 초기화되므로, 이 스케일링이 출력의 표준편차를 16으로 유지합니다.

### G.5~G.7 임베딩, 레이어 정규화 (LN), MLP

**레이어 정규화**: 평균 절댓값 (mean absolute value) `u_mav = I₈(sum(|u|) >> (2d))`로 나누기 — 제곱근이 정수에서 비싸기 때문. L1 정규화 후 범위를 D로 유지하여 I8의 정보 손실을 최소화합니다. 나눗셈은 2^{16} × 2^8 룩업 테이블로 사전 계산됩니다.

**MLP**: 두 행렬 `θ₁ ∈ I₈^{4D×D}`, `θ₂ ∈ I₈^{D×4D}`. 출력: `(u@θ₁ᵀ)@θ₂ᵀ`. @ 연산 자체가 I32→I8 변환의 포화 클리핑으로 비선형이므로 별도 활성화 함수 불필요.

### G.8 GRU

```
f  = σ(I₈(I₃₂(u@θ_Wfᵀ) + I₃₂(s@θ_Ufᵀ) + I₃₂(θ_bf)))
f̂  = I₈(((I₃₂(f) + 127) ⊙ I₃₂(s)) >> 8)
ĥ  = ϕ(I₈(I₃₂(u@θ_Whᵀ) + I₃₂(f̂@θ_Uhᵀ) + I₃₂(θ_bh)))
h  = s + I₈(((I₃₂(f) + 127) ⊙ (I₃₂(ĥ) - I₃₂(s))) >> 8)
```

표준 GRU의 sigmoid를 항등 함수로 대체 (시그모이드는 [0,1] 범위, I8은 [-127,127]). f에 127을 더해 [0,254] 범위로 이동 후 s와 곱셈 → 8비트 오른쪽 시프트로 I8 동적 범위 복원.

### G.9 정수 타입에서의 적합도 계산

다음 토큰 예측의 로그 우도 (log-likelihood)를 정수 룩업 테이블로 구현:

- `EXP2[i] = 16 × 2^{i/16}` (U8 입력)
- `LOG2[i] = 16 × log₂(i/16)` (최대 2^{28} 엔트리 사전 계산)

-----

## 부록 H. 정수 EGGROLL 사전학습 (EGG Pretraining with Integer EGGROLL)

### H.1 EGGROLL 교란 추가

파라미터 `θ ∈ I₈^{m×n}` 행렬에 대해 랭크-1 교란 벡터 `A ∈ I₈ᵐ`, `B ∈ I₈ⁿ`를 샘플링합니다. 입력 `u ∈ I₈ⁿ`에 대해:

$$I_8\left(\frac{u\theta^T + ((u \cdot B) I_{32}(A)) >> (4+\hat{\sigma})}{16\sqrt{n}}\right)$$

여기서 `σ̂`는 하이퍼파라미터 (`σ = 2^{-σ̂}`). 가속기에서 부동소수점 연산 불필요 — 전체 훈련이 정수 연산으로 진행됩니다.

### H.2 적합도 형성 (Fitness Shaping)

**대척쌍 기반 (antithetical pairs)**: 양성 샘플 `s⁺`와 음성 샘플 `s⁻`로부터:

$$\text{sign}(s^+ - s^-)$$

적합도 값은 `{-1, 0, +1}`만 가능합니다.

### H.3 파라미터 업데이트

`A ∈ I₈^{N×m}`, `B ∈ I₈^{N×n}`, 형성된 피트니스 `F ∈ I₈^N`에 대해 중간값:

$$E = (\text{diag}(F) A)^T B \in I_{32}^{m \times n}$$

**임계값 기반 업데이트**: |E| > 임계값이면 θ를 한 단계 (±1) 이동. 임계값:

$$I_{32}\left(16 \times \Phi^{-1}\left(1 - \frac{\alpha}{2}\right)\right) \times 16\sqrt{N}$$

(Φ는 정규 누적분포함수). α ≈ 업데이트되는 파라미터 비율. 255개 고유값만 가진 I8에서 단위 스텝 업데이트는 안정성을 개선합니다. 최적 설정: `σ̂=4`, α는 `1/(0.015t+1)`로 감쇠.

-----

## 부록 I. EGG 절제 연구 (EGG Ablations)

고정 데이터 배치 크기 16에서 집단 크기 4¹~4¹⁰ (최대 1,048,576)과 데이터 배치 크기 4¹~4⁵ (최대 1,024)를 함께 변화시킵니다.

관찰: 각 집단 크기에서 최종 테스트 손실은 특정 데이터 배치 크기 임계값 이상에서 거의 일정합니다. 주어진 집단 크기 N에서 최적 성능을 위한 최소 배치 크기는 약 `N/4^6`으로 나타납니다. 즉, 큰 집단 크기는 더 큰 데이터 배치가 필요합니다.

-----

## 부록 J. 분산 EGGROLL 프레임워크 (Distributed EGGROLL Framework)

### J.1 베이스-3 적합도 패킹 (Base-3 Fitness Packing)

대척쌍 (antithetic pairs) 평가로 신호가 `{+1, 0, -1}` → `{0, 1, 2}`로 매핑. 5개를 하나의 바이트로 패킹:

$$\text{byte} = \sum_{i=0}^4 v_i \cdot 3^i$$

유효 비트율 1.6 bits/value (이론 한계 `log₂3 ≈ 1.585`에 근접). 네트워크 페이로드: 약 `52 + chunk_size/10` bytes → 대역폭 사용이 모델 크기에 독립적.

### J.2 시스템 아키텍처

**코디네이터-워커 토폴로지**: 코디네이터는 전역 상태 유지 및 집단 청크 할당. 워커는 GPU에서 적합도 계산, 신호 형성 (청크 평균 필터링, 적응 임계값), 패킹된 3진 적합도만 반환.

-----

## 부록 K. 정수 양자화 모델 파인튜닝 (Fine-tuning of Integer Quantised Models)

### K.1 양자화 절차

Jacob et al. (2017) 방식의 채널별 대칭 int8 양자화. 각 출력 채널 i에 대해:

$$s_i = \max\left(\frac{\max_j |W_{i,j}|}{127}, \epsilon\right)$$

양자화 가중치:

$$Q_{i,j} = \text{clip}\left(\text{round}\left(\frac{W_{i,j}}{s_i}\right), -127, 127\right) \in I_8$$

### K.2 정수 양자화 EGGROLL + Adam 통합

1. EGGROLL이 블랙박스 ES 최적화로 bf16 기울기 추정
1. Adam (Optax)이 모멘트 추정으로 업데이트 제안 u 생성
1. **z-점수 정규화 후 임계값 처리**로 정수 스텝 결정:

$$z = \frac{u - \mu(u)}{\sigma(u) + 10^{-8}}, \quad \Delta = \text{sign}(z) \cdot \mathbf{1}{|z| \geq \tau} \in {-1,0,+1}^{m\times n}$$

$$Q \leftarrow \text{clip}(Q + \Delta, -127, 127)$$

Adam의 크기 및 이력 인식 제안과 정수 제약 강제의 결합으로 안정적이고 희소한 업데이트 패턴을 달성합니다. Adam 옵티마이저 상태는 bf16으로 저장하여 메모리 절약.

-----

## 부록 L. 사전 학습된 Transformer LLM 파인튜닝 (Fine-tuning Pretrained Transformer LLMs)

### L.1 결과 요약

Qwen3-4B-Base 모델을 DeepScaleR (40k 수학 문제)로 파인튜닝. CoT (chain-of-thought) 생성 후 최종 답 추출 및 검증으로 적합도 계산.

|모델           |MATH500|OlympiadBench|AIME24|Average|
|-------------|-------|-------------|------|-------|
|Qwen3-4B-Base|50.2   |24.4         |10.0  |28.0   |
|+EGGROLL     |75.8   |37.3         |13.3  |41.4   |
|+RL          |67.4   |33.5         |16.7  |41.4   |

EGGROLL이 동일한 RL 실험과 매칭됩니다 (LoRA rank 1, 집단 크기 2048). 또한 EGGROLL은 **pass@k** (k=4)를 최적화 가능 — RL로는 미분 불가능하여 최적화 불가. pass@k 최적화 시 답변 다양성이 증가하고, pass@1 최적화 시에는 감소합니다.

### L.2 대규모 Transformer LLM 학습 인프라

vLLM을 사용하여 EGGROLL을 대규모 Transformer LLM에 적용하기 위한 시스템 최적화:

- **Custom WorkerExtension**: vLLM 추론 엔진을 학습 가능한 런타임으로 변환. 텐서 병렬 처리의 융합 가중치 (qkv_proj 등)를 aware하여 LoRA 업데이트를 올바르게 분해/적용
- **레이어별 메모리 관리**: OOM 방지를 위한 스트리밍 방식 레이어별 ES 가중치 적용. 메모리 오버헤드가 모델 깊이에 무관하게 유지
- **직접 GPU-to-GPU 가중치 동기화**: NCCL (PyNcclCommunicator)을 통한 하드웨어 직접 전송
- **Meta-Device 청사진**: 제어 노드 RAM을 초과하는 모델을 위해 `accelerate.init_empty_weights`로 가중치 형상/분할 정보만 추론

-----

## 부록 M. 고빈도 거래 (High-Frequency Trading) 파인튜닝

EGGROLL을 **지정가 주문장 (Limit Order Book, LOB)** 데이터의 시계열 기반 모델 파인튜닝에 적용합니다.

**배경**: S&P 500 구성종목만으로 2016~2021년 약 3.8조 토큰의 주문 흐름 데이터 생성 (대형 자연어 코퍼스와 비견). 주문 실행 (order execution) 태스크: T=10 스텝 내에 Q=30주 매도, 적합도는 실현 손익 (PnL) 순위 기반 변환.

**모델**: LOBS5-360M (S5 아키텍처; Smith et al. 2023)을 LOBSTER GOOG 2022 데이터 (약 25B 토큰)로 사전 학습 후, EGGROLL로 파인튜닝 (LoRA rank 4, σ=0.01, 병렬 세대 65,536, 6,500 에포크).

**결과**: 기준선 (σ=0) 평균 PnL ≈ 4,700 → EGGROLL 학습 후 ≈ 12,000 (**155% 향상**). PnL 표준편차는 2,500 에포크까지 탐색 단계에서 증가 후 수렴 단계에서 감소.

-----

## 부록 N. 실험 세부사항 (Experimental Details) — 요약

**N.1 멀티에이전트 RL (MARL)**: 3개의 협력적 다중 입자 환경 (MPE; Lowe et al. 2017)에서 JaxMARL로 구현, 너비 64, 깊이 3 피드포워드 네트워크. EGGROLL이 rank-1로 OpenES 대비 최대 2.4배 빠름.

**N.2 카운트다운 실험 (Reasoning: Countdown)**: RWKV 7g1.5B, H200 GPU, 8시간. ES σ=7×10⁻⁴, rank=1, 집단 크기 256. RWKV 7g7B 8-GPU 확장 시: EGGROLL 72.9% vs GRPO 52.8% vs OpenES 66.8%.

**N.3 GSM8K 실험**: RWKV 7g7B, 8×H200, 8시간. ES σ=2×10⁻³ (더 큰 집단 크기 8,192로 안정적 탐색), rank=1.

**N.4 RL 실험**: 각 알고리즘-환경 쌍별 20회 랜덤 탐색 HPO → 최고 설정으로 10 시드 평가. EGGROLL이 7/16에서 동등, 2/16에서 열세, 7/16에서 우세. 속도는 환경에 따라 1.29x 느림~40.68x 빠름.

-----

## 주요 참고문헌 (Key References)

- **Rechenberg (1978); Beyer & Schwefel (2002)** — 진화 전략 원론
- **Salimans et al. (2017)** — OpenES: 확장 가능한 RL 대안으로서의 ES (병렬 ES 기준 알고리즘)
- **Hu et al. (2022)** — LoRA: 저랭크 LLM 적응 (EGGROLL 구조의 기반)
- **Jacot et al. (2018); Lee et al. (2019)** — 신경 접선 커널 (NTK), 고차원 선형화 이론
- **Malladi et al. (2023)** — MeZO: 순전파만으로 LLM 파인튜닝 (비교 대상)
- **Qiu et al. (2025)** — 대규모 ES LLM 파인튜닝 (비교 대상)
- **Peng et al. (2025)** — RWKV-7 (실험 모델)
- **Vershynin (2018)** — 고차원 확률론: 가우시안 환형 정리, 집중 부등식
- **Bhattacharya & Ranga Rao (1976)** — 에지워스 전개 이론 (랭크 수렴 증명에 활용)
- **Salmon et al. (2011); JAX (Bradbury et al. 2018)** — 카운터 기반 결정론적 RNG (메모리 효율)
- **Shao et al. (2024)** — GRPO (비교 대상 후학습 알고리즘)
- **Jacob et al. (2017)** — 정수 양자화 절차