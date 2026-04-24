---
title: 이론 배경 3 — 확률 미적분과 Fokker-Planck 방정식
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: theory_background
supports: [raw/formulation_layer_S_theorems_4_5.md]
---

# 이론 배경 3 — 확률 미적분과 Fokker-Planck 방정식

Layer S의 SDE 시스템 (S1)-(S3)과 Theorems 4-5 증명에서 사용한 확률 미적분 도구들. 핵심: **thermal noise, 1/f noise, device variability**를 수학적으로 다루는 표준 프레임워크를 Brownian motion → Itô 적분 → SDE → Fokker-Planck 방정식 → Ornstein-Uhlenbeck 과정의 사슬로 정리.

---

## 1. Brownian Motion (Wiener 과정)

### 정의

확률 과정 `B(t), t ≥ 0`가 Brownian motion ⟺ 다음 세 조건:
1. `B(0) = 0`
2. **독립 증분**: `0 ≤ s < t ≤ u < v`에 대해 `B(t) − B(s)`와 `B(v) − B(u)`가 독립
3. `B(t) − B(s) ∼ 𝒩(0, t − s)` (정규분포, 분산이 시간 차)

연속성 추가: `t ↦ B(t)`의 궤적은 연속 함수 (확률 1).

### 특징적 성질

- **어디서도 미분 불가** — `dB/dt`는 고전적 의미에서 존재하지 않음
- **이차 변분(quadratic variation)**: `[B, B]_t = t` — 고전 함수에서는 0, Brownian에서는 t
- 이 비규칙성이 thermal noise가 white noise인 이유

### 한글 의미

**"매순간 독립적이고 평균 0, 분산 Δt인 랜덤 펄스가 누적된 과정."** 입자가 열적으로 흔들릴 때의 누적 변위 — 물리 유도: 원자/전자의 충돌이 독립 + 중심 극한 정리 → Gaussian 증분.

### 우리 formulation에서의 역할

Layer S SDE (S1)-(S3)의 `dB^x, dB^W, dB^δ`가 이것. 각 상태에 독립 Brownian 잡음이 더해져 thermal fluctuation을 모델링.

### 참조
- Karatzas & Shreve, *Brownian Motion and Stochastic Calculus*, Springer (1988), Ch. 2.
- Øksendal, *Stochastic Differential Equations*, 6th ed., Springer (2003), Ch. 2.

---

## 2. Itô 적분 — 랜덤 시간에 대한 적분

### 필요성

`∫ f(t) dB(t)`를 정의하고 싶지만 `dB/dt`가 존재하지 않아 Riemann-Stieltjes로 안 됨. 대안: 분할 점에서 left-endpoint를 쓰는 이산 합의 극한:
```
  ∫_0^T f dB = lim_{Δt → 0} Σ_i f(t_i) · (B(t_{i+1}) − B(t_i))
```

### Itô 이성 (Itô's isometry)

적응(adapted)된 `f`에 대해:
```
  E[(∫_0^T f dB)²] = E[∫_0^T f² dt]
```
이 등식 덕분에 적분이 `L²`에서 유일하게 정의됨.

### Stratonovich 적분과의 차이

Stratonovich는 mid-point를 써서 **고전적 연쇄법칙**을 복원하지만 적분의 martingale 성질을 잃음. 우리 formulation은 **Itô 관례** 사용 — martingale 성질이 Theorem 4 증명의 핵심이므로.

### 한글 의미

**"매순간의 미래를 보지 않고 현재 값만으로 적분을 정의하는 방법."** Itô는 non-anticipating (예측 안 함), Stratonovich는 anticipating (중앙값 사용). 금융과 물리의 주류는 Itô.

### 참조
- Karatzas & Shreve, 같은 책, Ch. 3.
- Revuz & Yor, *Continuous Martingales and Brownian Motion*, Springer (1999).

---

## 3. Itô's Lemma (확률 연쇄 법칙)

### 수학적 진술

`X(t)`가 SDE `dX = μ dt + σ dB`를 만족하고 `f(t, x)`가 `C^{1,2}` (시간 `C^1`, 공간 `C^2`) 이면:
```
  df(t, X) = (∂f/∂t) dt + (∂f/∂x) dX + ½ · (∂²f/∂x²) · σ² dt
```

### 고전 연쇄법칙과의 차이

고전: `df = (∂f/∂t) dt + (∂f/∂x) dX`.
Itô: `+ ½ σ² ∂²f/∂x² dt`라는 **추가 항**. 이것이 `(dB)² = dt`에서 온 것 — Brownian의 이차 변분이 0이 아니라는 사실의 직접 귀결.

### 유도

Taylor 전개에 `dB² ≈ dt`를 대입:
```
  df ≈ (∂f/∂t) dt + (∂f/∂x) dX + ½ (∂²f/∂x²) (dX)² + ...
  (dX)² = (μ dt + σ dB)² = σ² dB² + O(dt·dB) = σ² dt + 삭제가능 항
```

