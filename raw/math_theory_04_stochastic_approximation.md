---
title: 이론 배경 4 — 확률 근사(Stochastic Approximation)와 두 시간척도 이론
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: theory_background
supports: [raw/formulation_layer_S_theorems_4_5.md]
---

# 이론 배경 4 — 확률 근사와 두 시간척도 이론

Layer S Theorem 4 (Learning Convergence)의 증명 골격은 확률 근사(stochastic approximation) 이론 + 두 시간척도 분리 + Lyapunov 함수 해석입니다. 이 노트는 그 세 축을 정리: Robbins-Monro 알고리즘 → Kushner-Yin의 ODE 방법 → Borkar의 two-timescale 이론.

---

## 1. 확률 근사(Stochastic Approximation)의 태동

### Robbins-Monro 1951 (원문제)

방정식 `h(θ) = 0`의 해 `θ*`를 찾고 싶은데 `h(θ)` 대신 noisy 관측 `Y(θ) = h(θ) + ξ`만 얻을 수 있을 때 (ξ는 mean-zero noise). 알고리즘:
```
  θ_{n+1} = θ_n − a_n · Y(θ_n)
```
`{a_n}`이 적절한 조건을 만족하면 `θ_n → θ*` 확률 1.

### Robbins-Monro 조건 (단계 크기)

```
  Σ a_n = ∞        (무한히 많이 보정)
  Σ a_n² < ∞       (분산 유한)
```
대표 예: `a_n = 1/n` — `Σ 1/n = ∞, Σ 1/n² = π²/6`.

### 유도 스케치

`V(θ) = ½(θ − θ*)²`를 Lyapunov 함수로 삼으면:
```
  E[V(θ_{n+1}) | θ_n] = V(θ_n) − a_n · h(θ_n) · (θ_n − θ*) + ½ a_n² · E[Y²]
                      ≤ V(θ_n) − a_n · c · V(θ_n) + ½ a_n² · M
```
두 조건 하에서 `V(θ_n) → 0` 확률 1. (c, M은 상수.)

### 한글 의미

**"매 단계에서 잡음이 있더라도, 올바른 방향을 평균적으로 따라가고 점점 보폭을 줄이면 결국 답에 도달한다."** 초기엔 큰 보폭으로 빨리 움직이고, 점점 줄여 잡음이 평균화되게 함. SGD(stochastic gradient descent)가 이 원리의 직접 적용.

### 참조
- Robbins & Monro, *A Stochastic Approximation Method*, Ann. Math. Statist. 22 (1951) — 원전.
- Kushner & Yin, *Stochastic Approximation and Recursive Algorithms and Applications*, 2nd ed., Springer (2003) — **표준 교재**.

---

## 2. ODE 방법 (Ljung 1977, Kushner-Clark 1978)

### 아이디어

확률 근사 반복:
```
  θ_{n+1} = θ_n + a_n · (h(θ_n) + ξ_{n+1})
```
은 단계 크기가 작으면 **연속시간 ODE**
```
  dθ/dt = h(θ)
```
의 Euler 근사로 해석 가능. 따라서 확률 근사의 장기 수렴 = ODE의 장기 거동.

### 정리 (Kushner-Yin, Theorem 5.2.1)

조건 (Lipschitz + bounded moment + Robbins-Monro)이 만족되면, 이산 반복의 interpolated trajectory `θ_n → θ̄(t)`가 ODE의 해로 수렴하고, ODE가 global asymptotic stable 평형점 `θ*`를 가지면 `θ_n → θ*` a.s.

### Lyapunov 함수 방법

수렴을 위해 `V(θ)`가 다음 만족하면 충분:
- `V(θ) > 0` for `θ ≠ θ*`, `V(θ*) = 0`
- `dV/dt = ∇V · h(θ) < 0` for `θ ≠ θ*`

우리 Theorem 4에서는 `V(W) = L(W) − L(W*)` — 손실 감소가 곧 Lyapunov 감소.

### 한글 의미

**"잡음이 있는 이산 업데이트도 충분히 잘게 쪼개면 부드러운 미분방정식 궤적처럼 보인다."** 따라서 복잡한 확률 거동 분석 = 간단한 ODE 분석. 통계학과 제어이론의 교차점.

### Layer S와의 연결

Theorem 4 Step 1에서 "효과적 slow SDE" `dW = η·∇L·dt + σ·dB`가 이 ODE 방법의 확률적 버전. Step 2-3의 Lyapunov 감소 분석이 Kushner-Yin의 방법론을 따름.

### 참조
- Kushner & Yin, 같은 책, Ch. 5.
- Benveniste, Métivier, Priouret, *Adaptive Algorithms and Stochastic Approximations*, Springer (1990).

---

## 3. Borkar의 Two-Timescale 확률 근사 (2008)

### 문제 설정

