---
title: Part 1 — 데이터 변환 textbook (Razavi, Pelgrom, ΣΔ, PWM)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: textbook_summary
part: 1
covers:
  - Razavi (1995) Principles of Data Conversion System Design
  - Pelgrom (2017) Analog-to-Digital Conversion (3rd ed.)
  - Norsworthy, Schreier, Temes (1996) Delta-Sigma Data Converters
  - Roza (1997) Analog-to-Digital Conversion via Duty-Cycle Modulation
---

# Part 1 — 데이터 변환 textbook 요약

ADC/DAC 설계의 표준 reference 4종. 변조 방식 카탈로그 + 정량 비교 + 실리콘 구현 한계.

---

## 1. Razavi (1995) — *Principles of Data Conversion System Design*

표준 ADC/DAC 설계 textbook. 회로 토폴로지 + 비이상성 분석 + 동적 성능 메트릭.

### 1.1 ADC 분류와 트레이드오프

| 구조 | 속도 | 정밀도 | 면적 | 응용 |
|---|---|---|---|---|
| **Flash** | 매우 빠름 (GHz) | 8-bit 한계 | 2^N 비교기 → 큼 | 고속 통신 |
| **Pipelined** | 빠름 (100 MHz~) | 12-14 bit | 중간 | 비디오, 무선 |
| **SAR** (Successive Approx) | 중간 (1-100 MS/s) | 10-16 bit | 작음 | 일반 용도, 저전력 |
| **ΣΔ** | 느림 (kHz~MHz 신호 대역) | 16-24 bit | 작음 (디지털 비중) | audio, 정밀 측정 |
| **Integrating** (dual-slope) | 매우 느림 | 18-22 bit | 작음 | 멀티미터, 정전 |

**경험식**: Power × Speed × 2^(2N) ≈ 상수 (figure-of-merit, FoM). 더 정밀하거나 빠르려면 전력이 지수적으로 증가.

### 1.2 핵심 비이상성

- **Offset**: 양자화 input-output 곡선의 평행이동
- **Gain error**: 곡선 기울기의 어긋남
- **DNL (Differential Non-Linearity)**: 인접 코드 폭의 LSB 단위 편차
- **INL (Integral Non-Linearity)**: 누적된 DNL
- **Aperture jitter**: 표본화 시점의 시간 jitter (고주파에서 SNR 악화 주범)

각각이 SNR/SFDR을 어떻게 깎는지 정량 분석.

### 1.3 동적 성능 메트릭

```
  SNR     = 신호 전력 / 잡음 전력
  SNDR    = 신호 / (잡음 + 왜곡)
  SFDR    = 신호 / 가장 큰 spurious tone
  ENOB    = (SNDR_dB − 1.76) / 6.02     # Effective Number of Bits
  FOM     = Power / (2^ENOB · 2 · BW)   # 에너지/conversion-step
```

ENOB이 우리 formulation의 "Encoder의 effective precision"의 정량 표현.

### Part 1과의 연결

Encoder Option A (bit-plane charge)의 정밀도 한계 = SAR ADC의 ENOB.
Encoder Option B (pulse-density)의 정밀도 = OSR + ΣΔ 차수.
Encoder Option C (binarized)의 정밀도 = 1 비트.

### 참조
- Razavi, *Principles of Data Conversion System Design*, Wiley-IEEE Press (1995) — 표준 ADC textbook.
- Razavi, *Design of Analog CMOS Integrated Circuits*, McGraw-Hill, 2nd ed. (2017) — companion (analog 회로 일반).

---

## 2. Pelgrom (2017) — *Analog-to-Digital Conversion (3rd ed.)*

신호 처리 관점의 종합 reference. 양자화 잡음 통계, 비선형성 모델링, 측정 표준.

### 2.1 양자화 잡음 정리

이상적 양자화기 (LSB = Δ)의 양자화 잡음:
- **균등 분포** (uniform): `[-Δ/2, +Δ/2]`
- **분산** = `Δ²/12`
- **SQNR** (사인파 입력) = `6.02·N + 1.76` dB (N비트, full-scale 사인파)

### 2.2 Pelgrom의 mismatch law (1989)

같은 회로의 두 트랜지스터 간 V_T 차이의 표준편차:
```
  σ_ΔV_T = A_VT / √(W·L)
```
W·L은 채널 면적, A_VT는 공정 상수 (~5 mV·μm for 65nm).

이 식이 **device variability의 정량적 기반** — Layer S `σ_variability²`의 직접 원천.

### 2.3 시간-도메인 ADC 트렌드

CMOS scaling이 진행되면서 전압 헤드룸이 축소 (V_DD ↓), 시간 분해능은 향상 (트랜지스터 속도 ↑). 이로 인해:
- **VCO-based ADC** (Voltage-Controlled Oscillator → 주파수 인코딩)
- **TDC** (Time-to-Digital Converter) — 시간 차이를 디지털로
- **Race logic** — 첫 도착 비교

이들이 우리 formulation Encoder Option D (PWM/race)와 직접 대응.

### Part 1·3와의 연결

Pelgrom mismatch law는 Part 3의 device variability (NS-RAM, MOSFET) 정량 표현 → Part 4 Theorem 5 (noise tolerance bound)의 σ_variability 항.

### 참조
- Pelgrom, *Analog-to-Digital Conversion*, 3rd ed., Springer (2017) — converter 종합 reference.
- Pelgrom, Duinmaijer, Welbers, *Matching Properties of MOS Transistors*, IEEE JSSC, 24 (1989), pp. 1433-1440 — mismatch 원전.

---

