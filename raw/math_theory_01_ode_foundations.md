---
title: 이론 배경 1 — ODE 기초와 Volterra 시리즈
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: theory_background
supports: [raw/formulation_layer_D_theorems_1_3.md]
---

# 이론 배경 1 — ODE 기초와 Volterra 시리즈

Layer D 정리 1~3의 증명에서 사용한 네 가지 고전적 도구를 정리합니다: Picard-Lindelöf 정리, Lipschitz 연속성, LTI 시스템 이론과 합성곱 표현, Volterra 시리즈. 이들은 서로 **사슬로 연결**되어 "결정적 ODE의 해가 존재하고 → 선형 이론으로 풀 수 있고 → 비선형으로 일반화된다"는 논리를 형성합니다.

---

## 1. Picard-Lindelöf 정리 (해의 존재성과 유일성)

### 수학적 진술

초기값 문제 `ẋ = f(t, x), x(t₀) = x₀`에 대해, 만약 `f`가 `t`에 대해 연속이고 `x`에 대해 Lipschitz 연속이면, 어떤 구간 `[t₀−δ, t₀+δ]` 위에서 **유일한** 해 `x(t)`가 존재한다.

### 유도 스케치 (축약 사상 정리)

적분 형태로 변환:
```
  x(t) = x₀ + ∫_{t₀}^{t} f(s, x(s)) ds
```
우변을 연산자 `T[x](t) := x₀ + ∫ f(s, x(s)) ds`로 정의하면, Lipschitz 조건 `|f(t,x) − f(t,y)| ≤ L·|x−y|` 하에서:
```
  ‖T[x] − T[y]‖_∞ ≤ L · δ · ‖x − y‖_∞
```
`L·δ < 1`이 되도록 `δ`를 작게 잡으면 `T`는 **축약 사상(contraction)**이 되고, Banach 고정점 정리에 의해 유일 고정점 존재. 이 고정점이 ODE의 해.

### 한글 의미

**"기울기 f가 x에 대해 너무 가파르게 변하지 않으면, 주어진 출발점에서 시작한 궤적이 딱 하나만 존재한다."** 물리적으로: 같은 초기 조건의 전자 회로가 두 번 돌렸을 때 매번 같은 궤적을 따름을 보증.

### Layer D에서의 사용

**Theorem 1 (Well-Posedness)의 Step 2에서 직접 적용.** 활성화 함수 N이 Lipschitz이고 W(t)·u(t)가 유계이면, (D1)의 우변이 x에 대해 Lipschitz이므로 Picard-Lindelöf로 해 존재성·유일성을 얻습니다. 이 정리 없이는 "시스템이 잘 정의된다"는 주장 자체가 불가능.

### 참조
- Coddington & Levinson, *Theory of Ordinary Differential Equations*, McGraw-Hill (1955), Ch. 1.
- Hartman, *Ordinary Differential Equations*, 2nd ed. (1982), Ch. 2.

---

## 2. Lipschitz 연속성

### 정의

함수 `f: ℝⁿ → ℝᵐ`가 Lipschitz 연속 ⟺ 상수 `L` 존재하여 모든 `x, y`에 대해
```
  ‖f(x) − f(y)‖ ≤ L · ‖x − y‖
```

### 미분 가능성과의 관계

`f`가 `C¹`이고 `‖∇f‖ ≤ L`이면 `f`는 Lipschitz (평균값 정리). 역은 성립 안 함 — Lipschitz는 미분 가능성보다 약한 조건. 예: `f(x) = |x|`은 Lipschitz이지만 `x=0`에서 미분 불가.

### 우리 formulation의 N이 Lipschitz를 만족하는 이유

| N 옵션 | Lipschitz 상수 L |
|---|---|
| Kink (N_α) | max(α, α+β) — 두 조각 중 기울기 최대값 |
| Subthreshold exp (N_β) | I_S · exp(V_max/nV_T) / (nV_T) — 전압 범위가 유계면 유한 |
| Saturation (N_γ) | 2·μC_ox·(W/L)·(V_max − V_T) — saturation 구간 끝에서 최대 |

**핵심**: 실리콘 전압 레일 `[V_SS, V_DD]`이 자동으로 domain을 truncate하므로 모든 N이 유계 도메인 위에서 Lipschitz.

### 한글 의미

**"입력의 변화에 비례하는 만큼만 출력이 변한다는 조건."** 물리적으로: 작은 잡음이 들어와도 출력이 폭발적으로 튀지 않음. 이 덕분에 `x(t)`가 유한 구간에서 유계를 유지하고 Picard-Lindelöf가 적용됨.

