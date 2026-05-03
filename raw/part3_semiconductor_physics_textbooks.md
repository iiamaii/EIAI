---
title: Part 3 — 반도체 소자 물리 정전 (Sze, Tsividis)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: textbook_classic_summary
part: 3
covers:
  - Sze, Ng (2021) Physics of Semiconductor Devices, 4th ed.
  - Tsividis (2010) Operation and Modeling of the MOS Transistor, 3rd ed.
---

# Part 3 — 반도체 소자 물리 정전 (Sze, Tsividis)

모든 후속 device 노트(memristor, PCM, MRAM, flash 등)의 기반이 되는 두 textbook. PN 접합부터 MOSFET 모든 동작 영역까지의 정량 모델.

---

## 1. Sze & Ng (2021) — *Physics of Semiconductor Devices, 4th ed.*

### 1.1 PN 접합과 Diode

drift-diffusion 방정식:
```
  J_n = q μ_n n E + q D_n ∇n        (n: 전자 농도)
  J_p = q μ_p p E − q D_p ∇p        (p: 정공 농도)
```

이상적 다이오드 식:
```
  I = I_S [exp(qV / kT) − 1]
```
- I_S = saturation current (~10⁻¹⁵ A)
- kT/q = 25.85 mV at 300 K

이 식이 **모든 exponential I-V 회로의 기원** — translinear, log-amp, Gilbert cell의 기반.

### 1.2 MOSFET 동작 영역

**Subthreshold (V_GS < V_T)**:
```
  I_D = I_0 (W/L) exp((V_GS − V_T) / nV_T) [1 − exp(−V_DS/V_T)]
```
- n ≈ 1.3-1.5 (subthreshold slope factor)
- I_0 ≈ μ C_ox V_T²

**Triode (V_GS > V_T, V_DS < V_GS − V_T)**:
```
  I_D = μ C_ox (W/L) [(V_GS − V_T) V_DS − V_DS²/2]
```

**Saturation (V_GS > V_T, V_DS ≥ V_GS − V_T)**:
```
  I_D = ½ μ C_ox (W/L) (V_GS − V_T)² (1 + λ V_DS)
```

**Velocity saturation (short-channel)**:
```
  I_D ≈ W C_ox v_sat (V_GS − V_T)        (당겨짐)
```

이 4개 영역이 우리 formulation `N` 비선형성의 4가지 모드 후보.

### 1.3 Punch-through impact ionization

V_DS ≥ V_punch에서 다른 이온화 캐리어 생성, 부유체에 누적 → V_T shift (kink effect). 이게 NS-RAM의 단기 가소성 메커니즘.

```
  α_n = α_n0 exp(−E_crit / E)         (impact ionization rate)
  ΔV_T = ∫ α_n · I · t / C_bulk dt    (kink 누적)
```

### 1.4 Charge-trap layer (SONOS-like)

Si-Oxide-Nitride-Oxide-Si 구조. Nitride layer가 trap site로 역할. Hot-carrier injection으로 전하 주입, F-N tunneling으로 제거.
- 짧은 retention (μs-h): shallow trap
- 긴 retention (years): deep trap

→ 우리 formulation Tier-2 `τ_W` (charge-trap consolidation)의 직접 물리.

### Part 4와의 연결

| Layer C 정의 | Sze chapter |
|---|---|
| `N_subthreshold` | Ch. 6 (MOS) — subthreshold I-V |
| `N_kink` | Ch. 6 + 8 — punch-through ionization |
| Charge-trap weight | Ch. 7 — non-volatile memory |
| Crossbar 전도도 | Ch. 4 (PN), Ch. 14 (memristive devices) |

### 참조
- Sze, Ng, *Physics of Semiconductor Devices*, Wiley, 4th ed. (2021) — 표준 reference.

---

## 2. Tsividis (2010) — *Operation and Modeling of the MOS Transistor, 3rd ed.*

MOS 트랜지스터만 깊이 다루는 800+페이지 정전. EKV/BSIM/PSP 모델의 모태.

### 2.1 Bulk-charge model (소위 "Tsividis 모델")

V_GS, V_DS, V_BS가 동시에 변할 때 채널 전하 분포의 정확한 적분:
```
  Q_I = -C_ox · ∫ (V_GS − V_T(y) − V(y)) dy        from y=0 to L
```
이게 long-channel MOSFET의 모든 영역을 unified 표현.