### 한글 의미

**"랜덤 함수의 미분에는 기울기 항 + 곡률 항이 모두 나타난다."** 고전 연쇄법칙이 '일차 근사'라면 Itô는 '이차 근사'까지 필요. 물리적 직관: 무작위 흔들림이 있을 때 함수의 평균 변화는 기울기뿐 아니라 곡률(Hessian)에도 의존.

### Layer S에서의 사용

**Theorem 4의 Lyapunov 함수 분석.** `V(W) = L(W) − L(W*)`의 시간 미분이 Itô 공식으로:
```
  dV = (∇L · dW) + ½ Tr(σ² H_V) dt = −η ‖∇L‖² dt + drift + noise
```
추가 항 `½ Tr(σ² H_V)`가 **잡음-유발 bias의 출처**. 고전 연쇄법칙만 쓰면 이 bias를 놓침.

### 참조
- Øksendal, 같은 책, Ch. 4.
- Protter, *Stochastic Integration and Differential Equations*, Springer (2005).

---

## 4. 확률 미분 방정식 (SDE)

### 정의

SDE: `dX(t) = μ(t, X) dt + σ(t, X) dB(t)` + 초기값 `X(0) = X_0`.

`μ`: drift (평균 변화율), `σ`: 확산 계수 (랜덤 진폭).

### 존재성/유일성 (Itô 1951)

`μ, σ`가 Lipschitz + 선형 성장 조건을 만족하면 강해(strong solution) 유일하게 존재:
```
  X(t) = X_0 + ∫_0^t μ(s, X) ds + ∫_0^t σ(s, X) dB(s)
```

### 우리 SDE 시스템의 형태

Layer S (S3): `dW = (1/τ_W)(−W + η S δW) dt + σ_W dB^W`
- drift `μ(W) = (−W + η S δW)/τ_W` — 공고화 dynamics
- diffusion `σ(W) = σ_W` (상수) — charge-trap thermal noise

### 한글 의미

**"시간에 따라 결정적 움직임과 랜덤 움직임이 동시에 일어나는 변수의 진화."** 물리적으로: 결정적 ODE에 잡음 항을 더한 것. Layer D는 SDE의 `σ = 0` 경우, Layer S는 `σ ≠ 0`의 일반 경우.

### 참조
- Øksendal 같은 책, Ch. 5.
- Kloeden & Platen, *Numerical Solution of Stochastic Differential Equations*, Springer (1992).

---

## 5. Fokker-Planck 방정식 (확률 밀도의 진화)

### 유도

`X(t)`가 SDE `dX = μ dt + σ dB`를 만족. `p(t, x)`를 `X(t)`의 확률 밀도. 그러면 `p`는 편미분 방정식을 만족:
```
  ∂p/∂t = −∂/∂x · (μ p) + ½ · ∂²/∂x² · (σ² p)
```
— **Fokker-Planck 방정식** (또는 Kolmogorov forward equation).

### 유도 스케치

Itô 공식으로 test function `φ`의 `E[φ(X)]`의 시간 변화 계산:
```
  d/dt E[φ(X)] = E[μ · φ'(X) + ½ σ² · φ''(X)]
```
부분적분으로 `p`에 대한 PDE로 옮김.

### 정상 해 (Stationary solution)

`∂p/∂t = 0`을 찾으면 시스템의 장기 분포. OU 과정의 경우 Gaussian이 나옴.

### 우리 formulation에서의 사용

**Theorem 5 증명.** W의 정상분포가 Fokker-Planck의 stationary solution이고, 이것이 Gaussian (OU process) 이라는 사실에서 공분산 `Σ`가 결정되어 `E[‖W − W*‖²]` bound를 얻음.

### 한글 의미

**"SDE가 만드는 모든 가능한 궤적을 모았을 때 그 분포가 어떻게 퍼지는지 기술하는 방정식."** 개별 궤적은 랜덤하지만 "많은 시행의 통계"는 결정적으로 진화함. 장기(stationary) 한계가 곧 시스템의 "평형 분포".

### 참조
- Risken, *The Fokker-Planck Equation: Methods of Solution and Applications*, Springer (1989) — **표준 reference**.
- Gardiner, *Handbook of Stochastic Methods*, Springer, 다회 개정.

---

## 6. Ornstein-Uhlenbeck (OU) 과정

### 정의

선형 drift + 상수 diffusion:
```
  dX = −θ · (X − μ) dt + σ dB,    θ > 0
```
평균 회귀(mean-reverting) 과정 — `X`가 `μ`에서 멀어지면 돌아오려는 경향.

### 명시적 해

```
  X(t) = μ + (X_0 − μ) e^{−θt} + σ ∫_0^t e^{−θ(t−s)} dB(s)
```