### 참조
- Rudin, *Principles of Mathematical Analysis*, Ch. 5.
- Evans, *Partial Differential Equations*, Appendix A (for metric space Lipschitz).

---

## 3. Gronwall 부등식 (안정성 보장)

### 수학적 진술

`u(t)`가 연속이고 `α ≥ 0`이 상수일 때:
```
  u(t) ≤ α + ∫_{t₀}^{t} β(s)·u(s) ds    ⟹    u(t) ≤ α · exp(∫_{t₀}^{t} β(s) ds)
```

### 유도

`v(t) := α + ∫ β u`로 치환하면 `v̇ = β·u ≤ β·v`, 로그-적분하면 `v(t) ≤ v(t₀)·exp(∫β)`. `u ≤ v`이므로 결과.

### 우리 formulation에서의 사용

Layer D Theorem 1 Step 3에서 "trajectory가 `𝒲` 박스를 벗어나지 않는다"의 정량적 증명에 직접 쓰입니다. 섭동 크기 `‖η S δW‖`가 유계이므로 `‖W(t)‖`의 성장률 경계가 지수적으로 제한됨을 보임.

### 한글 의미

**"지수적 성장을 억제하는 만능 도구."** ODE의 적분 부등식을 풀면 해의 크기가 폭발하지 않음을 보장.

### 참조
- Teschl, *Ordinary Differential Equations and Dynamical Systems*, Ch. 2 (명시적 Gronwall).

---

## 4. LTI 시스템 이론과 합성곱 표현

### 핵심 정리

선형 시불변(LTI) 시스템 `L : u(·) → y(·)`는 **합성곱**으로 표현됨:
```
  y(t) = (h * u)(t) = ∫_{-∞}^{∞} h(t − τ) · u(τ) dτ
```
여기서 `h(t) = L[δ](t)`는 **임펄스 응답**. 증명: 선형성 + 시불변성 + 입력을 임펄스들의 적분으로 분해.

### RC 저역 통과 필터의 임펄스 응답

Layer C의 integrator `I_τ`는 `τ ẋ + x = u`의 해. 이 ODE의 임펄스 응답:
```
  h(t) = (1/τ) · exp(-t/τ) · 1_{t ≥ 0}
```
즉 `I_τ`는 시정수 `τ`의 1차 저역통과 필터. 이 사실이 **integration이 물리적 연산**이라는 핵심 주장의 수학적 근거.

### Layer D에서의 사용

**Theorem 3 Part (a)**에서 Volterra 1차 kernel의 구성:
```
  h_1(t; τ; W) = h_x(t − τ) · W · h_E(τ)
```
각 요소가 해당 물리 블록의 임펄스 응답 — `h_x`는 활성화 RC, `h_E`는 인코더 RC.

### 한글 의미

**"선형 시스템은 임펄스에 대한 반응만 알면 모든 입력에 대한 반응을 계산할 수 있다."** 물리적으로: 한 번 RC 상수만 측정하면 그 회로의 입출력 관계가 전부 결정됨. "형상은 달라도 본질은 임펄스 응답"이라는 신호처리의 근본 명제.

### 참조
- Oppenheim & Willsky, *Signals and Systems*, 2nd ed., Ch. 2.
- Papoulis, *Signal Analysis*, Ch. 6.

---

## 5. Taylor 전개와 비선형 섭동 분석

### 수학적 진술

해석적(analytic) 함수 `N`에 대해 `z₀` 근방에서:
```
  N(z) = Σ_{k=0}^∞ (1/k!) · N^{(k)}(z₀) · (z − z₀)ᵏ
```
수렴 반경 `R`은 `z₀`에서 `N`의 가장 가까운 특이점까지의 거리.

### Layer D에서의 사용

**Theorem 3 Part (a)**에서 analytic N (subthreshold exp, saturation square)의 Volterra 전개 유도:
- N의 Taylor 전개를 (D1)에 대입
- 각 차수의 항을 재귀적으로 풀어 Volterra kernel `h_k`를 얻음
- 수렴 반경 = `‖u‖` bound

### 한글 의미

**"분석적 함수는 작은 신호 범위에서 다항식으로 완벽하게 근사된다."** 1차 항 = 선형 응답, 2차 항 = 고조파 왜곡, 3차 항 = 삼중 주파수 혼합. 아날로그 회로 설계에서 왜곡 분석의 표준 언어.

---

## 6. Volterra 시리즈 — 비선형 시스템의 정준(canonical) 표현

### 수학적 진술 (Volterra 1930, Wiener 1942, Rugh 1981)

