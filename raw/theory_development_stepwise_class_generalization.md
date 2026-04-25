---
title: 단계별 이론 전개 — 대안 카탈로그를 수학적 일반화로 격상
author: ws
captured_at: 2026-04-25
contributor: ws
note_type: stepwise_theory_development
builds_on: [raw/alternative_candidate_catalog.md, raw/formulation_layer_C_symbolic.md, raw/formulation_layer_D_theorems_1_3.md, raw/formulation_layer_S_theorems_4_5.md]
---

# 단계별 이론 전개 — 대안 카탈로그를 수학적 일반화로 격상

대안 후보 카탈로그가 보여준 사실: **같은 PPCA 흐름이 여러 물리 구현으로 가능**. 이 사실을 수학적 정리로 만들기 위해 단계별로 formulation을 확장합니다.

목표: "PPCA = 단일 아키텍처"에서 "PPCA = operator class 위의 한 점"으로 위상 전환. 이 전환이 끝나면 새 슬롯 조합을 시도할 때마다 형식 검증이 가능한 **체크리스트**가 생깁니다.

---

## Step 0 — 모티베이션: instance에서 class로

기존 Layer C에서 우리는 `E = E_bitplane`, `W = W_crossbar`, `N = N_kink` 같은 **고정된 연산자**를 정의했습니다. Layer D Theorem 1-3과 Layer S Theorem 4-5의 모든 증명은 이 특정 선택에 의존하는 것처럼 보였습니다.

하지만 대안 카탈로그가 7개 슬롯 × 3-7개 후보를 나열함으로써 다음 질문을 강제합니다:

> **"같은 정리가 다른 슬롯 선택에서도 성립하는가? 성립한다면 어떤 조건 하에서?"**

답: 성립한다 — 단, 각 후보가 특정 **수학적 속성 집합**(operator class 멤버십)을 만족하면. 이 속성 집합을 명시화하는 것이 본 노트의 핵심.

---

## Step 1 — Admissible Operator Classes 정의

각 슬롯에 대해 "받아들일 수 있는" 연산자의 수학적 조건 명시. 이것이 새 모든 정리의 가정이 됩니다.

### Class 𝒞_E (Admissible Encoder)

```
  E ∈ 𝒞_E  ⟺  (i) E : 𝒰 → 𝒳 가 선형 또는 affine
              (ii) ‖E‖_op ≤ M_E (유계 연산자 norm)
              (iii) 입력 대역폭 B → 출력 대역폭 ≤ B' < ∞ 보존
              (iv) 물리 실현: bandlimited analog kernel
```

**예**: bit-plane charge, pulse-density, ΣΔ, PWM, current-mode 모두 포함. 비선형 인코딩(예: nonlinear DAC)은 (i) 위반으로 제외.

### Class 𝒞_W (Admissible Linear Combiner)

```
  W ∈ 𝒞_W  ⟺  (i) W ∈ ℝ^{n×m} 선형 행렬
              (ii) ‖W‖_F ≤ W_max (Frobenius 유계)
              (iii) 각 cell W_{ij}가 독립적으로 갱신 가능
              (iv) 물리 실현: Kirchhoff sum, charge sharing, photonic interference, 또는 등가
```

**예**: memristor crossbar, PCM, gain cell, MRAM, photonic MZI 모두 포함. 비선형 결합(예: 곱셈 layer)은 (i) 위반으로 제외 — 별도 슬롯 N으로 옮겨가야 함.

### Class 𝒞_N (Admissible Nonlinearity)

```
  N ∈ 𝒞_N  ⟺  (i) N : ℝ^n → ℝ^n 점별(pointwise) 적용
              (ii) Lipschitz 연속 (상수 L_N < ∞ on bounded domain)
              (iii) 단조 비감소 (각 성분에 대해)
              (iv) 부호 commutativity: sign(N(z) − N(θ)) = sign(z − θ)
                   for some reference θ
              (v) 물리 실현: transistor I-V, diode knee, opamp saturation, 등
```