## 3. Norsworthy, Schreier, Temes (1996) — *Delta-Sigma Data Converters*

ΣΔ 변환의 정전(canonical reference). 1차에서 다중 차수까지의 noise shaping 이론, 안정성, 멀티-비트 변형.

### 3.1 ΣΔ NTF/STF 분리

ΣΔ 출력 `Y(z) = STF(z) X(z) + NTF(z) Q(z)`:
- **STF** (Signal Transfer Function): 입력 신호 통과 (이상적: STF = 1)
- **NTF** (Noise Transfer Function): 양자화 잡음 통과 (이상적: NTF = (1−z⁻¹)^L for L차)

신호와 잡음을 **분리해서 설계**할 수 있다는 게 ΣΔ의 본질적 자유도.

### 3.2 안정성 (NTF의 영점/극점 배치)

L차 NTF의 영점이 unit circle 안에 있고, gain norm이 적절히 제한되면 안정. Lee의 rule of thumb: NTF ‖∞ ≤ 1.5.

### 3.3 Multi-bit ΣΔ + Mismatch Shaping

1-bit 양자화기 대신 multi-bit 사용 시 SQNR 향상 + 안정성 ↑. 단점: 내부 multi-bit DAC의 mismatch가 신호로 누설. 해결: **DEM (Dynamic Element Matching)** — 사용 element를 매 샘플 회전.

### 3.4 Continuous-time vs Discrete-time ΣΔ

- **DT-ΣΔ**: switched-capacitor integrator, clock 정밀도 중요, kT/C noise
- **CT-ΣΔ**: RC 또는 g_m-C integrator, 자연스러운 anti-alias filtering, jitter에 더 민감

CT-ΣΔ가 GHz 대역 (5G 무선) ADC 표준.

### 우리 formulation과의 연결

Layer C Definition 3.9 `I_τ` (RC integrator)가 CT-ΣΔ의 핵심 구성요소. ΣΔ 인코딩이 PPCA의 Encoder slot에 들어가면 신호 → 1-bit 시퀀스 → 이후 stochastic computing (AND 곱) 가능.

### 참조
- Norsworthy, Schreier, Temes (eds.), *Delta-Sigma Data Converters: Theory, Design, and Simulation*, Wiley-IEEE Press (1996).
- Schreier, Temes, *Understanding Delta-Sigma Data Converters*, Wiley-IEEE Press, 2nd ed. (2017).

---

## 4. Roza (1997) — *Analog-to-Digital Conversion via Duty-Cycle Modulation*

### 핵심 아이디어

PWM (Pulse-Width Modulation): 입력 amplitude → 출력 1-bit 펄스의 duty cycle. 시간 t_on / 주기 T가 신호 값에 비례.

```
  duty(t) = (V_in(t) − V_min) / (V_max − V_min)
```

복호화: 저역통과 필터(LPF)로 평균화 → analog 복원.

### Pros / Cons (vs ΣΔ)

| 측면 | PWM | ΣΔ |
|---|---|---|
| 회로 복잡도 | 매우 단순 (비교기 + 톱니파) | 적분기 + 비교기 + feedback |
| 신호 대역 | 캐리어 주파수의 1/10 정도 한계 | OSR · 신호대역 |
| Spurious | 캐리어와 신호 인터모듈레이션 | quantization noise tone |
| 응용 | class-D 오디오 앰프, 모터 제어 | 정밀 ADC, 센서 |

### 우리 formulation과의 연결

Encoder Option Pulse-Density 외에도 PWM은 시간-도메인 인코딩의 가장 단순한 형태. 출력 1-bit 펄스가 직접 트랜지스터 게이트 구동 가능 → 디지털 회로와 자연 결합.

### 참조
- Roza, *Analog-to-Digital Conversion via Duty-Cycle Modulation*, IEEE TCAS-II, 44 (1997), pp. 907-914.

---

## Part 1 4편의 통합 요약

```
  Razavi (1995)      ADC 회로 가족 카탈로그 + ENOB/FoM 메트릭
  Pelgrom (2017)     양자화 통계 + mismatch law (variability)
  Norsworthy 1996    ΣΔ 정전: NTF/STF 분리, 안정성, multi-bit
  Roza (1997)        PWM/duty-cycle 시간-도메인 인코딩
```

### Encoder Option별 textbook 매핑

| Encoder Option | 정밀도/잡음 분석 | 회로 reference |
|---|---|---|
| A. Bit-plane charge | Razavi (SAR ADC) | Razavi Ch. 7 |
| B. Pulse-density (ΣΔ) | Norsworthy 정전 + Shannon | Norsworthy Ch. 1-5 |
| C. Binarized ±1 | Pelgrom (양자화) + Inose | Pelgrom Ch. 4 |
| D. PWM/duty-cycle | Roza 1997 | Roza paper |
| E. Phase-shift / FM | (Pelgrom, VCO ADC chapter) | Pelgrom Ch. 12 |

### 우리 formulation Theorem 5와의 정량 연결

`σ_th²` (thermal) = `k_B T / C` (Pelgrom)
`σ_quantization²` = `Δ² / 12` (균등 분포 가정, Pelgrom)
`σ_variability²` = `A_VT² / (W·L)` per cell (Pelgrom mismatch law)
`σ_jitter²` = aperture jitter × dV/dt (Razavi)

이 네 항이 Layer S Theorem 5'의 `σ_eff²`를 device-physics 수치로 environment-aware 만든다.

다음 노트: Part 2 — Mead/Liu Analog VLSI + Gilbert/Toumazou translinear + Rugh/Schetzen Volterra (3개 파일).
