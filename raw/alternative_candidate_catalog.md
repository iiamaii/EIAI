---
title: 대안 후보 카탈로그 — PPCA 구성 요소별 다른 물리적 실현
author: ws
captured_at: 2026-04-25
contributor: ws
note_type: design_space_exploration
builds_on: [raw/formulation_layer_C_symbolic.md, raw/stage2_eggroll_ppca_architecture.md]
---

# 대안 후보 카탈로그 — PPCA 구성 요소별 다른 물리적 실현

목적: PPCA 아키텍처의 **흐름**(6-phase + 3-tier + forward-only + batch-averaged + semi-passive)은 그대로 유지하면서, 각 구성요소 슬롯에 들어갈 수 있는 **다른 물리 구현**을 탐색. 이 카탈로그는 commitment를 바꾸는 게 아니라 **설계 공간(design space)을 열어두는** 문서입니다.

각 슬롯에 대해:
1. Layer C/D/S가 요구하는 **수학적 조건**을 먼저 고정
2. 그 조건을 만족하는 **물리 실현 후보**를 나열
3. **trade-off 비교** (정확도, 속도, 전력, 면적, 공정 호환성)
4. **특정 응용에서 canonical보다 우월한 시나리오** 표시

---

## Slot 1: Multi-Dimensional Operation (W = Linear Combiner)

### 수학적 요구

- `y = W·x + δW·x`의 선형성
- `W, δW`의 per-cell update 가능
- 물리 폐쇄: Kirchhoff 전류 합산류의 연산자

### Canonical 선택

**Memristor/ReRAM 크로스바** — Kirchhoff 전류 합. 차수 대칭, analog 전도도.

### 대안 후보

| 후보 | 물리 메커니즘 | 대응 공식 | 강점 | 약점 |
|---|---|---|---|---|
| **PCM 크로스바** | 비정질↔결정질 전도도 변화 | `I_j = Σ G_ij^PCM · V_i` | 이미 양산, 10⁸ endurance | 쓰기 드리프트, 비대칭 |
| **Charge-based Gain Cell** | 커패시터 저장 + push-pull 트랜지스터 | `I_j = Σ g_m(V_store_i) · V_in_i` | 3T/2C 셀, In-Memory Attention paper 검증 | DRAM-refresh 필요 |
| **STT-MRAM 크로스바** | 자기 터널 접합 저항 | `I_j = Σ G_ij^MTJ · V_i` | 10¹⁰ endurance, BEOL 호환 | 2-level, 다중값 어려움 |
| **Floating-Gate eFlash** | 플로팅 게이트 전하 | `I_j = Σ g_m(Q_FG_ij) · V_i` | Mature, multi-bit, TEXEL 채택 | 높은 쓰기 전압 (~10 V) |
| **Photonic MZI Mesh** | 간섭계(Mach-Zehnder) 위상 | `|E_out_j|² = \|Σ U_ij · E_in_i\|²` | THz 대역폭, 수동 전파 | 초기 위상 보정 필요, 실리콘 포토닉스 전용 |
| **Switched-Capacitor 어레이** | 전하 재분배 | `V_out = Σ (C_ij/C_tot)·V_i` | 완전 수동, 정확도 높음 | 시간 이산화 필요, clock 의존 |
| **Josephson Junction Array** | 쿠퍼쌍 터널링 (초전도) | `I_j = Σ I_c_ij · sin(φ_ij)` | fJ/op, 극도로 빠름 | 극저온(~4K), 전용 공정 |

### 주목할 조합

- **MRAM + Flash 하이브리드**: MRAM을 Tier-2 (빠른 consolidation), Flash를 Tier-3 (영구 archive). 현재 charge-trap + flash 조합의 개선.
- **Photonic MZI + Memristor**: MZI는 인코더·선형결합 담당, memristor는 slow weight 저장. Forward path는 광학, 학습은 전자.

### 선호 시나리오

- **저전력 edge sensor**: Gain cell (µW 규모)
- **중~대규모 LLM inference**: ReRAM / PCM
- **고대역폭 신호**: Photonic MZI
- **극한 endurance 필요**: STT-MRAM

---