**예**: kink, subthreshold exp, saturation, Schottky, opamp tanh, CMOS inverter, LIF의 spike rate, OTS 모두 포함. Hysteresis가 큰 비선형(예: Schmitt trigger의 dead band)은 (iv) 위반으로 제외 — 별도 슬롯 D로 보낼 수 있음.

### Class 𝒞_D (Admissible Decoder)

```
  D ∈ 𝒞_D  ⟺  (i) D : ℝ^n → {0,1}^p 비교기 형태
              (ii) 점별 thresholding: D(z)_j = 1_{z_j > θ_j}
              (iii) N과 같은 device family로 실현 (shared-silicon claim)
```

**예**: 모든 comparator, Schmitt trigger, sense amp, 광-검출기 threshold.

### Class 𝒞_S (Admissible Score)

```
  S ∈ 𝒞_S  ⟺  (i) S : ℝ^n × ℝ^n → ℝ_+ 스칼라 출력
              (ii) S(z, y*)는 ‖z − y*‖에 대해 단조 감소
              (iii) Lipschitz 연속 on bounded domain
              (iv) 물리 실현: subthreshold transistor, photon counter,
                   charge-packet comparator, race logic, 등
              (선택) (v) Gaussian-like form S = exp(−‖z−y*‖²/2σ²)
                       — ES score identity의 정확한 적용
```

**핵심 관찰**: (v)는 *충분 조건*이지 *필요 조건*이 아님. (i)-(iv)만 있으면 일반화된 score function 추정기로 충분 (REINFORCE의 일반 형태).

### Class 𝒞_R (Admissible Sensor Readout)

```
  R ∈ 𝒞_R  ⟺  (i) R : 𝒲 → ℝ 또는 {0,1}, 셀별 주소 지정
              (ii) 비파괴(non-destructive): 읽기당 셀 상태 변동 ε_R < ε_threshold
              (iii) 출력 형태: 아날로그 전압 또는 1-bit
```

### Class 𝒞_Σ (Admissible Archive Operators)

```
  Σ ∈ 𝒞_Σ  ⟺  (i) Σ : 𝒲 → 𝒲̄ (snapshot) + Π : 𝒲̄ → 𝒲 (restore) 쌍
              (ii) τ_archive > τ_W (영구성)
              (iii) write endurance ≥ N_writes_required
```

---

## Step 2 — Generalized Layer C (Parametric Form)

기존 Layer C가 "특정 연산자"를 정의했다면, 이제는 **모든 admissible 조합**을 동시에 다룹니다.

### Generalized System

PPCA instance =  tuple
```
  𝒮 := (E, W, N, D, S, R, Σ)  ∈  𝒞_E × 𝒞_W × 𝒞_N × 𝒞_D × 𝒞_S × 𝒞_R × 𝒞_Σ
```

이 tuple에 시정수 4개 `(τ_x, τ_δ, τ_W, τ_archive)`를 더한 것이 PPCA의 **complete spec**:
```
  𝒮_full := (E, W, N, D, S, R, Σ, τ_x, τ_δ, τ_W, τ_archive)
```

전체 admissible 공간:
```
  ℳ_PPCA := { 𝒮_full | 각 component가 자기 class에 속함 + τ_x ≲ τ_δ ≪ τ_W ≪ τ_archive }
```

### Canonical PPCA의 위치

기존 PPCA는 `ℳ_PPCA`의 한 점:
```
  𝒮_canonical = (E_bitplane, W_crossbar, N_kink, D_comparator,
                  S_subthreshold, R_sense_amp, (Σ_flash, Π_flash),
                  τ_x ≈ ns, τ_δ ≈ 100 ns, τ_W ≈ 10 μs, τ_archive ≈ minutes)
```

대안 카탈로그의 4개 application bundle은 `ℳ_PPCA`의 **다른 4개 점**.

---

## Step 3 — Theorem 1′ (Generalized Well-Posedness)

### 진술