두 변수가 결합되어 진화:
```
  θ_{n+1} = θ_n + a_n · f(θ_n, w_n)
  w_{n+1} = w_n + b_n · g(θ_n, w_n)
```
`a_n, b_n` 둘 다 Robbins-Monro이되 **`b_n / a_n → 0`** (w가 θ보다 느림).

### 핵심 정리 (Borkar, Theorem 6.1)

`b_n / a_n → 0`이면, 느린 `w`의 관점에서 빠른 `θ`는 항상 quasi-stationary equilibrium `θ*(w)`에 있음 (averaging principle). 그 결과 `w`의 유효 dynamics는:
```
  dw/dt = g(θ*(w), w)
```

### 우리 formulation에서의 사용

Layer S **Theorem 4 Step 1**이 이것:
- 빠른 변수: 섭동 `δW(t)` (시정수 `τ_δ ~ 100 ns`)
- 느린 변수: 슬로우 가중치 `W(t)` (시정수 `τ_W ~ 10 μs - hours`)
- `τ_W / τ_δ ≈ 50` — 요구된 분리 비율 충족

따라서 W의 dynamics를 볼 때 δW는 **정상 분포로 평균화된 것**으로 취급 가능:
```
  dW/dt = (1/τ_W)(−W + η · ⟨S · δW⟩_{δW~stationary})
        = η · σ² · ∇_W E[S]
```
— EGGROLL의 score-function gradient flow 형태.

### 한글 의미

**"빠른 변수와 느린 변수가 섞인 시스템에서, 느린 변수가 보는 빠른 변수는 '평균 상태'로 간주할 수 있다."** 경제학의 adiabatic approximation, 물리학의 Born-Oppenheimer 근사와 같은 철학. 두 시간척도의 비율이 클수록 근사 정확.

### 왜 이 정리가 필수인가 (formulation 연결)

1. **Pair 6의 K_batch 정당화** — `K_batch = τ_W / τ_δ ≈ 50`이 "충분히 분리됨"의 경계. 이 정리가 그 경계의 엄밀한 의미.
2. **ES gradient 해석의 토대** — δW의 Poisson 섭동을 평균화하지 않으면 W dynamics가 해석 불가. Borkar가 그 정당성.
3. **PPCA 아키텍처의 운영 조건** — charge-trap 시정수와 floating-bulk 시정수의 분리가 왜 중요한지 이론적으로 해명.

### 참조
- Borkar, *Stochastic Approximation: A Dynamical Systems Viewpoint*, Cambridge Univ. Press (2008), Ch. 6 — **정전(定典)**.
- Borkar, *Asynchronous stochastic approximations*, SIAM J. Control Optim. 36 (1998) — 원 논문.

---

## 4. Almost-Sure Convergence via Martingale

### 이론 배경 3의 martingale 수렴과 연결

확률 근사에서 "잡음 성분"을 분리:
```
  θ_{n+1} − θ_n = a_n · h(θ_n) + a_n · ξ_{n+1}
                = deterministic + martingale increment
```
`M_n := Σ_{k=1}^n a_k · ξ_k`가 martingale. Robbins-Monro 조건 `Σ a_k² < ∞`에 의해:
```
  Var(M_n) = Σ a_k² · Var(ξ_k) ≤ Σ a_k² · M < ∞
```
martingale 수렴 정리로 `M_n → M_∞` a.s. — 잡음 누적이 유한 값에 수렴.

### 결과

`a_n ξ_n → 0` 따라서 장기적으로는 deterministic 항만 지배. Kushner-Yin의 ODE 방법이 적용되어 `θ_n → θ*`.

### 한글 의미

**"단계 크기를 충분히 빠르게 줄이면 잡음의 누적이 유한한 오차만 만들고, 결정적 방향이 결국 이긴다."** 수학적으로: `a_n²` 합이 유한 → 잡음 martingale 수렴 → 드리프트가 trajectory를 지배.

### 참조
- Kushner-Yin 같은 책, Ch. 5.
- Duflo, *Random Iterative Models*, Springer (1997), Ch. 1-2.

---

## 5. Lyapunov 함수 방법 (Khasminskii, LaSalle)

### 확률론적 Lyapunov 정리 (Khasminskii 1980)

SDE `dX = μ dt + σ dB`가 평형점 `X*`를 갖고 Lyapunov 함수 `V(x)`가:
- `V(x) > 0` for `x ≠ X*`, `V(X*) = 0`
- `ℒV := ∇V · μ + ½ Tr(σ² H_V) ≤ −c · V` (drift negative)
- `ℒ`는 infinitesimal generator of SDE

이면 `X(t) → X*` 확률 1 (또는 in probability).

### Layer S Theorem 4에서의 사용