## Slot 2: Non-Linear Activation (N)

### 수학적 요구

- 단조 비감소 (monotone non-decreasing)
- Lipschitz 연속
- Pointwise (memoryless)
- Invariant 3: `sign(N(y) − N(θ)) = sign(y − θ)`

### Canonical 선택

**Kink-biased MOSFET** (N_α) — piecewise-linear 2조각.
**Subthreshold Exponential** (N_β) — 부드러운 exp.
**Saturation Square** (N_γ) — quadratic threshold.

### 대안 후보

| 후보 | 물리 | 수학 형태 | 응용 |
|---|---|---|---|
| **Schottky Diode Knee** | 금속-반도체 junction의 부드러운 threshold | smooth-ReLU with subexponential bend | 극저전압 동작 (~0.3V), 단일-diode 구현 |
| **Differential Pair tanh** | 쌍 트랜지스터 tail-current 분할 | `tanh(V/2V_T)` | bounded 출력 필요 시, 안정성 좋음 |
| **OpAmp Saturation (Hard-tanh)** | 출력 레일 clipping | piecewise `{-V_sat, gain·z, +V_sat}` | bounded output + 고정밀 선형 구간 |
| **CMOS Inverter (Sign + hysteresis)** | 상보 p/n 펌프 | sharp sign with Schmitt-trigger margin | 1-bit 출력, 초고속, 최소 면적 |
| **Photodiode Saturation** | 광전자 collection saturation | soft-saturation | photonic backend |
| **Memristor Threshold Switching (OTS)** | Ovonic threshold switch | hard threshold, bidirectional | 선택기로도 사용 (crossbar sneak path) |
| **LIF Neuron (Integrate-and-Fire)** | 커패시터 누적 + comparator + reset | spike-rate activation | event-driven backend, 매우 낮은 duty cycle |
| **Varactor (Nonlinear C)** | 전압 의존 커패시턴스 | 비가환적 비선형 — 정상 N에는 부적합 | FM/오실레이터 backend에서만 |
| **Adaptive Subthreshold + Body Bias** | V_T를 body에서 조절 | adaptive `f(z; V_body)` | 온도 보상 + 양방향 기울기 조절 |

### 주목

- **OTS (Ovonic Threshold Switch)**를 N에 쓰면 같은 physics (chalcogenide)로 PCM 크로스바와 결합 가능. N과 W가 같은 소자 family → 공정 단순화.
- **LIF 뉴런**은 "activation = spike rate"로 dimension/precision trade를 바꿈. Event-driven 구조와 자연스럽게 결합.

### 선호 시나리오

- **극저전력 항상-on**: LIF (duty cycle ~0.1%)
- **고속 레이턴시**: CMOS Inverter (수 ps)
- **정밀 회귀**: OpAmp Hard-tanh
- **적응형 V_T 필요**: Body-biased subthreshold

---

## Slot 3: Statistical / Score Operation (S)

### 수학적 요구

- Scalar 출력 `S = f(‖z − y*‖)`
- `‖z − y*‖`에 대해 단조 감소
- Gaussian 형태가 아니어도 됨 (ES score identity는 일반 kernel 허용)

### Canonical 선택

**Single 서브임계 트랜지스터** — `S = exp(−r²/2σ²)`.

### 대안 후보

| 후보 | 물리 | 출력 형태 | 강점 |
|---|---|---|---|
| **Log-Domain Multiplier + Exp** | 서브임계 곱/나눗셈 + 지수화 | 일반 exponential kernel | precision 조절 가능 |
| **Charge-Packet Comparison** | 누적 전하량 비교 | `S ∝ max(0, C_target − C_out)` | ADC 없이 digital out 가능 |
| **Photon-Counting Score** | 포톤 포화 detector | Poisson `S = P(N ≥ threshold)` | Poisson 분포 native — Poisson-score ES 자연 |
| **Stochastic Resonance Score** | 열잡음 하의 threshold 교차율 | crossing-rate estimator | 잡음 자체를 신호로 이용 |
| **Delay-Line Score (Race Logic)** | 첫 edge arrival time | `S = 1/τ_arrival` | 시간-도메인, clock-free |
| **Pulse-Width Integrator** | 차이 전압 → PWM → 카운터 | `S ∝ duty cycle` | 완전 아날로그, 넓은 dynamic range |
| **Schmidt-Trigger Binary Score** | hysteretic threshold | 1-bit `S ∈ {0,1}` | 극도로 단순, 큰 잡음 환경 |
| **Correlator (SAW / analog)** | 음향파 상관 | `S = ∫ z(t)·y*(t) dt` | 넓은 대역폭 신호 매칭 |