```
  ∀ 𝒮_full ∈ ℳ_PPCA :
    ODE 시스템 (D1)–(D6)이 임의 input u ∈ 𝒰와 초기조건에 대해 유일 해를 가진다.
```

### 증명 (이전 증명의 일반화)

기존 Theorem 1은 N의 Lipschitz와 W의 boundedness를 사용. Class 정의에 의해:
- `N ∈ 𝒞_N` ⟹ Lipschitz with constant `L_N` (조건 ii)
- `W ∈ 𝒞_W` ⟹ `‖W‖ ≤ W_max` (조건 ii)
- `E ∈ 𝒞_E` ⟹ bounded output (조건 ii, iii)

따라서 (D1)의 RHS가 (x, W, δW)에 대해 Lipschitz 균등. Picard-Lindelöf로 유일 해. **∎**

### 한글 의미

**"Class 멤버십이 곧 well-posedness 보증서."** 새 슬롯 조합을 제안할 때 그 후보가 𝒞_X의 조건들을 만족함만 보이면 이 정리는 자동 적용. Picard-Lindelöf를 매번 다시 증명할 필요 없음.

---

## Step 4 — Theorem 2′ (Generalized Realizability)

### 진술

```
  ∀ 𝒮_full ∈ ℳ_PPCA : 
    각 연산자 (E, W, N, D, S, R, Σ)가 device-physics primitive로 실현됨.
```

### 증명

각 class 정의 자체가 "물리 실현 가능"을 명시 조건으로 포함 (조건 (iv) 또는 (v)). 따라서 class 멤버십 = realizability. **∎**

### 한글 의미

**"Class 멤버십 정의가 곧 realizability 정의."** 카탈로그에 있는 모든 후보는 자동으로 이 정리에 포함됨. 새 후보를 추가하려면 class 조건의 (iv)/(v)에 명시적 device 매핑을 보이면 됨.

---

## Step 5 — Theorem 3′ (Generalized Signal-Processing Completeness)

### 진술

```
  ∀ 𝒮_full ∈ ℳ_PPCA :
    입력→출력 사상 T : u(·) → y(·) ∈ y(·) ∈ Switched Volterra Operator class.
```

### 증명 (이전 Volterra 유도의 일반화)

Layer D Theorem 3은 N이 analytic이거나 PWL일 때 Volterra 표현을 유도했음. 𝒞_N의 모든 멤버는 다음 둘 중 하나에 속함:

**Case A — Analytic N**: subthreshold exp, smooth saturation 등.
- N의 Taylor 전개로 Volterra kernel 직접 계산.
- 수렴 반경은 N의 분석성과 입력 크기에 의해 결정.

**Case B — Piecewise-Linear/Affine N**: kink, hard tanh, sign, OpAmp saturation, LIF rate등.
- `𝒞_N` 조건 (iii) 단조성 + (iv) 부호 commutativity가 영역 분할을 well-defined하게 만듦.
- Zaslavsky / Hanin-Rolnick 경계가 영역 수에 적용.
- 각 영역 내부는 LTI Volterra (실제로는 1차 = LTI).

**Case C — Hybrid (PWL + Analytic의 합성)**: 예 Schottky knee = smooth approximation of hard threshold. 
- Local Taylor + 영역 분할의 결합. 두 도구가 모두 적용.

세 case 모두 switched Volterra operator class 안에 머무름. **∎**

### 한글 의미

**"𝒞_N의 모든 멤버는 신호처리 완결성을 보장한다"** — 그래서 다른 비선형 후보를 시도해도 "PPCA가 신호처리 객체다"라는 핵심 주장이 유지됨. Theorem 3'가 신호처리 완결성의 **불변량(invariant)**임.

### 새로운 정량 결과

| N 클래스 | 수렴 반경 / 영역 수 |
|---|---|
| Subthreshold exp (analytic) | 수렴 반경 ∝ 1/L_N (Taylor) |
| Kink (PWL 2-region) | 영역 수 = O(2^n) per layer |
| Schottky knee (smooth-PWL hybrid) | 부분 Taylor + smooth threshold |
| LIF (rate-coded, effectively PWL) | 영역 수 ∝ spike threshold count |
| Hard tanh (clipped linear) | 3-region per channel |