`V(W) = L(W) − L(W*)` 선택. Itô's lemma로:
```
  ℒV = −η ‖∇L‖² + ½ Tr(σ² H_V)
```
국소 극소점 근방에서 `‖∇L‖²`가 유계 이상이면 `ℒV < 0`. Robbins-Monro로 잡음 항 상쇄. Theorem 4 증명의 중심 뼈대.

### 한글 의미

**"에너지 함수(Lyapunov)가 시간에 따라 반드시 감소하면 시스템은 최소 에너지 상태로 수렴한다."** 역학에서 kinetic + potential energy가 마찰로 감소하여 결국 평형으로 가는 그림의 일반화.

### 참조
- Khasminskii, *Stochastic Stability of Differential Equations*, Springer (2012, 2nd ed.) — **정전**.
- LaSalle, *The Stability of Dynamical Systems*, SIAM (1976) — 결정적 버전.

---

## 6. Natural Evolution Strategies로서의 EGGROLL

### 배경 (Wierstra et al. 2014)

ES (Evolution Strategy)는 `∇_θ E[f(x; θ)]`를 score-function 방법으로 추정:
```
  ∇_θ E[f] = E[f · ∇_θ log p(x; θ)]
```
`p = 𝒩(θ, σ²I)`이면 `∇_θ log p = (x − θ)/σ²`, 즉 섭동 방향의 f-가중치 평균.

### EGGROLL의 특수화

rank-r 섭동 `δW = Σ_k a_k b_k^⊤ / √r` (`a, b ~ 𝒩(0, σ²)`)에 대해:
```
  ∇_W E[f(W + δW)] = E[f · δW] / σ²
```
업데이트: `W ← W + η · E[f · δW]`.

rank-1이면 r=1 case. rank-r로 확장 시 분산이 `1/r`만큼 줄어 — Theorem 5의 rank-bias 항 근원.

### 한글 의미

**"기대값의 미분을 구할 때 직접 미분하지 않고, 랜덤 섭동과 결과값의 곱으로 근사한다."** backprop 없이 gradient 추정 가능 — forward-only 학습의 수학적 근거.

### 왜 우리 formulation이 이것을 사용하는가

Layer S Section 3이 이 정체를 진술. EGGROLL-PPCA의 forward-only 주장이 이 정체로 엄밀해짐:
- 하드웨어는 f(W + δW)만 측정 (forward pass)
- 이 측정으로부터 gradient 자동 추정
- backward path 불필요

### 참조
- Williams, *Simple Statistical Gradient-Following Algorithms for Connectionist Reinforcement Learning*, Mach. Learn. 8 (1992) — REINFORCE 원전.
- Wierstra, Schaul, Peters, Schmidhuber, *Natural Evolution Strategies*, JMLR 15 (2014) — [link](https://www.jmlr.org/papers/v15/wierstra14a.html).
- Salimans, Ho, Chen, Sutskever, *Evolution Strategies as a Scalable Alternative to Reinforcement Learning*, [arXiv:1703.03864](https://arxiv.org/abs/1703.03864) (2017).

---

## 연결성 요약 — 확률 근사 사슬

```
Robbins-Monro 1951
(기본 아이디어: 잡음이 있어도 수렴)
      │
      ▼
ODE 방법 (Kushner-Yin)
(이산 → 연속, Lyapunov 분석 가능)
      │
      ▼
Two-Timescale 확률 근사 (Borkar)
(빠른/느린 변수 분리 → 평균화)
      │
      ▼
Martingale 수렴 + Itô Lyapunov
(확률 성분 제거 → 결정적 수렴 주장)
      │
      ▼
EGGROLL Theorem 4 (Layer S)
(W → W* a.s.)
```

### Natural Evolution Strategies가 별도 경로로 개입

```
REINFORCE (Williams 1992)
      │
      ▼
NES (Wierstra 2014)
(Gaussian ES 확장)
      │
      ▼
EGGROLL (rank-r)
(Layer S Section 3에서 정식화)
```

### 왜 이 네 가지 도구가 모두 필요한가

| 도구 | 증명의 어떤 단계를 책임지는가 |
|---|---|
| Robbins-Monro 조건 | `η_t` 스케줄이 잘 정의되고 convergent한지 |
| Kushner-Yin ODE 방법 | 이산 업데이트 → 연속 ODE 해석 |
| Borkar two-timescale | `δW` 평균화를 정당화 (K_batch ≈ 50의 엄밀한 의미) |
| Lyapunov + Martingale 수렴 | 최종 almost-sure 수렴 주장 |
| NES score identity | gradient를 backward 없이 추정 (forward-only 주장의 수학적 기반) |

이 사슬 없이 Theorem 4를 쓸 수는 있지만 수렴 주장이 **심하게 약해짐** (예: "수렴한다고 가정하면 이렇게 된다"류). 우리 formulation은 엄밀 수렴을 요구하므로 이 전체 도구 세트가 필수.