시간 불변 비선형 시스템 `y = F[u]`이 *충분히 매끄러우면* Volterra 시리즈로 표현 가능:
```
  y(t) = h_0 + Σ_{k=1}^∞ ∫...∫ h_k(τ_1, ..., τ_k) · u(t−τ_1) ⋯ u(t−τ_k) dτ_1 ⋯ dτ_k
```
- `h_1`: 1차 kernel (LTI 임펄스 응답)
- `h_k`: k차 kernel (k중 합성곱 이중 이상)

### 유도 (Rugh 1981, Ch. 1-2)

*Step 1*: Taylor 전개로 N을 차수별로 분해 `N(z) = Σ_k N^{(k)}(z₀)(z−z₀)^k/k!`.

*Step 2*: (D1)을 반복 대입(iterative substitution). 작은 신호 가정 `u → εu`를 하고 `ε`에 대해 급수 전개, 각 차수의 항을 모음:
```
  x(t) = ε · x_1(t) + ε² · x_2(t) + ε³ · x_3(t) + ...
```
`x_k(t)`는 `u`에 대한 `k`-중 convolution으로 표현됨.

*Step 3*: 각 `x_k`의 convolution kernel을 `h_k`로 정리.

### Switched Volterra (piecewise-linear N)

N이 piecewise-linear(kink)이면 Taylor 전개가 분기점에서 끊김. 대신:
- 입력 공간을 polytope `{P_q}_{q ∈ Q}`로 분할 (각 `P_q`는 N의 영역 tuple 하나)
- 각 `P_q` 위에서 N이 선형이므로 **해당 영역에서는 LTI 시스템**
- 영역 전환점은 threshold 교차 — 해석적으로 불연속이지만 측도 0

이것이 **switched Volterra operator** — Layer D Theorem 3 Part (b)의 구조.

### Layer D에서의 사용

**Theorem 3 전체.** Volterra 시리즈 가능성 자체가 "신호처리 완결성"의 엄밀한 정의:
- 입력 → 출력 사상이 고전적 convolution(선형 대수 + 적분)으로 표현됨
- 어떤 차수에서도 "lookup"이나 "symbolic decision"이 필요 없음
- 따라서 all-analog 구현이 원리적으로 가능

### 한글 의미

**"비선형 시스템을 '선형 시스템 + 2차 상호작용 + 3차 상호작용 + ...'으로 분해하는 방법."** 3차항까지만 쓰면 일반적 아날로그 회로의 왜곡 분석에 충분. 우리 NN의 경우에도 이 전개가 유한 차수로 수렴하면 "신호처리 장치"로 정당하게 부를 수 있음.

### 왜 이 정리를 사용했는가 (연결성)

1. **"digitalization 우회"의 수학적 증거** — 신호처리 완결성이 막연한 주장이 아니라 "Volterra 시리즈가 수렴한다"는 구체적 수학 명제로 환원됨.
2. **EGGROLL 섭동의 해석** — rank-1 섭동 `ab^T`가 Volterra kernel에 미치는 영향은 1차 kernel의 perturbation → `h_1(t;τ;W+δW) = h_1(t;τ;W) + h_x(t−τ)·ab^T·h_E(τ)`. 추가 계산 없이 즉시 편미분 형태로 얻어짐.
3. **Stage 2 simulation 가이드** — functional simulation에서 Volterra kernel 수치 계산 → SPICE 시뮬과 비교의 기준. 예측값을 정확한 수식으로 뽑을 수 있음.

### 참조
- Rugh, *Nonlinear System Theory: The Volterra/Wiener Approach*, Johns Hopkins Univ. Press (1981) — **표준 reference**. 현재는 저자 웹사이트에서 PDF 무료 공개.
- Schetzen, *The Volterra and Wiener Theories of Nonlinear Systems*, Wiley (1980).
- Boyd & Chua, *Fading Memory and the Problem of Approximating Nonlinear Operators with Volterra Series*, IEEE TCS (1985) — 수렴 조건.

---

## 연결성 요약 — 다섯 도구가 하나의 사슬

```
Lipschitz 연속
    │ (조건 제공)
    ▼
Picard-Lindelöf 정리 ──── Layer D Theorem 1 (해의 존재성)
    │
    │ + Gronwall ── 유계성 보증
    ▼
LTI 시스템 + 합성곱 ──── Layer D Theorem 2 (연산자 실현성)
    │
    │ + Taylor ── 비선형 확장
    ▼
Volterra 시리즈 ──── Layer D Theorem 3 (신호처리 완결성)
```

이 사슬이 **"물리 소자로 구현된 비선형 ODE 시스템은 고전적 신호처리 객체다"**라는 하나의 명제로 수렴. Layer S가 여기에 확률 성분을 더할 때도 이 deterministic 뼈대가 전제됩니다.