### 주목

- **Photon-counting Score**는 optical 시스템에서 특별히 강력 — 포톤 수 자체가 Poisson이므로 score estimator의 분포가 자연 Poisson. Gaussian ES 대신 Poisson ES로 넘어갈 동기.
- **Stochastic Resonance**는 잡음이 도움이 되는 영역 — low-SNR 신호에서 유리.

---

## Slot 4: Input Signal Encoding (E)

### 수학적 요구

- `E : {0,1}^n → ℝ^m` 선형 주입
- 물리적으로 analog voltage/current 파형

### Canonical 선택 (Formulation v1)

- Option A: Bit-plane weighted charge `E(b) = Σ 2^k · b_k · e_k`
- Option B: Pulse-density (unary) `E(b) = N_1(b) · e`
- Option C: Binarized `E(b) = 2b − 1`

### 대안 후보

| 후보 | 물리 | 수학 형태 | 특징 |
|---|---|---|---|
| **Delta-Sigma (ΣΔ) 1-bit stream** | 1-bit DAC + oversampling | averaged = analog value | 높은 precision을 1-bit로, oversampling noise-shaping |
| **Pulse-Width Modulation (PWM)** | clock + comparator | duty ∝ value | 단순, FPGA에서 흔함 |
| **Spike-Timing Encoding** | first-spike latency | `t_spike = f(x)`, 작을수록 강함 | biological, race logic |
| **Phase-Shift Encoding** | carrier + φ shift | amplitude + phase = complex number | RF/wireless 자연스러움 |
| **Current-Mode Direct** | 전류로 직접 주입 | log-domain 친화적 | ADC 불필요, translinear에 부합 |
| **Residue Number System (RNS)** | mod 연산 분해 | `x = (x mod p_1, ..., x mod p_k)` | 독립 병렬 처리 가능 |
| **Stochastic Bitstream** | Bernoulli(p) 샘플링 | averaged = p | 단일-비트 연산으로 곱셈 = AND |
| **Charge-Packet Direct (Bucket Brigade)** | CCD-style | `Q_k`로 저장 | 이미지 센서와 직접 결합 |
| **Frequency Encoding (FM/VCO)** | 입력 → 발진 주파수 | `f = f_0 + k·x` | optical-frequency 변환 natural |
| **Optical Intensity** | photon flux | `Φ = f(x)` | photonic backend 전용 |

### 센서 직결 관점

**각 인코딩이 어떤 센서와 자연스러운지**:
- 이미지 센서 → Charge-packet direct (bucket brigade)
- 음향 센서 → PWM or ΣΔ (SAW 필터 친화)
- 생체 전위 → Current-mode direct (고 임피던스 입력)
- RF → Phase-shift / FM
- 화학 센서 → Frequency encoding

**반수동 디바이스의 목표**: "센서 → 인코더 → PPCA forward path"가 **모두 아날로그**. ADC를 건너뜀.

---

## Slot 5: Output-Target Based Slow Memory Update

### 수학적 요구

- `ΔG_{ij} = η · S · a_i · b_j` per cell
- 장기 비휘발성 (τ_W ≫ τ_δ)
- Tier-3로 snapshot 가능

### Canonical 선택

**Charge-trap programming via Gilbert cell output**

### 대안 후보

