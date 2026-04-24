---
title: 이론 배경 2 — 구분 선형 시스템과 초평면 배치 조합론
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: theory_background
supports: [raw/formulation_layer_D_theorems_1_3.md]
---

# 이론 배경 2 — 구분 선형 시스템과 초평면 배치 조합론

Layer D Theorem 3 Part (b) — *piecewise-linear N (kink)에 대한 switched Volterra 표현* — 과 State-Region Dictionary 논문과의 연결에서 사용한 조합 기하학 도구들. 핵심은: **ReLU/kink 같은 조각 선형 활성화가 입력 공간을 유한한 polytope로 분할한다**는 사실의 수학적 구조.

---

## 1. 구분 선형 시스템 (Piecewise-Linear System)

### 정의

구분 선형 함수 `f : ℝⁿ → ℝᵐ`는 입력 공간의 유한 분할 `{P_1, ..., P_Q}`에서 각 영역 위에 affine map `f|_{P_q}(x) = A_q x + b_q`로 표현되는 함수.

- 각 `P_q`는 닫힌 **polytope** (유한 개 선형 부등식 교집합)
- 인접 polytope 경계에서 연속이면 "continuous piecewise-linear"(CPWL)
- Switched system 이론에서는 영역 전환을 switching이라 부름

### ReLU 네트워크의 구분 선형성

ReLU `σ(z) = max(0, z)`는 `z = 0`을 경계로 두 조각 affine. `L`-layer ReLU 네트워크는:
- Layer 1: `n_1` 개 초평면 (hyperplane)이 입력 공간을 분할
- Layer 2: Layer 1 영역 각각이 다시 `n_2` 초평면으로 세분
- ...
- 총 영역 수는 깊이에 따라 급증

### 우리 formulation의 N_kink가 PWL인 이유

Layer C Definition 3.3:
```
  f_kink(z) = α(z − V_T)₊ + β(z − V_k) · 1_{z > V_k}
```
`V_T`와 `V_k`를 경계로 **세 조각 선형** — 영역 (0, V_T), (V_T, V_k), (V_k, ∞)에서 각각 기울기 0, α, α+β.

### 한글 의미

**"입력 공간을 여러 '구역'으로 나누고, 각 구역 안에서는 선형으로 동작하는 시스템."** 실리콘의 관점: 트랜지스터가 subthreshold / saturation / kink 세 regime을 가지는 것이 바로 PWL 구조의 물리적 구현.

### 참조
- Liberzon, *Switching in Systems and Control*, Birkhäuser (2003), Ch. 1.
- Johansson, *Piecewise Linear Control Systems*, LNCIS 284 (2003).

---

## 2. 초평면 배치 (Hyperplane Arrangement)

### 정의

`ℝⁿ`에서 유한 개 초평면의 집합 `𝒜 = {H_1, ..., H_m}`. 각 초평면 `H_i = {x : a_i · x = b_i}`. 배치의 **여집합** `ℝⁿ \ ⋃ H_i`는 유한 개 연결 성분(region)으로 분할됨.

핵심 질문: **영역 개수는 몇 개인가?**

### 일반 위치(general position) 가정

`𝒜`가 "일반 위치"에 있다 = 임의의 `k`개 초평면 교집합이 여차원 `k`를 가짐. 실제 ReLU 네트워크의 초평면은 거의 항상 이 조건 만족 (측도 1 argument).