각 N 후보의 정량적 영역 수가 **Theorem 5′의 noise tolerance 분석에 입력**으로 사용됨.

---

## Step 6 — Theorem 4′ (Generalized Convergence)

### 진술

```
  ∀ 𝒮_full ∈ ℳ_PPCA with appropriate schedule {η_t}:
    W(t) → W* almost surely  as t → ∞
  
  여기서 W*는 generalized loss L_𝒮(W) = E[−S(W; u, y*)]의 국소 최소점.
```

### 증명 스케치 — REINFORCE 일반화

Layer S Theorem 4는 Gaussian S에 대한 ES score identity를 사용:
```
  ∇_W E[S(W + δW)] = E[S · δW] / σ²    (when S is Gaussian-derived)
```

일반 S에 대해서는 **REINFORCE identity** (Williams 1992)가 보다 일반:
```
  ∇_W E[S(W; ξ)] = E[S(W; ξ) · ∇_W log p(ξ; W)]
```
여기서 ξ는 perturbation, p는 perturbation distribution.

`δW ~ 𝒩(0, σ²)`인 경우 `∇_W log p = δW/σ²` ⟹ Layer S 원본 형태 회복.

**일반 perturbation distribution이어도** (예: Bernoulli for stochastic bitstream encoding) REINFORCE identity는 성립.

### Two-timescale 조건 (변경 없음)

`τ_W ≫ τ_δ`만 만족하면 Borkar의 two-timescale stochastic approximation은 𝒞_S 멤버십과 무관하게 적용됨. 이것이 "K_batch ≈ 50" identity가 모든 PPCA instance에 보존되는 이유.

### Lyapunov 분석 (S에 대한 일반화)

`V(W) = L_𝒮(W) − L_𝒮(W*)` Lyapunov 함수 사용.
- Itô's lemma로 `dV` 계산
- `S ∈ 𝒞_S` 조건 (ii) 단조 감소 ⟹ ∇L · drift < 0 in basin of attraction
- Robbins-Monro로 잡음 항 소멸
- `V → 0` a.s. ⟹ `W → W*`

`S`의 구체 형태(Gaussian vs Poisson photon-counting vs PWM duty-cycle)는 Lyapunov 분석에서 **부호와 단조성만 필요** — 구체 함수형은 무관. **∎**

### 한글 의미

**"학습 수렴은 score의 정확한 함수형이 아니라 그 단조성에만 의존한다."** 따라서 photon-counting score (Poisson distribution), race logic score (decreasing in delay), PWM score (decreasing in duty-cycle error) 모두 같은 수렴 정리 적용 가능.

### Application별 specialization

- **Biomedical implant**: S = Schmitt trigger 1-bit. Convergence rate가 단순 Bernoulli 분석으로 환원.
- **Photon-counting**: S = exp(−λ‖z−y*‖²) with λ from photon flux. Rate가 λ에 비례.
- **Race logic**: S = 1/τ_first. Rate가 race granularity에 비례.

---

## Step 7 — Theorem 5′ (Generalized Noise Tolerance)

### 진술

```
  ∀ 𝒮_full ∈ ℳ_PPCA :
    E[‖W(∞) − W*‖²]  ≤  C_H(𝒮) · σ_eff²(𝒮) / η
  
  여기서 σ_eff²(𝒮) = thermal_𝒮 + flicker_𝒮 + variability_𝒮 + jitter_𝒮 + score_var(𝒮)
```

`σ_eff²`가 PPCA instance에 의존하는 것이 핵심 — 이것이 **slot 선택 → noise budget** 매핑을 제공.

### 증명 (이전 OU 분석의 일반화)

이전과 동일한 OU 정상분포 + Lyapunov 방정식. 차이는 `σ_eff²`의 구체 표현:

