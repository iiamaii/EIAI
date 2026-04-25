---
title: PPCA의 FPGA 구현 가능성 분석 — Step 9 Verification Protocol 적용
author: ws
captured_at: 2026-04-25
contributor: ws
note_type: implementation_feasibility_analysis
builds_on: [raw/theory_development_stepwise_class_generalization.md, raw/stage2_eggroll_ppca_architecture.md, raw/alternative_candidate_catalog.md]
---

# PPCA의 FPGA 구현 가능성 분석

질문: **PPCA가 FPGA로 구현 가능한가?**

답: **strict한 의미로는 불가능, behavioral/hybrid 의미로는 가능**. 어느 모드를 선택하느냐에 따라 살아남는 formulation 주장이 크게 다릅니다. 본 분석은 generalized formulation의 Step 9 verification protocol을 FPGA 구성 요소에 직접 적용하여 어느 슬롯이 𝒞_X 멤버십을 통과하는지, 어디서 깨지는지 식별합니다.

---

## 결론 요약

| 모드 | FPGA 역할 | 살아남는 formulation 주장 |
|---|---|---|
| **(M1) Strict 분석 PPCA** | 없음 | 모든 주장 (T1'-T5', semi-passive, physics-closure) |
| **(M2) Behavioral Twin (전부 디지털)** | 모든 슬롯 | T1' (well-posed), T4' (수렴) — **단 디지털 시뮬레이션 의미에서만** |
| **(M3) Hybrid (analog frontend + FPGA backend)** | Tier-3 archive, RNG, control, sensor readout | T1'-T4' 부분, T5' 대부분, semi-passive 부분 |
| **(M4) Control-only FPGA** | snapshot trigger, debug, flash controller | 거의 모든 주장 (analog가 PPCA 본체) |

**가장 권장**: **M3 (Hybrid)** for 실험실 prototyping, **M2 (Behavioral)** for Stage 3a algorithmic validation.

---

## 1. FPGA 구성요소의 𝒞_X 멤버십 검증

Step 9 verification protocol을 7개 슬롯에 대해 FPGA primitive로 적용:

### Slot 1 — W (Linear Combiner) ↔ FPGA DSP slices

```
𝒞_W 조건 검증:
  (i) 선형성 ✓ (DSP slice = digital MAC)
  (ii) 유계 Frobenius norm ✓ (fixed-point precision으로 강제)
  (iii) per-cell 갱신 ✓ (BRAM에 가중치 저장, runtime update)
  (iv) 물리 실현: Kirchhoff sum, charge sharing, photonic interference, 또는 등가
       ✗ DSP slice는 binary gate 기반 digital arithmetic — Kirchhoff 전류 합산 아님
```

**판정**: 조건 (iv) FAIL. DSP slice는 "선형 연산자를 binary 트랜지스터 게이트의 디지털 합성으로 구현한 것"이므로 **𝒞_W의 'physics-closed' 조건 위반**. 같은 수학을 계산하지만 다른 카테고리의 물리 메커니즘.

**중요한 구분**: "𝒞_W의 (iv) 조건이 '등가' 절(or equivalent)을 통해 디지털 합성을 받아들이는가?" — Layer C의 원칙에 따르면 **NO**. "physics-closed = ADC/DAC/symbolic-op 없음"이 PPCA의 정의 조건이므로 디지털 합성은 정의상 제외.

### Slot 2 — N (Nonlinearity) ↔ FPGA LUT

```
𝒞_N 조건 검증:
  (i) 점별 적용 ✓ (LUT = pointwise)
  (ii) Lipschitz ✓ (LUT 출력은 quantized but bounded)
  (iii) 단조 비감소 ✓ (LUT 내용을 단조로 채우면 됨)
  (iv) 부호 commutativity ✓
  (v) 물리 실현: transistor I-V, diode knee, opamp saturation, 등
       ✗ LUT는 binary lookup, transistor I-V 아님
```

**판정**: 조건 (v) FAIL. LUT가 비선형성을 *수학적으로 재현*하지만 *물리적으로 다른 메커니즘*.

### Slot 3 — S (Score) ↔ FPGA arithmetic + LUT for exp

```
𝒞_S 조건 검증:
  (i)-(iv) ✓
  (v) Gaussian-like form 옵션 ✓ (LUT으로 exp 근사 가능)
```

**판정**: 𝒞_S 자체는 PASS — 𝒞_S 정의에 (iv) 물리 실현 조건이 약하게 들어감 ("subthreshold transistor 등"). 그러나 FPGA 구현은 *물리 의미*를 잃음.