| 후보 | 쓰기 메커니즘 | τ_retention | 쓰기 에너지 | 강점 |
|---|---|---|---|---|
| **Floating-Gate (FG) Flash** | Fowler-Nordheim tunneling / CHE | 10+ years | ~10 nJ/bit | mature, multi-bit, reprogrammable |
| **Memristor SET/RESET** | 필라멘트 형성/해체 | days-years (cell-specific) | ~pJ/bit | BEOL, 빠름 |
| **PCM SET/RESET** | amorphous↔crystalline | 10 years | ~100 pJ/bit | multi-bit 가능 |
| **STT-MRAM Spin-Torque Write** | 전류 유도 자화 반전 | 10+ years | ~fJ/bit | 매우 낮은 쓰기 에너지, 10¹⁰ endurance |
| **VCMA-MRAM Voltage Write** | 전압 제어 자기 이방성 | 10+ years | ~aJ/bit | 초저전력, 최신 기술 |
| **FeRAM Polarization Flip** | 강유전 분극 반전 | 10+ years | ~fJ/bit | destructive read, 고 endurance |
| **CBRAM (Conductive Bridge)** | Ag/Cu filament | days-years | ~pJ/bit | 넓은 저항비, slow set |
| **Elastic-Strain Memristor** | MEMS 기반 물리 변형 | 반영구 | mJ/bit | physical distance, 독특함 |
| **Photorefractive Crystal** | 빛에 의한 refractive index 변화 | days-years | photon-dependent | photonic backend |
| **Trap-Rich SONOS** | 다중 trap site | 10 years | ~10 nJ/bit | 연속적 multi-level |

### Multi-tier 조합 권장

현재 Formulation: Tier 2 (charge-trap) → Tier 3 (flash). 대안:

- **Tier 2a (μs): Gain cell capacitor** — 살아있는 가중치
- **Tier 2b (ms): MRAM** — 준영구 캐시
- **Tier 3 (years): Flash** — 진짜 아카이브

3-tier가 4-tier로 확장되면 더 부드러운 retention 계층 생성.

---

## Slot 6: Batch Sample Processing (Two-Timescale)

### 수학적 요구

- τ_fast (perturbation reset) ≪ τ_slow (consolidation)
- K_batch = τ_slow / τ_fast ≈ 50

### Canonical 선택

**Floating-bulk dynamics (τ_fast ~100ns) + Charge-trap (τ_slow ~10μs)**

### 대안 후보

| 후보 | 물리 | τ_fast 범위 | 특징 |
|---|---|---|---|
| **Capacitor Sample-and-Accumulate** | 커패시터 banks로 batch 저장 | 조절 가능 (C 선택으로) | 정확한 K_batch 선택, 면적 비용 |
| **CCD Bucket Brigade** | 순차적 charge 전송 | clock-driven | 규칙적 batch cadence |
| **Delay-Line Multi-Tap** | 물리 전파 delay | ns-μs | 공간 병렬 + 시간 연관 |
| **Asynchronous Event-Driven** | spike arrival에 따라 | spike-rate-defined | 자연스런 batch = between events |
| **Photonic Delay Loop** | 광섬유/도파로 delay | ps-ns | 초고속 batch (GHz class) |
| **Integrator Reset by Clock** | opamp 기반 | clock period | 정확한 period, 디지털 신호 하나 필요 |
| **Thermal Relaxation** | RC + 열 시정수 | ms-s | 느리지만 완전 수동 |

### 특별 고려: Floating-bulk의 한계

Floating-bulk의 τ_fast는 device-fixed. **조절하려면** bulk 면적이나 기생 커패시턴스를 변경 — 공정 단계에서 결정. 만약 application이 다른 K_batch를 요구하면 switched-capacitor integrator로 대체 가능 (τ = C/g_m 조절 가능).

---

## Slot 7: Semi-Passive Power Source

### 수학적 요구 (비강제적이지만 목표에 중요)

- 외부 power budget = O(input signal energy)
- 별도 clock 의존 최소화

### Canonical (PPCA 암묵적)

**입력 신호 전압 자체가 power 공급**

### 대안 후보 (Energy Harvesting)