### 정상 분포

`t → ∞`에서:
```
  X(∞) ∼ 𝒩(μ, σ²/(2θ))
```
Gaussian 분포, 평균 `μ`, 분산 `σ²/(2θ)`.

### Lyapunov 방정식 (고차원 OU)

고차원 `dX = −A X dt + Σ_B dB` (`A ≻ 0`)의 정상 공분산 `Σ`는:
```
  A Σ + Σ A^⊤ = Σ_B Σ_B^⊤
```
— **Lyapunov 방정식**. Layer S Theorem 5의 proof step 2에서 직접 사용.

### 한글 의미

**"결정적으로 평균으로 돌아오려는 힘과 랜덤하게 흔드는 힘이 균형을 이룬 상태."** 실리콘에서: 바이어스 전압으로 고정된 트랜지스터 노드가 thermal noise로 흔들리는 전형적 그림.

### Layer S에서의 중심적 역할

**Theorem 5의 해석.** 극소점 근방에서 SDE를 선형화 → OU process → 정상분포 공분산 → `E[‖W − W*‖²]` bound. 이 체인이 "잡음-관용성 정량화"의 수학적 실체.

### 참조
- Uhlenbeck & Ornstein, *On the Theory of the Brownian Motion*, Phys. Rev. 36 (1930) — 원전.
- Gardiner 위 책, Ch. 4.

---

## 7. Martingale과 Martingale 수렴 정리

### 정의

확률 과정 `M(t)`가 martingale ⟺ `E[M(t) | 𝒢_s] = M(s)` for `s ≤ t` (모든 정보 `𝒢_s` 하의 조건부 기댓값이 현재값). "공정한 도박"의 수학적 형식.

### Itô 적분이 Martingale인 이유

`∫ f dB`가 martingale — 왜냐하면 `dB`가 독립 증분이고 `f`가 left-endpoint adapted. Theorem 4 증명 Step 3의 핵심 도구.

### Martingale 수렴 정리 (Doob 1953)

균등 적분 가능(uniformly integrable) martingale `M(t)`는 `t → ∞`에서 `M_∞`로 확률 1 수렴.

### Theorem 4에서의 사용

stochastic integral part:
```
  ∫ η · (gradient estimator의 noise) · dB
```
가 martingale이므로 `η_t → 0`과 결합하여 확률 1 소멸 → 오직 drift part만 남고 gradient flow로 수렴.

### 한글 의미

**"기대값으로 보면 랜덤 변동은 상쇄된다"**를 보장하는 강력한 수학적 장치. Robbins-Monro 같은 확률 근사 알고리즘의 수렴 증명이 모두 이 정리 위에 세워져 있음.

### 참조
- Durrett, *Probability: Theory and Examples*, 4th ed., Ch. 5.
- Karatzas & Shreve, 같은 책, Ch. 1.

---

## 연결성 요약 — 확률 미적분 사슬

```
Brownian Motion      → (thermal noise 모델)
    │
Itô 적분            → (랜덤 적분의 엄밀한 정의)
    │
Itô Lemma           → (Lyapunov 분석에서 곡률 항 도출)
    │
SDE                  → (Layer S 시스템 (S1)-(S3))
    │
┌────┴────┐
│         │
Fokker-Planck    OU Process / Lyapunov eqn
(분포 진화)      (정상 공분산 계산)
    │         │
    └────┬────┘
         ▼
Theorem 5: ‖W − W*‖² ≤ (...)
```

Martingale 수렴 정리는 **별도 경로**로 Theorem 4의 almost-sure 수렴 증명에 사용.

### 왜 이 도구들을 사용했는가 (Layer S와의 연결)

1. **실제 소자 noise의 본성 (white + Gaussian)이 Brownian motion 모델에 정확히 맞음** — thermal noise의 물리 유도와 일치.
2. **Itô's Lemma의 곡률 항이 곧 noise-induced bias** — Theorem 5의 `Tr(σ² H)` 항이 여기서 도출. 고전 calculus로는 이 항을 놓침.
3. **Fokker-Planck로 장기 분포 계산 가능** — 수치 시뮬로는 오래 돌려야 얻는 것이 해석적으로 즉시 나옴.
4. **OU process의 Lyapunov 방정식이 noise tolerance bound의 직접 공급원** — Theorem 5 proof step 2의 `Σ = (σ²/2η)·H^{-1}`가 여기서 옴.
5. **Martingale 수렴이 Robbins-Monro를 정당화** — Theorem 4의 almost-sure 수렴 주장이 이것 없이는 성립 안 함.

확률 미적분이 **우리 formulation의 "불확실성" 전체를 다루는 유일한 일관된 언어**. 사용하지 않고 Layer S를 쓸 수는 있지만, 정리 진술이 훨씬 약해지고 실제 잡음에서 벗어남.
