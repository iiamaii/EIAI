---
title: 이론 배경 5 — 고차원 Gaussian 집중과 랭크 수렴 이론
author: ws
captured_at: 2026-04-24
contributor: ws
note_type: theory_background
supports: [raw/formulation_layer_S_theorems_4_5.md]
---

# 이론 배경 5 — 고차원 Gaussian 집중과 랭크 수렴 이론

Layer S Theorem 5 (Noise Tolerance)와 EGGROLL의 O(r⁻¹) rank convergence 경계는 고차원 Gaussian의 기하학적 성질에 의존합니다. 이 노트는 그 수학적 기반: Gaussian annulus 정리, CLT와 그 개선 (Edgeworth 전개), 그리고 NTK(Neural Tangent Kernel)의 kernel 해석이 우리 formulation에 어떻게 접속되는지 정리.

---

## 1. 고차원 Gaussian의 집중 현상

### 기본 관찰

`d`-차원 Gaussian `X ~ 𝒩(0, I_d)`의 norm:
```
  E[‖X‖²] = d     (chi-square 분포의 기댓값)
  Var[‖X‖²] = 2d  (chi-square의 분산)
  Std[‖X‖²]/E[‖X‖²] = √(2/d) → 0  as d → ∞
```
즉 **상대 표준편차가 0으로 수렴**. 따라서 `‖X‖ ≈ √d`에 집중.

### 직관의 충돌

- 저차원 직관: Gaussian은 원점 근처에 집중
- 고차원 실제: Gaussian은 **반지름 √d의 얇은 구각(annulus)**에 집중
- 원점은 확률 밀도 최대지만 **부피가 너무 작아** 실제 샘플은 거기서 나오지 않음

### 한글 의미

**"고차원에서 Gaussian은 '원' 모양이 아니라 '구 표면' 모양이다."** 10,000차원 가중치 공간에서 Gaussian 섭동은 거의 모두 반지름 `√10000 = 100`의 얇은 구각에 위치. 섭동 탐색의 '부피'가 이 구각에 몰려있음.