| 후보 | Harvested source | 가용 전력 | 적용처 |
|---|---|---|---|
| **Photovoltaic (PV)** | 빛 | 10-100 μW/cm² (실내) — mW/cm² (옥외) | 이미지 센서 시스템 |
| **Piezoelectric** | 기계적 진동 | 1-100 μW | vibration/acoustic 센서 |
| **Triboelectric (TENG)** | 마찰/접촉 | nW-μW | 웨어러블, 촉감 |
| **Thermoelectric (TEG)** | 온도 차 | 10-100 μW/K | 인체 장착, 산업 | 
| **RF Harvesting** | 전파 | 100 nW-μW | IoT, 백캐리어 |
| **Biopotential** | 심전도/근전도 | μV-mV 전압 | 임플란트 |
| **Enzymatic Biofuel Cell** | 혈당 등 | μW | 체내 디바이스 |
| **Direct Signal Energy** | 입력 신호 자체 | signal-bound | 통신 수신기 |

### Application-specific 조합

- **Implantable biomedical**: Biopotential or biofuel cell + 저전력 PPCA (LIF + MRAM)
- **Wearable activity**: Piezo/triboelectric + photonic-lite PPCA
- **Environmental IoT**: PV + memristor PPCA
- **RF backscatter**: RF harvesting + minimal gain-cell PPCA

---

## 구성요소 간 호환성 매트릭스

특정 조합이 특히 자연스러운지 표시 (◎: 강한 시너지, ○: 호환, △: 가능하나 보정 필요, ×: 비호환):

| | Kink MOSFET | Subthreshold exp | LIF Neuron | OpAmp tanh | Photodiode |
|---|---|---|---|---|---|
| **ReRAM crossbar** | ◎ | ◎ | ○ | ○ | △ |
| **PCM crossbar** | ◎ | ◎ | ○ | ○ | △ |
| **Gain cell array** | ○ | ◎ | ◎ | ◎ | △ |
| **MRAM crossbar** | ◎ | ○ | ○ | ○ | × |
| **Photonic MZI** | △ | × | △ | △ | ◎ |
| **Switched-Cap** | ○ | △ | ○ | ◎ | × |

### 가장 자연스러운 세 가지 조합

1. **"Neuromorphic edge"**: Gain cell + LIF + subthreshold exp + pulse-density encoding + MRAM Tier-3 + biopotential harvesting
2. **"Dense LLM-style"**: PCM crossbar + kink MOSFET + subthreshold exp + bit-plane encoding + flash Tier-3 + direct signal energy
3. **"Photonic-hybrid"**: MZI mesh (forward path) + memristor weights + photodiode threshold + optical intensity encoding + PV harvesting

---

## 특정 응용별 권장 스펙

### (A) 임플란트 생체 신호 모니터 (ECG, EMG)

- **E**: Current-mode direct (고 임피던스)
- **W**: STT-MRAM crossbar (저전력, 10¹⁰ endurance)
- **N**: LIF neuron (duty cycle 0.1%)
- **S**: Schmidt-trigger binary score (극도 단순)
- **Update**: VCMA-MRAM write (aJ/bit)
- **Batch**: Event-driven (spike-triggered)
- **Power**: Biofuel cell or thermoelectric (체온 gradient)

예상 power: < 1 μW. τ_slow: 초 단위 — "수면 중 학습" 가능.

### (B) 항상-on 음성 키워드 검출

- **E**: PWM from MEMS mic
- **W**: Gain cell array (DRAM-refresh 감당 가능)
- **N**: Schottky diode knee
- **S**: Charge-packet comparison
- **Update**: Flash (하루 1회 snapshot)
- **Batch**: Capacitor sample-and-accumulate
- **Power**: PV + 배터리 보조

예상 power: ~10 μW. τ_slow: 분-시간.

### (C) RF backscatter 레이더 센서

- **E**: Phase-shift encoding
- **W**: Switched-cap array
- **N**: CMOS inverter
- **S**: Delay-line race logic
- **Update**: MRAM
- **Batch**: Photonic-style fast delay loop
- **Power**: RF harvesting

예상 power: ~100 nW. τ_slow: 샘플 이벤트마다.

### (D) 실험실 고성능 LLM accelerator

- **E**: Bit-plane weighted charge
- **W**: PCM crossbar (multi-bit)
- **N**: Kink MOSFET
- **S**: Subthreshold exp Gaussian
- **Update**: Gilbert cell → charge-trap
- **Batch**: Floating-bulk (canonical)
- **Power**: 유선 전원 (fall-back to fully powered mode)