### 참조
- Stanley, *An Introduction to Hyperplane Arrangements*, IAS/Park City Math. Ser. (2004) — [PDF 공개](https://math.mit.edu/~rstan/arrangements/arr.html).
- Orlik & Terao, *Arrangements of Hyperplanes*, Springer (1992).

---

## 3. Zaslavsky 정리 (영역 개수 공식)

### 수학적 진술 (Zaslavsky 1975)

일반 위치에 있는 `ℝⁿ` 속 `m`개 초평면 배치 `𝒜`의 영역 개수:
```
  r(𝒜) = Σ_{k=0}^{n} C(m, k)
```
여기서 `C(m, k) = m! / (k!(m-k)!)`는 이항계수.

### 유도 (스케치)

귀납법 + 삭제-수축(deletion-contraction) 공식:
```
  r(𝒜) = r(𝒜 − H) + r(𝒜^H)
```
여기서 `𝒜 − H`는 `H`를 뺀 배치, `𝒜^H`는 `H` 위에 유도된 배치 (차원 하나 줄어듦). 귀납의 기저: 초평면 0개면 영역 1개.

일반 위치에서 `r(𝒜 − H) = r(𝒜) − r(𝒜^H)`이므로 공식이 이항 합으로 귀결.

### 특수 경우

- `n = 1, m개 점`: 영역 `= m + 1` (수직선이 `m`개 점으로 나뉨)
- `n = 2, m개 직선 (일반 위치)`: 영역 `= 1 + m + C(m,2) = (m²+m+2)/2`
- `n` 차원, `m` 개 일반 위치 초평면: 영역은 `m^n / n!` 차수

### 한글 의미

**"n차원 공간을 m개 평면으로 자르면 만들어지는 조각 개수의 정확한 공식."** 평면 수가 많을수록 차원 수의 지수로 조각이 늘어남. ReLU 네트워크의 "표현력"이 깊이에 지수적이라는 주장의 수학적 뿌리.

### 참조
- Zaslavsky, *Facing Up to Arrangements: Face-Count Formulas for Partitions of Space by Hyperplanes*, Mem. AMS 154 (1975) — 원전.
- Stanley 강의노트 (위 링크) — 훨씬 읽기 쉬움.

---

## 4. Hanin-Rolnick 경계 (ReLU 네트워크의 영역 개수)

### 수학적 진술 (Hanin & Rolnick 2019)

너비 `n`, 깊이 `L`인 ReLU 네트워크의 입력 공간 분할 영역 개수 `R_{n,L}`은:
```
  R_{n,L} ≤ C · (L · n / d)^d        (d = 입력 차원)
```
여기서 `C`는 상수.

### 결정적 상한 vs 평균 경계

순수 Zaslavsky 경계는 layer 내 초평면을 일반 위치로 취급 → 최대 `2^{nL}` 영역 가능.
Hanin-Rolnick의 기여: **훈련된 네트워크의 평균(초기화 분포 하) 영역 수**는 다항식적으로 훨씬 작음 → `O((Ln)^d)`.

### 유도 아이디어

- 가중치가 iid Gaussian이면 각 layer의 초평면이 일반 위치일 **확률**을 계산
- Kac-Rice 공식으로 경계 교차 횟수의 기댓값 계산
- 조합 합성으로 깊은 네트워크의 기대 영역 수 경계

### State-Region Dictionary 연결

- "State-region dictionary"의 atlas cardinality = `R_{n,L}`
- 각 region이 autoencoder의 한 state → dictionary 크기의 이론적 상한
- Layer D Open Point 4에서 명시적으로 참조한 경계

### 한글 의미

**"ReLU 네트워크가 입력 공간을 나누는 조각의 개수가 이론 최대치보다 훨씬 적다."** 실용적 의미: 깊이가 `L`이어도 실제 네트워크의 '구역 사전'은 다항적 크기라 유지/학습이 가능. State-Region Dictionary 논문의 implicit assumption이 이 경계로 정당화됨.

### Layer D / Formulation과의 연결

1. **Theorem 3 Part (b)의 polytope 수 경계**. Layer D는 "유한 개 P_q"라고만 명시 — 유한 개의 정확한 개수가 Hanin-Rolnick. Theorem 3이 implicit하게 사용.
2. **Kink effect ↔ State-Region Dictionary**가 이제 formal. 각 트랜지스터의 kink는 하나의 hyperplane을 그음 (gate voltage = V_T). `n`개 트랜지스터 stack은 `n`개 hyperplane이므로 Zaslavsky로 영역 수 결정. ReLU 네트워크의 Hanin-Rolnick 경계는 이 기하학적 구조의 직접 귀결.
3. **Two remaining AMBIGUOUS edges 완전 해소**.

### 참조
- Hanin & Rolnick, *Deep ReLU Networks Have Surprisingly Few Activation Patterns*, NeurIPS 2019 — [arXiv:1906.00904](https://arxiv.org/abs/1906.00904).
- Serra, Tjandraatmadja, Ramalingam, *Bounding and Counting Linear Regions of Deep Neural Networks*, ICML 2018 — [arXiv:1711.02114](https://arxiv.org/abs/1711.02114).

---

## 5. Switched Volterra Operator (PWL + Volterra의 결합)

### 수학적 구조

`{P_q}`를 ReLU/kink가 유도한 polytope 분할, 각 `P_q` 위에서 N이 affine `A_q z + b_q`. 그러면 입력 → 출력 사상은:
```
  y(t) = F[u](t) = Σ_q  1_{u(·) ∈ P_q} · V^q[u](t)
```
`V^q`는 영역 `P_q`에서의 linear Volterra operator (사실상 LTI).

### Switching 이벤트의 처리

- 입력 trajectory가 영역 경계를 건널 때 `q(t)`가 변함
- 측도 0의 시점이므로 적분에 기여 0
- 결과: 영역 전환이 Lebesgue 적분 의미에서 **무시 가능**

### 왜 이것이 signal-processing 완결성인가

**Switched Volterra operator는 고전적 아날로그 신호처리의 표준 객체.** 예: 모든 digital-to-analog 컨버터, 모든 threshold-based 회로, 많은 아날로그 필터가 switched system. 우리의 NN 아키텍처는 이 가족에 속함 → 특별한 "AI 하드웨어"가 아니라 **확장된 고전 신호처리 장치**.

### Layer D에서의 핵심 역할

Theorem 3 Part (b)의 결론 그 자체. 이 결론이 목표의 "digitalization 우회"를 정확한 수학 주장으로 환원:
- 입력-출력 사상 ∈ switched Volterra
- switched Volterra는 analog primitive만으로 실현 가능
- 따라서 형식화 → 하드웨어 구현의 다리가 놓임

### 한글 의미

**"구역이 바뀌더라도 각 구역 내부에서는 고전 선형 시스템이므로, 전체를 '선형 시스템들의 스위칭된 패치워크'로 볼 수 있다."** 이 관점에서 보면 NN 추론이란 곧 "입력이 어떤 polytope에 있는지 판정(switching) → 해당 polytope의 linear filter 적용"의 두 단계.

---

## 연결성 요약 — 기하-조합-해석의 삼각

```
Piecewise-Linear System          Layer C (kink, f_kink)
(구조 정의)                      Layer D Theorem 3 Part (b)
    │
    ▼
Hyperplane Arrangement           Zaslavsky 정리 (영역 개수)
(조합 분석)                      Hanin-Rolnick (실제 상한)
    │
    ▼
Switched Volterra Operator       Layer D Theorem 3 (최종 결론)
(신호처리 객체)                  State-Region Dictionary 연결
```

이 셋이 결합되어 **"깊이 있는 ReLU 네트워크는 유한 조각 선형 필터로 해석될 수 있다"**는 정밀한 주장이 완성. `AMBIGUOUS Edge 1` (Punch-Through ↔ Iterative Flow)과 `AMBIGUOUS Edge 2` (Kink ↔ SRD) 모두 이 사슬의 직접 귀결로 해소됨.

### 왜 이 도구들이 필요했는가

1. **Theorem 3이 "finite 분할"을 가정하므로 finite의 구체적 크기가 필요** → Zaslavsky + Hanin-Rolnick.
2. **State-Region Dictionary 논문과의 무손실 대응** → hyperplane arrangement 언어로 번역 가능해야.
3. **Stage 2/3 simulation에서 region 수를 예측해야** → SPICE로 영역 전환을 관측할 때 예상 회수가 이 공식에서 나옴.
