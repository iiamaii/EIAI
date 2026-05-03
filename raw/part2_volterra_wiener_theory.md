---
title: Part 2 — Volterra/Wiener Nonlinear System Theory (Rugh, Schetzen)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: textbook_classic_summary
part: 2
covers:
  - Rugh (1981) Nonlinear System Theory: The Volterra/Wiener Approach
  - Schetzen (1980) The Volterra and Wiener Theories of Nonlinear Systems
  - Boyd, Chua (1985) Fading Memory and Volterra approximation
---

# Part 2 — Volterra/Wiener 비선형 시스템 이론

비선형 입출력 사상을 multi-dim convolution kernel의 시리즈로 표현하는 정전 이론. 우리 formulation Theorem 3 (signal-processing completeness)의 수학적 어휘.

---

## 1. Volterra 시리즈 — 비선형 시스템의 캐노니컬 표현

### 정의 (Volterra 1930, 형식화)

시간 불변 비선형 시스템 `y = F[u]`이 **충분히 매끄러우면** Volterra 시리즈로:
```
  y(t) = h_0
       + ∫ h_1(τ_1) u(t − τ_1) dτ_1
       + ∫∫ h_2(τ_1, τ_2) u(t − τ_1) u(t − τ_2) dτ_1 dτ_2
       + ∫∫∫ h_3(τ_1, τ_2, τ_3) u(t − τ_1) u(t − τ_2) u(t − τ_3) dτ_1 dτ_2 dτ_3
       + ...
```

- `h_0` = DC offset
- `h_1` = 선형 임펄스 응답 (LTI 부분)
- `h_2` = 2차 kernel — 고조파, 인터모듈레이션
- `h_k` = k차 multi-dim kernel

### 직관

LTI 시스템은 Volterra 시리즈의 1차 항만. 비선형성이 추가되면 2차, 3차 kernel이 입력 신호의 자기-상관, 자기-제곱 등에 비례하는 출력 성분을 만듦.

오디오 회로의 THD (Total Harmonic Distortion) 분석이 본질적으로 Volterra 2-3차 kernel 측정.

---

## 2. Rugh (1981) — *Nonlinear System Theory: The Volterra/Wiener Approach*

표준 textbook. 저자(W. J. Rugh, Johns Hopkins) 사이트에 무료 PDF 공개.

### 2.1 Volterra kernel의 수학적 구조

대칭화(symmetrization): `h_k`는 인덱스 순열에 대해 대칭으로 가정 가능 (정보 손실 없음).

n차 kernel의 차원: `h_n: ℝⁿ → ℝ`, `n!`-fold 대칭.

### 2.2 Volterra 시리즈의 수렴 조건

입력 `u`의 norm이 작으면 시리즈 수렴. 정확한 수렴 반경은 N의 분석성에 의존.

```
  R_conv ∝ 1 / (sup_z |N''(z)|)        (대략)
```

Boyd-Chua (1985)는 fading memory를 가지는 비선형 시스템 (입력의 과거 영향이 시간에 따라 감소)이 Volterra 시리즈로 균등 근사 가능함을 증명.

### 2.3 Hammerstein과 Wiener 시스템 분해

비선형 시스템의 두 표준 분해:

**Hammerstein**: 비선형 정적 함수 → LTI 필터
```
  y(t) = (h * f(u))(t)
```

**Wiener**: LTI 필터 → 비선형 정적 함수
```
  y(t) = f((g * u)(t))
```

각자 더 일반적인 Volterra 시리즈의 특수 경우. 우리 formulation의 forward path:
- Encoder E (Hammerstein-like, 선형 LPF 후 ID 비선형)
- N(W·E[u]): Wiener-like (LTI W·E followed by pointwise N)

### 2.4 다중 입력 일반화 (MIMO Volterra)

벡터 입력 `u(t) ∈ ℝᵐ`, 벡터 출력 `y(t) ∈ ℝⁿ`:
```
  y_i(t) = Σ_k Σ_{j_1,...,j_k} ∫...∫ h_k^{i;j_1,...,j_k}(τ_1,...,τ_k) u_{j_1}(t-τ_1) ... u_{j_k}(t-τ_k) dτ
```

→ 우리 PPCA가 m개 입력 채널, n개 출력 채널이므로 정확히 MIMO Volterra.

### 2.5 Switched Volterra (PWL N의 경우)

N이 piecewise-linear (kink)이면 분석적 Taylor 전개 불가. 대신 입력 공간을 polytope로 분할, 각 영역 내부에서 LTI Volterra:
```
  y(t) = Σ_q  1_{u(·) ∈ P_q} · V^q[u](t)
```
- `P_q`는 영역 (Hanin-Rolnick 경계로 셀 수 결정)
- `V^q`는 각 영역의 LTI 시스템

이게 우리 formulation의 **Theorem 3 Part (b)** — kink/PWL N에 대한 SP-completeness 진술.