### 참조
- Vershynin, *High-Dimensional Probability*, Cambridge (2018), Ch. 3 — [무료 PDF](https://www.math.uci.edu/~rvershyn/papers/HDP-book/HDP-book.html).
- Ledoux, *The Concentration of Measure Phenomenon*, AMS (2001).

---

## 2. Gaussian Annulus 정리 (Vershynin, Ledoux)

### 수학적 진술

`X ~ 𝒩(0, I_d)`에 대해 모든 `t ≥ 0`:
```
  P(| ‖X‖ − √d | > t) ≤ 2 exp(−c·t²)
```
`c > 0`는 절대 상수. 즉 norm이 √d에서 멀어질 확률이 **sub-Gaussian** 감소.

### 유도 스케치 (Lipschitz concentration)

`f(x) = ‖x‖`가 1-Lipschitz 함수. Gaussian에 대한 Lipschitz 집중 부등식 (Borell 1975):
```
  P(|f(X) − E[f(X)]| > t) ≤ 2 exp(−t²/2)
```
+ `E[‖X‖] ≈ √d` (Jensen으로부터).

### Layer S에서의 사용

**Theorem 5의 noise propagation 단계**에서 각 잡음 항이 고차원 `d = nm` 매개변수 공간에서 `√d` 규모의 효과적 크기를 갖음. 이것이 `Tr(H^{-1})` 인수에서 차원 의존성의 근원.

### EGGROLL의 rank 선택에 대한 함의

rank-r 섭동이 전체 `d`-차원 공간의 `r`-차원 부분공간만 탐색. annulus 기하학에 의해:
- 전체 공간: `O(√d)` 탐색 범위
- rank-r 부분공간: `O(√r)` 탐색 범위
- 효율적 비율: `r/d`

작은 `r`이어도 "얇은 annulus 상의 방향" 중 rank-r 만큼을 덮을 수 있어서 gradient 추정이 작동.

### 한글 의미

**"Gaussian 샘플이 특정 '거리대'에 극도로 집중된다는 수학적 사실."** 따라서 고차원에서 확률론적 gradient 추정이 놀랍게도 **효율적으로** 작동하는 이유. 그래프 노드 `evolution_strategies_at_the_hyperscale_pdf_gaussian_annulus_theorem`가 이것.

### 참조
- Ledoux 같은 책, Ch. 1-2.
- Boucheron, Lugosi, Massart, *Concentration Inequalities*, Oxford (2013).

---

## 3. CLT와 Edgeworth 전개

### 중심 극한 정리 (CLT)

iid 확률변수 `X_1, ..., X_n`, `E[X_i] = μ, Var[X_i] = σ²`에 대해:
```
  (X̄_n − μ)/(σ/√n)  →  𝒩(0, 1)   as n → ∞
```
평균의 정규근사 — 고전 이론.

### Edgeworth 전개 (CLT의 개선)

CLT의 **유한 표본 보정**. 표본 평균의 분포를 Hermite 다항식으로 전개:
```
  F_n(x) = Φ(x) − φ(x) · (κ_3/(6√n)) H_2(x) + O(1/n)
```
여기서 `Φ`, `φ`는 표준 정규의 CDF/PDF, `κ_3`는 3차 cumulant, `H_2`는 2차 Hermite 다항식.

### 유도 아이디어

특성 함수(characteristic function)의 로그 전개 + Fourier 역변환. 상세는 Feller Ch. 16.

### EGGROLL rank convergence와의 연결

EGGROLL의 O(r⁻¹) 경계 유도에 Edgeworth 필요:
- rank-r 추정기의 bias = `∇² loss` 와 3차 cumulant의 곱
- CLT만 쓰면 `O(r^{-1/2})`가 한계
- Edgeworth의 `1/n` 항을 쓰면 `O(r^{-1})` 가능

그래프 노드 `evolution_strategies_at_the_hyperscale_pdf_edgeworth_expansion`와 `_rank_convergence_theorem`가 이것.

### 한글 의미

**"CLT는 '평균이 정규분포다'고 하지만, 실제 평균의 분포는 정규분포에서 약간 어긋난다. 그 어긋남을 정확히 표현한 전개식."** 샘플 크기가 작을 때 CLT 근사의 한계를 넘어서 추가 수정항을 제공.

### Layer S에서의 역할

Theorem 5의 `1/r` rank-bias 항을 유도할 때 사용. CLT만으로는 `1/√r`이 한계이지만 Edgeworth로 `1/r` 까지 내림. EGGROLL 논문의 핵심 정리를 Layer S가 이어받는 다리.

### 참조
- Feller, *An Introduction to Probability Theory and Its Applications, Vol. II*, Wiley (1971), Ch. 16.
- Bhattacharya & Ranga Rao, *Normal Approximation and Asymptotic Expansions*, Wiley (1976) — 그래프 노드에 이미 있음.

---

## 4. Neural Tangent Kernel (NTK)의 관점

### 기원 (Jacot, Gabriel, Hongler 2018)

무한 너비 NN의 훈련 동역학을 **kernel 방법**으로 환원. 핵심 관찰:
```
  너비 n → ∞에서 gradient flow의 parameters가 최소 이동
  출력 함수 f(x; θ)는 "linearization around initialization"으로 근사 가능
```

### NTK 정의

```
  Θ(x, x') = ⟨∇_θ f(x; θ_0), ∇_θ f(x'; θ_0)⟩
```
초기 parameter 기울기들의 inner product. 무한 너비 극한에서 `Θ`가 deterministic이 되고 훈련 동역학이:
```
  df(x; θ(t))/dt = −Θ(x, X_train) · (f(X_train) − y_train)
```
— kernel regression의 gradient flow.

### 우리 formulation과의 연결

**Theorem 4 Step 1의 "평균화된 slow SDE"가 NTK의 확률적 변형**으로 볼 수 있음:
- NTK는 분자 규모 gradient flow
- 우리는 device 잡음이 있는 gradient flow
- 무한 너비 한계(NTK)에서 우리 formulation은 NTK kernel regression으로 **귀결**

그래프 노드 `evolution_strategies_at_the_hyperscale_pdf_ntk`와 `_convergence_theorem`이 이 관점.

### NTK가 형식화에 기여하는 바

1. **수렴률 예측** — 무한 너비에서 exponential convergence rate 알려짐. 유한 너비는 perturbation 분석.
2. **Lazy training 규명** — W가 W_0 근처에서 작게 움직인다는 관찰이 Theorem 5의 "linearization around W*"와 호환.
3. **Universal approximation 자동 보장** — NTK kernel이 RKHS 밀도를 가지면 손실 함수 클래스에서 기대 minimum = 0 달성.

### 한글 의미

**"뉴럴 네트워크를 매우 넓게 만들면 사실은 고정된 kernel을 쓰는 선형 회귀와 같아진다."** 복잡한 NN 학습을 "kernel regression"으로 환원하여 분석 가능. 우리 formulation이 device 잡음이 있어도 수렴하는 이유를 NTK 관점에서 추가 확인.

### 참조
- Jacot, Gabriel, Hongler, *Neural Tangent Kernel: Convergence and Generalization in Neural Networks*, NeurIPS 2018 — [arXiv:1806.07572](https://arxiv.org/abs/1806.07572).
- Lee et al., *Wide Neural Networks of Any Depth Evolve as Linear Models Under Gradient Descent*, NeurIPS 2019 — [arXiv:1902.06720](https://arxiv.org/abs/1902.06720).
- Arora et al., *On Exact Computation with an Infinitely Wide Neural Net*, NeurIPS 2019 — [arXiv:1904.11955](https://arxiv.org/abs/1904.11955).

---

## 5. Score Function Variance와 Rank 확장의 이론

### Score function estimator의 분산

`g = f · ∇ log p`의 분산:
```
  Var[g] = E[f² · ‖∇ log p‖²] − (E[g])²
```
고차원 Gaussian에서 `‖∇ log p‖ = ‖x − θ‖/σ² ~ √d/σ²`. 따라서 rank-1 추정기의 분산은 **차원 d에 선형 증가**.

### Rank-r 확장의 variance 감소

독립 rank-1 섭동 `r`개의 평균:
```
  g_avg = (1/r) Σ_{k=1}^r f_k · δW_k / σ²
  Var[g_avg] = Var[g] / r
```
따라서 rank-r 평균 추정기의 RMSE가 `1/√r`로 감소. Edgeworth 보정으로 **bias term이 1/r**로 감소.

### EGGROLL의 기여

논문 `evolution_strategies_at_the_hyperscale_pdf_eggroll`의 주된 기여:
1. rank-r 섭동을 rank-1 `r`개 대신 **하나의 구조화된 rank-r 행렬**로 작성 (arithmetic intensity ↑)
2. Edgeworth를 명시적으로 써서 O(r⁻¹) bound 도출
3. hyperscale에서 rank가 커짐에 따른 효율 개선 수치 확인

### Layer S와의 연결

Theorem 5의 `bias ≤ C_H · σ_ξ / r` — EGGROLL의 rank convergence를 Layer S가 device-noise 포함 버전으로 일반화. `σ_ξ`가 순수 score variance라면 `+ σ_device`로 확장.

### 한글 의미

**"랜덤 섭동을 많이 쓸수록 gradient 추정이 정확해진다. 단순한 1/√r이 아니라 1/r 수렴률."** EGGROLL 논문의 수학적 핵심. 우리 formulation이 이 결과를 **device 잡음이 있는 환경으로** 확장.

### 참조
- 그래프 노드 `evolution_strategies_at_the_hyperscale_pdf_rank_convergence_theorem` — EGGROLL 논문 내부 정리.
- Bhattacharya & Ranga Rao (위 참조) — 3차 Edgeworth의 고전 유도.

---

## 6. 한 걸음 더 — Information Geometry 관점

### Fisher 정보 행렬

모수화된 분포족 `{p(x; θ)}`의 Fisher 정보:
```
  I_ij(θ) = E[∂_i log p · ∂_j log p]
```

### Natural gradient

일반 gradient 대신 **natural gradient** `I(θ)^{-1} · ∇`을 쓰면 parameter space의 내재 기하를 존중. NES (Wierstra 2014)가 이것.

### 우리 formulation에서의 암묵적 사용

Theorem 5의 bound에 `H^{-1}` (Hessian inverse)가 나타나는 것이 Fisher 정보의 inverse와 유사 — natural gradient 조정이 **자동으로** 일어남. W의 Gaussian 섭동이 `σ²`를 공분산으로 가지므로 Fisher metric 하에서의 등각 탐색.

### 한글 의미

**"parameter space에 자연스러운 거리 개념을 도입하면 학습이 훨씬 효율적"** — 이 통찰이 ES/NES 계열 알고리즘의 우수성을 설명. 우리 formulation은 이 원리를 device 물리로 옮긴 것.

### 참조
- Amari, *Information Geometry and Its Applications*, Springer (2016).
- Martens, *New Insights and Perspectives on the Natural Gradient Method*, JMLR (2020) — [arXiv:1412.1193](https://arxiv.org/abs/1412.1193).

---

## 연결성 요약 — 고차원 확률 + 기계학습

```
고차원 Gaussian 집중 (annulus)
     │
     │ 제공: "섭동 탐색이 효과적인 이유"
     ▼
Central Limit Theorem
     │
     │ 개선
     ▼
Edgeworth 전개
     │
     │ 제공: O(r^{-1}) bias bound
     ▼
Rank convergence theorem (EGGROLL)
     │
     │ Layer S Theorem 5가 device-noise 포함 버전으로 확장
     ▼
Information geometry (Fisher, natural gradient) — 배경 원리

NTK (infinite width)                  별도 경로:
     │                                "lazy training" 관점 제공
     │                                → Theorem 4 수렴률 정당화
     ▼
Kernel regression 해석
```

### 왜 이 도구들이 필요한가 (Layer S와의 연결)

1. **Gaussian annulus 정리** — 고차원에서 ES가 왜 작동하는지의 기하학적 근거. Theorem 5의 `Tr(H^{-1})` 항의 해석.
2. **Edgeworth 전개** — O(r^{-1}) rank convergence의 필수. Pair 3 identity (`bits bound rank`)의 수학적 내용.
3. **NTK** — Theorem 4 수렴의 rate 예측 도구. Stage 2 simulation에서 `O(exp(-λ_min·t))` 같은 수렴 속도를 기대할 수 있는 이유.
4. **Information geometry** — W 공간의 자연스러운 metric. Theorem 5의 `H^{-1}` bound가 왜 그 형태인지의 기하학적 설명.

---

## 다섯 이론-배경 노트 전체의 상호 연결

```
1. ODE Foundations           ─── Layer D 공급
    └─ Picard, Lipschitz, LTI, Volterra

2. Piecewise Systems        ─── Layer D Theorem 3 Part (b)
    └─ Zaslavsky, Hanin-Rolnick, switched Volterra

3. Stochastic Calculus      ─── Layer S SDE 골격
    └─ Brownian, Itô, Fokker-Planck, OU

4. Stochastic Approximation ─── Layer S Theorem 4
    └─ Robbins-Monro, Borkar, Lyapunov, martingale

5. Gaussian Concentration   ─── Layer S Theorem 5 + EGGROLL 수렴률
    └─ Annulus, Edgeworth, NTK, information geometry
```

각 노트가 해당 Layer의 특정 증명 단계를 **단독으로** 책임집니다. 어느 하나만 없어도 Layer D/S의 정리 중 최소 하나는 성립하지 않음.

### 왜 이 사슬이 필요한가

**목표 선언**: "반도체 물리를 직접 수학으로 옮겨 forward-only 학습 가능한 반수동 메모리를 만들겠다" — 이 한 문장이 다음을 요구:

1. 물리가 수학적으로 잘 정의된 시스템이다 ← **Layer C + 이론 1**
2. 그 시스템이 고전 신호처리 객체다 ← **Layer D + 이론 1, 2**
3. 잡음이 있어도 수학이 성립한다 ← **Layer S + 이론 3**
4. 그 시스템이 학습한다 ← **Layer S + 이론 4**
5. 학습이 실제 소자 파라미터에 대응된다 ← **Layer S + 이론 5**

이 다섯 요구가 독립적으로 증명되어야 formulation이 완결. 다섯 이론-배경 노트가 그 독립 증명에 쓰인 도구들의 기원과 연결을 명시.