### Slot 4 — E (Encoder) ↔ FPGA fabric + ADC

```
𝒞_E 조건 검증:
  (i)-(iii) ✓
  (iv) bandlimited analog kernel ✗ — FPGA 입력은 ADC 후 디지털
```

**판정**: 조건 (iv) FAIL. Analog input → ADC → digital이 들어오는 순간 PPCA의 "bypass digitalization" 주장이 깨짐. 이게 가장 결정적 위반.

### Slot 5 — Slow Memory Update ↔ BRAM/URAM/External Flash

```
조건 검증:
  (i) ΔG_{ij} update ✓ (BRAM write)
  (ii) τ_W ≫ τ_δ 분리 ✓ (clock으로 강제)
  (iii) 물리 비휘발성 △ (BRAM은 휘발성, 외부 Flash는 비휘발)
```

**판정**: BRAM 단독으로는 휘발성 — 전원 차단 시 학습 손실. 외부 Flash 컨트롤러를 거치면 Tier-3 역할은 가능하나 "physics-native"는 아님.

### Slot 6 — Batch Processing (Two-Timescale) ↔ FPGA clock divider

```
조건 검증:
  τ_W / τ_δ ≈ 50 비율 ✓ (clock으로 임의 정확하게 강제 가능)
```

**판정**: 형식적으로 PASS. 그러나 PPCA의 핵심 주장 "K_batch = τ_slow/τ_fast가 *device 시정수*에서 도출"이 깨짐 — FPGA에서는 K_batch가 hyperparameter지 device parameter 아님.

### Slot 7 — Semi-Passive Power ↔ FPGA 전원 공급

```
조건 검증:
  Power budget = O(input signal energy) ✗
```

**판정**: 가장 명확한 FAIL. FPGA는 **수십 W 단위** 전력 소비 (Versal AI core ~25-75 W). 입력 신호 에너지로 동작 불가. Semi-passive 주장이 완전히 깨짐.

---

## 2. 슬롯별 멤버십 결과 요약

| 슬롯 | FPGA primitive | 𝒞_X 멤버십 | 핵심 위반 |
|---|---|---|---|
| W | DSP slice | ✗ | physics-closure (Kirchhoff 아닌 digital MAC) |
| N | LUT | ✗ | physics-closure (lookup 아닌 transistor I-V 요구) |
| S | LUT/arith | △ | 형식 PASS, 의미 FAIL |
| E | Fabric + ADC | ✗ | bypass-digitalization 위반 |
| Update | BRAM/Flash | △ | 휘발성, 외부 Flash로 보완 가능 |
| Batch | clock divider | △ | 시정수가 device 아닌 hyperparameter |
| Power | external supply | ✗ | semi-passive 위반 (~25 W 필요) |

**총평**: 7개 슬롯 중 4개 명확히 FAIL, 3개 형식 PASS but 의미 FAIL. **strict 의미로 FPGA는 𝒮 ∈ ℳ_PPCA의 멤버가 아님.**

---

## 3. 네 가지 가능한 구현 모드

위 결과는 "FPGA로 구현 불가"가 아니라 **어느 의미에서 구현하느냐에 따라 다른 결과**임을 의미. 4가지 모드를 정의:

### M1 — Strict Analog PPCA (FPGA 사용 안 함)

- Custom ASIC (PCM crossbar + kink MOSFET + Gilbert cell + subthreshold + flash)
- Layer C/D/S 모든 정리 직접 적용
- T1'-T5' 모두 형식·의미 둘 다 살아남음
- semi-passive 가능

이게 PPCA의 **canonical target**. FPGA는 도움 안 됨.

### M2 — Behavioral Twin (전부 FPGA, "디지털 트윈")

전체 PPCA dynamics를 FPGA에서 *시뮬레이션*. 모든 슬롯이 디지털 근사. 살아남는 주장:

- ✓ T1' Well-posedness — Picard 적용 가능 (단, 양자화 영향 분석 별도)
- ✓ T4' Convergence — REINFORCE 추정기를 디지털로 시뮬, 수렴 검증 가능
- ✗ T2' Realizability — 디지털 시뮬레이션 자체는 PPCA 실현 아님
- ✗ T3' Signal-processing completeness — 모든 step이 symbolic
- △ T5' Noise tolerance — 인공 잡음 주입으로 검증 가능, but 실제 device noise 모델 필요
- ✗ Semi-passive — 25W FPGA, 입력 신호 에너지로 불가
- ✗ Continuous data autonomous learning — 시뮬 환경에서만