### 참조
- Rugh, *Nonlinear System Theory: The Volterra/Wiener Approach*, Johns Hopkins Univ. Press (1981) — 저자 사이트 무료 PDF.
- Boyd, Chua, *Fading Memory and the Problem of Approximating Nonlinear Operators with Volterra Series*, IEEE TCS, 32 (1985), pp. 1150-1161.

---

## 3. Schetzen (1980) — *The Volterra and Wiener Theories of Nonlinear Systems*

MIT의 Schetzen이 Wiener와의 직접 협력 후 정리한 정전. Rugh보다 통계적 측면 (random input identification) 강조.

### 3.1 Wiener Functional Series (직교화된 Volterra)

Volterra 시리즈는 일반 입력에 대해 cross-talk가 있음 (낮은 차수 kernel이 높은 차수 동작에 영향). Wiener는 **white Gaussian input에 대해 직교화**된 시리즈를 정의:

```
  y(t) = Σ_n G_n[k_n; u]
```

`G_n`이 n차 Wiener functional, white-noise 입력에 대해 `E[G_m G_n] = 0` for m ≠ n. 이로써 각 차수 kernel을 독립적으로 식별 가능.

### 3.2 Cross-correlation 기반 kernel 식별

White-noise 입력 `u(t)`에 대해 출력 `y(t)`를 측정한 뒤:
```
  k_n(τ_1, ..., τ_n) ∝ E[y(t) · u(t-τ_1) ... u(t-τ_n)]
```
- 1차 kernel: 입력-출력 cross-correlation
- 2차 kernel: 3-way cross-correlation
- ...

이게 우리 formulation Stage 3a simulation에서 **PPCA의 Volterra kernel 측정 방법** — random 입력 주입 + 출력 cross-correlation.

### 3.3 Wiener G-functional의 명시적 형태

n=1: G_1[k_1; u] = ∫ k_1(τ) u(t-τ) dτ
n=2: G_2[k_2; u] = ∫∫ k_2(τ_1,τ_2) u(t-τ_1) u(t-τ_2) dτ - σ² ∫ k_2(τ,τ) dτ
...

`σ²` 보정항이 Volterra cross-talk를 제거.

### 참조
- Schetzen, *The Volterra and Wiener Theories of Nonlinear Systems*, Wiley (1980, 재출간 Krieger 2006).

---

## 통합 — Volterra/Wiener가 우리 formulation에 주는 것

### 1. Theorem 3 (Signal-Processing Completeness)의 직접 어휘

"입력→출력 사상이 switched Volterra operator class에 속한다"는 진술이 그대로 SP-complete = Rugh/Schetzen 표준 객체임을 의미.

### 2. PPCA 동역학의 polynomial 근사

`x(t) = T_W[u](t)`를 Volterra 시리즈로:
```
  x(t) = h_0(W) + (h_1 ⊗ u)(t) + (h_2 ⊗ u^2)(t) + ...
```
W가 Volterra kernel의 계수에 명시적으로 들어감 → 학습 = "kernel 계수 조절".

### 3. Stage 3a simulation에서의 측정 방법

White-noise 입력 → 출력 cross-correlation → Wiener kernel 추정 → 이론 예측과 비교. SPICE에서도 동일하게 적용 가능.

### 4. 비선형 왜곡 분석

Volterra 2-3차 kernel norm이 PPCA forward path의 "비선형성 강도" 정량 척도. THD 분석과 동일한 방법.

### 5. EGGROLL의 rank-1 perturbation Volterra 영향

`δW = ab^T` 섭동이 Volterra kernel에 미치는 영향:
- 1차 kernel: `Δh_1(t;τ; W+δW) − Δh_1(t;τ; W) = h_x(t-τ) · ab^T · h_E(τ)`
- 2차 kernel: 변화 없음 (선형 섭동)

→ ES update가 Volterra kernel space에서의 rank-1 미분에 해당.

---

## Part 2 textbook 3편 + Volterra의 통합 매트릭스

```
  Mead/Liu/Vittoz       Translinear (Gilbert)    Volterra/Wiener
  ─────────────────     ──────────────────       ─────────────────
  Subthreshold I-V      Exp/log primitives        Kernel decomposition
  Capacitor sum         Current-mode addition     Linear h_1
  LIF neuron            Schmitt comparator        Threshold N
  Floating-gate         (storage)                 Time-varying W(t)
  STDP                  -                         Adaptive kernel update
```

→ 모든 Part 2 operator가 **두 가지 표현 방식**을 갖음:
1. **Circuit form** (Mead/Liu/Gilbert/Toumazou)
2. **Mathematical form** (Volterra/Wiener)

두 표현이 동치임이 우리 PPCA formulation의 SP-completeness 보증.

다음 노트: Part 3 — 반도체 소자 4편 (Sze/Tsividis 정전 + 멤리스터/PCM + MRAM + flash/charge-trap).