PPCA canonical 선택 = 이 시나리오에 맞춰진 것. 다른 응용에서는 위 카탈로그의 대체 조합 고려.

---

## 목표와의 정합성 재확인

**필수 조건 7개를 모두 만족하는 대안 조합들이 존재**함을 이 카탈로그가 보여줍니다:

- ✓ 반도체 소자 특성 ↔ analogue functional operator 대응 — 모든 후보가 device-physics 기반
- ✓ Multi-dimensional operation — 7가지 크로스바 대안
- ✓ Non-linear activation — 9가지 비선형 소자 옵션
- ✓ Statistical operation — 8가지 score 메커니즘
- ✓ Input signal encoding — 10가지 encoding 방식 (센서별 자연스런 대응)
- ✓ Output-target based slow memory update — 10가지 NVM 기술
- ✓ Batch sample processing — 7가지 two-timescale 메커니즘
- ✓ Semi-passive — 8가지 energy harvesting 옵션

각 슬롯에서 선택을 바꿔도 전체 흐름(6-phase PPCA + 3-tier memory + forward-only + two-timescale)은 **구조적으로 보존**됩니다. 이는 PPCA 아키텍처가 **특정 물리 구현에 종속되지 않은 일반 템플릿**임을 증명.

---

## 다음 단계 — 응용별 설계 분기

이 카탈로그가 Stage 3a functional simulation의 "parameter space" 역할을 합니다:
- 각 조합을 NumPy로 instantiate
- Layer S 세 predictions가 조합마다 어떻게 달라지는지 측정
- "응용 × 조합" 매트릭스 성능 맵 산출
- 특정 목표 스펙(power, latency, accuracy)에 맞는 최적 조합 식별

다섯 이론 배경(math_theory_01~05)이 **어떤 조합에도 공통으로 적용**되므로, 수학적 formulation은 이 카탈로그 전체에 불변.

---

## Cross-References

**Canonical PPCA (기준점):**
- `stage2_eggroll_ppca_main`
- `stage2_eggroll_ppca_phase1_perturbation_draw` ~ `_phase7_snapshot_restore`

**Formulation Layer C (요구 조건 정의):**
- `formulation_layer_c_main`
- `formulation_layer_c_operator_encoder_e`
- `formulation_layer_c_operator_linear_w`
- `formulation_layer_c_operator_nonlinearity_n`
- `formulation_layer_c_operator_fitness_s`
- `formulation_layer_c_timescale_tau_x`, `_tau_delta`, `_tau_w`, `_tau_archive`

**Device physics 후보 (이미 그래프에 있는 것):**
- `synaptic_and_neural_behaviours_pdf_memristor`
- `synaptic_and_neural_behaviours_pdf_phase_change_memory`
- `synaptic_and_neural_behaviours_pdf_flash_memory`
- `synaptic_and_neural_behaviours_pdf_kink_effect`
- `synaptic_and_neural_behaviours_pdf_neuron` (LIF)
- `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_gain_cell`
- `a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_beol_memristive_interface`
- `a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_subthreshold_event_driven`
- `cmos_integrated_organic_neuromorphic_imagers_for_high_resolution_dual_modal_imaging_hybrid_cmos_organic` (photonic-like)

**3-Tier memory:**
- `three_tier_memory_tier1_floating_bulk`
- `three_tier_memory_tier2_charge_trap`
- `three_tier_memory_tier3_permanent_archive`
- `three_tier_memory_tier3_tech_mram`
- `three_tier_memory_tier3_tech_feram`
- `three_tier_memory_tier3_tech_flash`

**Analog primitives:**
- `analog_primitive_gaps_subthreshold_exp`
- `analog_primitive_gaps_gilbert_cell`
- `analog_primitive_gaps_log_domain_translinear`

**EGGROLL + Pairs (수식이 조합-불변):**
- `evolution_strategies_at_the_hyperscale_pdf_eggroll`
- `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`
- `device_math_mapping_pair_3_identity_bits_bound_rank` (bits ↔ rank 경계)
- `device_math_mapping_pair_6_identity_eta_tau_ratio` (two-timescale identity)