**유용성**: **Stage 3a functional simulation의 가속화**. NumPy로 1시간 걸리는 학습을 FPGA에서 분단위로. 알고리즘 검증에는 유용, 물리 검증은 불가.

### M3 — Hybrid (Analog Daughterboard + FPGA Backend)

- **Analog daughterboard**: W, N, δW, S, consolidation Gilbert (PPCA 본체)
- **FPGA**: counter-RNG, snapshot trigger, Tier-3 flash controller, sensor readout digitization (모니터링용), debug interface, host PC 통신

살아남는 주장:
- ✓ T1', T2', T3' — analog daughterboard에서 PPCA 본체가 동작
- ✓ T4' — 학습이 실제 analog 동역학 위에서
- ◎ T5' — **FPGA가 noise injection을 통해 σ_eff² 측정 자동화** — 오히려 검증 도구로 유용
- △ Semi-passive — analog daughterboard만 보면 가능, FPGA 포함하면 불가능
- ◎ Continuous data — 실제 sensor stream을 FPGA가 라우팅, analog로 주입

**유용성**: **실험실 prototyping의 표준 형태**. 거의 모든 analog ML 연구 (BrainChip, Mythic 등)가 이 모드로 검증 후 ASIC tape-out.

### M4 — Control-Only FPGA (Auxiliary Logic Only)

- PPCA 본체는 100% analog
- FPGA는 *주변* 디지털 로직만: snapshot trigger logic, flash 컨트롤러, 외부 PC 통신, 디버그 인터페이스, RNG seed 관리

살아남는 주장:
- ✓ 모든 T1'-T5' (analog 본체 그대로)
- △ Semi-passive — 만약 FPGA가 Tier-3 archive 트리거만 담당 (수 분당 1회 활성), 평균 power가 매우 낮음. Semi-passive에 가까운 구현 가능
- ✓ Physics-closure (forward path는 analog만)

**유용성**: **production 디바이스의 가장 현실적 형태**. ASIC + 작은 FPGA(또는 마이크로컨트롤러) 조합. M1의 "FPGA 0%"가 너무 비현실적인 경우 대안.

---

## 4. Class Generalization 관점에서의 재해석

이번 분석은 Step 9 protocol의 **첫 적용 사례**입니다. 결과:

- FPGA primitive는 **새 admissible class들의 구분**을 강제: 
  - `𝒞_X^analog` (current PPCA-class)
  - `𝒞_X^digital` (FPGA primitive class — 별도 정의 필요)
- 두 class는 같은 수학을 만족하지만 **다른 물리 카테고리**

이로써 형식 정리 차원에서:
- T1', T3', T4'는 두 class 모두에 적용 (수학 자체는 invariant)
- T2'는 class별로 다름 (realization이 다른 device family에 속함)
- T5'는 noise model이 class별 다름 (analog: thermal+1/f; digital: quantization+timing-jitter)
- semi-passive 주장은 `𝒞_X^digital`에서 깨짐

따라서 **`ℳ_PPCA^digital`는 `ℳ_PPCA^analog`와 구분되는 별도 instance family**. 같은 수학적 framework이지만 다른 물리적 family.

---

## 5. M3 Hybrid 권장 — 구체 설계 제안

실험실 prototyping에 가장 현실적인 M3 모드의 구체 설계:

### Analog Daughterboard (실제 PPCA)

| 슬롯 | 구현 |
|---|---|
| W | 외부 Memristor crossbar IC (e.g., Knowm / Crossbar Inc.) 또는 Analog Devices switched-cap array |
| N | Discrete MOSFET array (kink bias) 또는 op-amp piecewise-linear |
| S | Discrete differential amp + squarer + subthreshold transistor |
| δW | Analog multiplier (Gilbert cell IC, e.g., AD633) |
| 두 시정수 | 외부 RC + Op-amp integrator |

### FPGA Backend

| 기능 | FPGA primitive |
|---|---|
| Counter-based RNG | LFSR or Philox in fabric |
| Snapshot trigger | state machine watching analog fitness |
| Tier-3 archive | external Flash via SPI (FPGA controller) |
| Sensor readout | ADC → BRAM (모니터링용, learning에는 영향 없음) |
| Debug | UART/Ethernet to host PC |

### 추천 보드

- **Xilinx Versal VCK190** + custom analog daughterboard (PCIe AMC)
- **Intel Arria 10 SoC** + analog frontend
- **Lattice CrossLink-NX** + analog (저전력 옵션)

학생/연구실 수준 prototype: **약 1-2k$ 보드 + 50-200$ analog frontend**.

### 검증할 주장