### 2.2 EKV 모델 (Enz-Krummenacher-Vittoz)

서브임계 + 강 inversion + 약 inversion을 단일 식으로:
```
  I_D = I_S · [ln(1 + exp((V_P − V_S)/2 V_T))]² 
        − [ln(1 + exp((V_P − V_D)/2 V_T))]²
  V_P = (V_GS − V_T0) / n
```
- 약 inversion → exp 관계
- 강 inversion → quadratic 관계
- 두 영역이 부드럽게 연결

→ 우리 formulation N_α (kink), N_β (subthreshold exp), N_γ (saturation)의 통합 표현이 EKV.

### 2.3 Mismatch와 noise (Pelgrom 보강)

- **Mismatch**: σ_ΔVT = A_VT / √(W·L), σ_Δβ/β = A_β / √(W·L)
- **Thermal noise**: i_d² = 4 k_B T γ g_m Δf (γ ≈ 2/3 saturation)
- **Flicker noise (1/f)**: i_d² = K_f · I_D / (W L C_ox² f) Δf

이 셋이 우리 Layer S Theorem 5'의 `σ_eff²` 정량 입력.

### 2.4 단채널 효과 (short-channel)

CMOS scaling에 따라:
- **DIBL** (Drain-Induced Barrier Lowering): V_DS가 V_T를 낮춤
- **Hot electron effects**: 장기적 V_T drift
- **Mobility degradation**: vertical field 의존
- **Velocity saturation**: I_D ∝ V_GS (선형, quadratic 아님)

→ 65nm 이하 공정에서 우리 formulation의 동작 모델 보정 필요.

### Part 4와의 연결

EKV 모델의 단일 식이 Layer C `N`의 모든 옵션을 통합. Sub-threshold/saturation/kink 사이 전환이 V_GS, V_DS의 함수로 부드럽게 정의됨 → 동일 트랜지스터가 동작 모드 전환만으로 다른 N 역할 수행 가능.

### 참조
- Tsividis, *Operation and Modeling of the MOS Transistor*, Oxford, 3rd ed. (2010).
- Enz, Krummenacher, Vittoz, *An Analytical MOS Transistor Model Valid in All Regions of Operation*, Analog Integrated Circuits and Signal Processing, 8 (1995), pp. 83-114 — EKV 원전.

---

## 두 권의 통합 — Part 3의 "물리 reference"

```
  Sze (2021)        모든 device family — diode, BJT, MOSFET, memory, sensors
       │
       ├── Tsividis (2010)   MOSFET 깊이, EKV 통합 모델, 모든 동작 영역
       │
       └── (다음 노트: device family별 papers — memristor, PCM, MRAM, NVM)
```

### 통합 매트릭스 — 우리 formulation operator → Sze/Tsividis 어디

| 우리 operator | 물리 영역 | Sze/Tsividis chapter |
|---|---|---|
| `N_α` (kink) | MOSFET kink + impact ionization | Sze 6, 8; Tsividis bulk-charge |
| `N_β` (subthreshold exp) | Weak inversion | Sze 6.2.4, Tsividis EKV |
| `N_γ` (saturation) | Strong inversion saturation | Sze 6.2; Tsividis 4 |
| `W` (crossbar 전도도) | Memristive devices | Sze 14 (재기록 가능 저항) |
| Tier-2 charge-trap | Non-volatile memory (SONOS) | Sze 7 (Floating-gate, MNOS) |
| Tier-1 floating-bulk | Bulk effects, body bias | Tsividis Ch. 5 (body bias) |
| Thermal noise σ | Junction noise theory | Sze App., Tsividis Ch. 8 |
| Flicker noise 1/f | Surface state trapping | Tsividis Ch. 8 |
| Mismatch σ_VT | Pelgrom mismatch | Tsividis Ch. 7 |

→ 두 textbook이 우리 formulation의 거의 모든 device-physics 가정을 정량적으로 뒷받침.

### 다음 노트들의 위치

```
  Sze + Tsividis        (이 노트)        — 모든 device의 기반 물리
       ↓
  Memristor/PCM        (다음 노트)        — 새로운 메모리 device family
  MRAM (STT/VCMA)      (그 다음)          — magnetic 기반
  NVM charge storage   (그 다음)          — flash, FeRAM, NS-RAM
```

각각 Sze Ch. 7, 14의 device class를 다른 깊이로 설명.