| Slot | Canonical 기여 σ² | 대안 기여 σ² |
|---|---|---|
| W (memristor) | ~ μS² thermal + 전도도 mismatch | MRAM: 작음. Gain cell: refresh leak 추가 |
| N (kink MOSFET) | sub-mV V_T 변동 | LIF: spike timing jitter. Schottky: 0.1V V_F 변동 |
| S (subthreshold) | shot noise from nA current | Photon counting: Poisson std=√N. Schmitt: 1-bit 양자화 |
| Encoding | sample-time jitter | ΣΔ: oversampling으로 줄임. PWM: duty cycle 양자화 |

각 application bundle에 대해 `σ_eff²` 계산 가능 → Theorem 5'가 **정량 예측**을 application-specific하게 산출.

### 한글 의미

**"Theorem 5의 bound는 슬롯 선택의 함수다."** 같은 W*를 학습하더라도 다른 slot 조합은 다른 정상상태 오차를 가짐. 이것이 application별 trade-off의 수학적 표현.

### 정량 예시

| Bundle | 예상 σ_eff² | 예상 ‖E[W(∞)] − W*‖² |
|---|---|---|
| Biomedical implant (LIF + STT-MRAM) | 작음 (이산 S는 양자화 + MRAM은 저잡음) | bound는 양자화 한계 |
| Always-on keyword (Schottky + Gain cell) | 중간 | 적당, gain cell refresh 의존 |
| RF backscatter (CMOS inv + SC) | 높음 (고잡음 환경) | bound가 가장 큼, 학습 정확도 저하 가능 |
| HP LLM (canonical) | 낮음 (서브임계 + charge-trap) | bound가 가장 작음 |

이 표는 **수학이 직접 application 선택을 안내**하는 예 — bound가 application 요구 정확도와 호환되는지 확인하는 도구.

---

## Step 8 — Specialization Map

### 정의

```
  Spec : Application → ℳ_PPCA
  Spec(A) := arg min_{𝒮 ∈ ℳ_PPCA} { Power(𝒮) + λ_A · Bound_5'(𝒮) }
```
주어진 application A의 power budget과 정확도 요구를 가중 결합한 비용 함수의 최소점.

### 4개 사례

| A | Spec(A) |
|---|---|
| Biomedical | (Current-mode, STT-MRAM, LIF, Schmitt, VCMA, Event, Biofuel) |
| Always-on | (PWM, Gain cell, Schottky, Charge-packet, Flash, SC, PV) |
| RF backscatter | (Phase-shift, SC array, CMOS inv, Race logic, MRAM, Photonic delay, RF harvest) |
| HP LLM = canonical | (Bit-plane, PCM crossbar, Kink, Subthreshold exp, Charge-trap, Floating-bulk, Wired) |

### 정리 4-5의 구체값

각 Spec(A)에 대해 Theorem 4'와 5'가 구체 수치를 산출. 이 수치들이 Stage 3a simulation의 **검증 대상**.

---

## Step 9 — Verification Protocol (새 슬롯 후보 추가 시 체크리스트)

새로운 device 또는 회로 후보 X를 슬롯 Y에 추가하려는 사람을 위한 형식 체크리스트:

### 단계 1: Class 멤버십 검증

X가 𝒞_Y의 모든 조건을 만족하는지 명시적 증명:

| 슬롯 | 검증할 조건 |
|---|---|
| 𝒞_E | 선형성, 유계 norm, 대역폭 보존 |
| 𝒞_W | 선형, 유계 Frobenius, per-cell 갱신 |
| 𝒞_N | 점별, Lipschitz, 단조, 부호 commutativity |
| 𝒞_D | 점별 thresholding, N과 device family 일치 |
| 𝒞_S | 스칼라, 단조 감소, Lipschitz |
| 𝒞_R | 비파괴, 셀별 주소 |
| 𝒞_Σ | 영구성, 쓰기 가능, 읽기 가능 |

### 단계 2: 정량 파라미터 측정