이 hybrid 구성에서 확인 가능:
1. T4' 수렴 (analog 본체에서, FPGA가 record)
2. T5' σ_eff² 측정 (FPGA가 noise injection + 측정)
3. Continuous learning behavior (real sensor stream)
4. Tier-3 snapshot/restore (FPGA가 자동 실행)

**검증 불가** (M1 실리콘 ASIC 필요):
- Semi-passive 동작 (FPGA의 25W가 dominant)
- Process scaling 거동 (단일 보드 prototype은 representative 못 함)

---

## 6. M2 Behavioral Twin — Stage 3a 가속

Stage 3a functional simulation을 NumPy 대신 FPGA로:

- 각 슬롯을 fixed-point 디지털로 구현
- 전체 PPCA dynamics를 SystemVerilog/HLS로
- 학습 epoch을 1000× 가속 (NumPy 1시간 → FPGA 5초 type 가속)

**용도**:
- 알고리즘 hyperparameter sweep
- 4 application bundle 비교 시뮬
- Layer S T4'/T5' 예측 검증 (인공 noise 주입)

**한계**:
- 실제 device noise model 없음 → 인공 noise injection 의존
- "physics-closure" 주장 검증 불가
- "real continuous data" autonomous learning 검증 불가 (시뮬레이션 환경)

---

## 7. 응용 시나리오별 권장

| 응용 | 권장 모드 | 이유 |
|---|---|---|
| 알고리즘 검증 (hyperparameter, convergence) | M2 Behavioral Twin | 빠르고 결정적 |
| 이론 검증 (T4', T5' 정량 측정) | M3 Hybrid | 실제 analog dynamics 필요 |
| 실험실 데모 / publication | M3 Hybrid | "real chip on real signal" 시연 가능 |
| 양산 디바이스 | M1 (ASIC) + M4 (control FPGA) | Power, cost, integration 모두 최적 |
| Edge IoT 시제품 | M4 또는 ASIC + 마이크로컨트롤러 | FPGA는 너무 큼 |

---

## 8. 결론 — Strict vs Effective 답

**Strict 답** (PPCA formulation 정의에 따른):
- FPGA는 𝒞_X^analog 멤버십을 4-5개 슬롯에서 위반
- 따라서 strict한 의미의 PPCA = FPGA로 구현 **불가**
- 가장 결정적: semi-passive (~25W FPGA), bypass-digitalization (입력 ADC 필요)

**Effective 답** (실용적 prototyping 관점):
- M3 Hybrid는 PPCA 본체를 analog로 두고 FPGA를 control/RNG/archive에 활용 — **권장**
- M2 Behavioral Twin은 알고리즘 검증의 가속화에 유용 — **추천**
- M4 Control-Only는 production-적합한 FPGA 활용 패턴

**가장 흥미로운 발견**: FPGA 구현 분석을 통해 **`ℳ_PPCA^analog`와 `ℳ_PPCA^digital` 두 family가 다른 물리 카테고리에 속함**이 명시적으로 드러남. Class generalization theory가 이 구분을 자연스럽게 표현 — 두 family 모두에 T1', T3', T4'는 적용되지만 T5'와 semi-passive는 family-specific.

이 구분이 향후 연구의 새 차원을 제공: "어느 family에 속하는 PPCA를 만드는가"가 명시적 설계 결정.

---

## Cross-References

**Class generalization 적용:**
- `theory_dev_class_gen_main`
- `theory_dev_class_gen_class_C_W_admissible_combiner`
- `theory_dev_class_gen_class_C_N_admissible_nonlinearity`
- `theory_dev_class_gen_verification_protocol_5_steps`

**대안 카탈로그 (FPGA가 어느 카탈로그 후보에도 fit하지 않음):**
- `alternative_candidate_catalog_main`
- `alternative_candidate_catalog_slot1_W` (디지털 MAC은 등록 안 됨)
- `alternative_candidate_catalog_slot7_power` (~25W FPGA는 후보 아님)

**PPCA 본체 (M3 hybrid의 analog 부분):**
- `stage2_eggroll_ppca_main`
- `stage2_eggroll_ppca_phase1_perturbation_draw` (FPGA의 RNG가 자연스럽게 활용)
- `three_tier_memory_phase7_snapshot_restore` (FPGA controller 적합)

**관련 논문 노드 (FPGA backend + analog 패턴 사용):**
- `bit_level_operator_framework_for_relu_mlps_fpga_asic_target`
- `a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_main` (TEXEL은 control-FPGA 패턴 사용)

**Semi-passive 위반 (FPGA의 power budget):**
- `three_tier_memory_three_role_device` (FPGA 모드에서는 4-역할 동시성 깨짐)