- Lipschitz 상수 L_X 측정
- 잡음 표준편차 σ_X 측정
- 시정수 τ_X 측정
- 동작 범위 [V_min, V_max] 명시

### 단계 3: Theorem 1'-5' 자동 적용

class 멤버십이 입증되면 다섯 정리가 자동 적용. 즉시 다음을 산출:
- 해의 존재성/유일성 (T1')
- 신호처리 완결 표현 (T3')
- 수렴 보장 (T4')
- noise tolerance bound 구체값 (T5')

### 단계 4: Stage 3a Simulation 검증

NumPy로 functional simulation을 돌려 T5' 예측이 측정값과 일치하는지 확인. 일치하지 않으면 어디 가정이 깨지는지 진단.

### 단계 5: 결과를 그래프에 추가

검증된 새 후보를 `alternative_candidate_catalog`의 해당 슬롯에 노드로 추가. `is_member_of` 엣지를 𝒞_Y class에 연결.

---

## 결론 — Class-level theory의 의미

대안 카탈로그는 단순히 "다른 후보들의 목록"이 아니라 **수학적 일반화의 동기**였습니다. 이 단계별 전개를 통해:

1. **Layer C/D/S 정리들이 single instance가 아닌 class-level에서 성립**함을 명시
2. **새 슬롯 후보 추가가 형식 검증 절차로 환원**됨
3. **Application별 trade-off가 σ_eff²(𝒮)의 함수**로 표현되어 정량적 비교 가능
4. **수학 이론이 단일 PPCA에서 PPCA-family의 이론으로 격상**

전체 흐름(6-phase + 3-tier + forward-only + two-timescale)은 정리들의 **구조적 invariant**로서 모든 admissible instance에 보존됨. 이것이 카탈로그가 약속한 "template invariance"의 수학적 실체.

다음 단계는 이 일반화를 실제 검증하는 것 — Stage 3a functional simulation에서 4개 application bundle 각각에 대해 Theorem 5'의 정량 예측 측정.

---

## Cross-References

**일반화의 기반:**
- `formulation_layer_c_main` — operator 정의 (이제 class의 멤버로 재해석)
- `formulation_layer_d_theorem_1_well_posedness` → T1'로 일반화
- `formulation_layer_d_theorem_3_switched_volterra` → T3'로 일반화
- `formulation_layer_s_theorem_4_convergence` → T4'로 일반화
- `formulation_layer_s_theorem_5_noise_tolerance` → T5'로 일반화

**카탈로그 (instances):**
- `alternative_candidate_catalog_main`
- `alternative_candidate_catalog_slot1_W` ~ `_slot7_power`
- `alternative_candidate_catalog_application_biomedical_implant`
- `alternative_candidate_catalog_application_always_on_keyword`
- `alternative_candidate_catalog_application_rf_backscatter`
- `alternative_candidate_catalog_application_high_performance_llm`
- `alternative_candidate_catalog_claim_template_invariance`
- `alternative_candidate_catalog_claim_canonical_is_specialization`

**이론 사슬 (Invariant under generalization):**
- `math_theory_01_picard_lindelof` — 모든 𝒞_N 멤버에 적용
- `math_theory_01_volterra_series` — 모든 analytic N 멤버에 적용
- `math_theory_02_zaslavsky_theorem` — 모든 PWL N 멤버에 적용
- `math_theory_03_ornstein_uhlenbeck_process` — 모든 𝒞_W 잡음 모델에 적용
- `math_theory_04_borkar_two_timescale` — 모든 (τ_δ, τ_W) 분리에 적용
- `math_theory_05_clt_edgeworth_expansion` — 모든 perturbation 분포에 적용 (rank 분석)

**REINFORCE 일반화:**
- `math_theory_04_nes_score_function`
- `evolution_strategies_at_the_hyperscale_pdf_eggroll`

**PPCA canonical (specialization):**
- `stage2_eggroll_ppca_main` — `Spec(A_HP_LLM)`의 결과
