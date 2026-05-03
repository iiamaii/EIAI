---
title: Part 3 — Charge-storage NVM (Flash, Floating-gate, FeRAM, NS-RAM)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: paper_summary
part: 3
covers:
  - Pavan, Bez, Olivo, Zanoni (1997) Flash Memory Cells - An Overview (Proc. IEEE)
  - Hasler, Diorio, Minch, Mead (1996) A Single-Transistor Silicon Synapse
  - Müller et al. (2015) Ferroelectric hafnium oxide based devices
  - NS-RAM (synaptic and neural behaviours, prior corpus reference)
---

# Part 3 — Charge-storage NVM (Flash, Floating-gate, FeRAM, NS-RAM)

전하 또는 분극(polarization)으로 비휘발성 정보를 저장하는 device family. 가장 성숙한 NVM 기술 (Flash 포함) + 새로운 후보 (FeRAM, NS-RAM).

---

## 1. Pavan et al. (1997) — Flash Memory Cells

표준 Flash 기술 종합 reference. ETOX, NOR, NAND 구조 + write/read protocol.

### 1.1 Floating-gate cell

```
  Control gate (V_CG)
       │
   ────────────  Inter-poly oxide (~15 nm)
   Floating gate (전하 저장)
   ────────────  Tunnel oxide (~8 nm)
   Substrate (Si)
```

전하 Q_FG가 floating gate에 갇힘 → V_T shift:
```
  V_T_eff = V_T0 − Q_FG / C_CG
```
- Q_FG > 0 (전자 추가): V_T 상승 → "1" (programmed)
- Q_FG = 0: V_T 낮음 → "0" (erased)

### 1.2 Programming 방법

- **Channel hot electron injection (CHE)**: 채널의 고에너지 전자가 tunnel oxide 통과 → FG 충전. NOR Flash. 빠름 (~μs), 높은 전류.
- **Fowler-Nordheim tunneling (F-N)**: 양자 터널링 (E_field >10 MV/cm). NAND Flash + erase. 느림 (~ms), 낮은 전류.

### 1.3 NAND vs NOR

| 측면 | NAND | NOR |
|---|---|---|
| 셀 면적 | 4 F² (가장 작음) | 10 F² |
| Read latency | μs (block 단위) | ns (random byte) |
| Write/Erase | 페이지 단위 | byte 단위 |
| Endurance | 10⁴-10⁵ | 10⁵-10⁶ |
| 응용 | 데이터 저장 (SSD) | 코드 저장 (firmware) |

### 1.4 Multi-level cell (MLC, TLC, QLC)

- SLC: 1 bit/cell (가장 정확, endurance ↑)
- MLC: 2 bits/cell
- TLC: 3 bits/cell (현재 표준 SSD)
- QLC: 4 bits/cell (대용량, endurance ↓)

### 1.5 우리 formulation에서의 역할

- **Tier-3 archive**: NAND Flash가 가장 mature 옵션. 10년 retention, μJ/bit write energy.
- **단점**: ms-급 write latency → "지속 학습"의 즉각 반영 어려움. 따라서 Tier-2 (charge-trap)이 빠른 write, Tier-3 (Flash)는 주기적 snapshot.

### 참조
- Pavan, Bez, Olivo, Zanoni, *Flash Memory Cells — An Overview*, Proc. IEEE, 85 (1997), pp. 1248-1271.

---

## 2. Hasler, Diorio, Minch, Mead (1996) — A Single-Transistor Silicon Synapse

Caltech 그룹이 floating-gate를 **adaptive analog memory**로 사용. 표준 CMOS에서 가능한 최소 회로의 인공 시냅스.

### 2.1 Single-transistor synapse 구조

pFET + 작은 floating gate. CHE injection (drain side) + UV 또는 electron tunneling (erase). gate 바이어스 = synaptic weight.

### 2.2 정밀 control

- **Programming**: drain voltage pulse → CHE injection → V_T 미세 shift
- **Read**: 작은 V_GS로 drain current 측정 (analog readout)
- **Resolution**: 10-14 bit equivalent (단 절대 정확도가 아닌 monotonic)

### 2.3 적응 회로

floating-gate가 회로 운용 중 자동 조절:
- V_FG가 신호의 시간 평균을 따라감 (long-term adaptation)
- 환경 변화에 맞춰 회로 자체가 재조정

→ 우리 formulation에서 **Tier-2 (live weight)의 alternative for charge-trap** — charge-trap이 SONOS-like multi-trap이라면 floating-gate는 single-storage.

### 참조
- Hasler, Diorio, Minch, Mead, *Single Transistor Learning Synapse with Long Term Storage*, ISCAS (1995); IEEE TED (1996).
- Hasler, *Continuous-Time Feedback in Floating-Gate MOS Circuits*, IEEE TCAS-II, 48 (2001), pp. 56-64.

---

## 3. Müller et al. (2015) — Ferroelectric HfO₂ devices (FeRAM/FeFET)

기존 PZT (Pb-Zr-Ti) 기반 FeRAM이 CMOS-incompatible (Pb 오염). 2011년 NaMLab 그룹이 doped-HfO₂에서 ferroelectricity 발견 → CMOS 호환 ferroelectric.

### 3.1 Ferroelectric polarization

자발 분극(spontaneous polarization) Ps. 외부 전기장으로 분극 방향 전환:
```
  P(E) hysteresis loop:
  - Coercive field E_c ≈ 1-2 MV/cm
  - Remnant polarization P_r ≈ 10-30 μC/cm²
  - Switching time < 1 ns
```

### 3.2 FeRAM 셀

1T1C: 1 트랜지스터 + 1 ferroelectric capacitor. Read = polarization sensing (destructive, write-back 필요).

### 3.3 FeFET (1-transistor 셀)

ferroelectric을 gate dielectric에 직접 사용:
```
  V_T(P) = V_T0 + (P / C_ox)
```
분극 방향에 따라 V_T 변화 → multi-level 가능, non-destructive read.

### 3.4 성능

| 측면 | FeRAM (1T1C) | FeFET |
|---|---|---|
| Switching time | <1 ns | <10 ns |
| Switching energy | aJ-fJ/bit | fJ/bit |
| Endurance | 10¹²-10¹⁵ | 10⁹-10¹² |
| Retention | 10년 | 10년 |
| Multi-bit | 어려움 | 가능 (V_T 다중 레벨) |

VCMA-MRAM에 비견되는 효율 + multi-bit 가능 → 가장 유망한 차세대 NVM.

### 3.5 우리 formulation

- **Tier-2 (live weight)**: FeFET multi-level, 빠른 read/write
- **Tier-3 (archive)**: FeRAM 단독 또는 FeFET array

### 참조
- Müller et al., *Ferroelectric hafnium oxide based materials and devices: Assessment of current status and future prospects*, J. Appl. Phys., 121 (2017), pp. 064106.
- Müller et al., *Ferroelectricity in HfO₂ enables nonvolatile data storage in 28nm HKMG*, VLSI Symp. (2012).

---

## 4. NS-RAM (Synaptic and Neural Behaviours)

이전 세션에 보유했던 paper (현재 raw/에서 제거됨, 재추가 필요). 핵심 내용:

### 4.1 NS-RAM cell 구조

2-transistor cell:
- **MOSFET 1**: 부유체(floating bulk) + drain — punch-through impact ionization로 단기 가소성 (τ_fast ~ms)
- **MOSFET 2**: charge-trap layer (SONOS-like) — 장기 보존 (τ_slow ~hours-years)

### 4.2 Bio-inspired short + long term plasticity

같은 cell에서:
- **Short-term plasticity**: 빠른 펄스 train → 부유체에 hole 누적 → V_T 상승 (수 ms 후 leakage로 회복)
- **Long-term plasticity**: 충분한 hot-carrier injection → trap에 전자 영구 trapped (years retention)

이게 우리 formulation의 **Tier 1 (floating-bulk τ_fast) + Tier 2 (charge-trap τ_slow) 통합 cell** — 두 시정수가 한 device에 공존.

### 4.3 우리 formulation에서의 역할

NS-RAM = 우리 PPCA의 가장 직접적 device 후보. 하나의 셀이 Tier 1 + Tier 2 동시 수행.

### 참조
- Synaptic and Neural Behaviours paper — 이전 corpus에 포함되었던 device-physics paper. **재추가 필요**.

---

## 4가지 charge-storage device의 비교

| device | Tier role | Switching speed | Energy/bit | Retention | Multi-level |
|---|---|---|---|---|---|
| **NAND Flash** | Tier 3 archive | ms (write) | μJ-mJ | 10 년 | 4 bits |
| **Floating-gate (Hasler)** | Tier 2 live | μs | nJ | months | 10-14 bit equivalent (analog) |
| **FeRAM (1T1C)** | Tier 3 또는 Tier 2 | <1 ns | aJ-fJ | 10 년 | 1 bit |
| **FeFET** | Tier 2 + Tier 3 | <10 ns | fJ | 10 년 | multi-bit |
| **NS-RAM (2T cell)** | Tier 1 + Tier 2 | ns (fast) + μs (slow) | pJ | hours - years | analog |

### 우리 PPCA에서의 추천 조합

**가장 효율적 (반수동 디바이스 목표)**:
- Tier 1 + Tier 2: NS-RAM 2T cell (단일 device로 두 시정수)
- Tier 3: FeFET array (multi-bit, BEOL stack)

**가장 mature (현재 양산 가능)**:
- Tier 1: floating-bulk MOSFET
- Tier 2: charge-trap SONOS
- Tier 3: NAND Flash

---

## Part 3 4편 통합 — device family 매트릭스

```
                    Memristor    PCM      MRAM     Flash    NS-RAM   FeRAM/FeFET
  Switching speed   ns           ns-100ns ns       ms       ns-μs    ns
  Energy/bit        pJ           100 pJ   fJ-100fJ μJ-mJ    pJ       fJ-aJ
  Endurance         10⁶-10¹⁰    10⁸-10¹² 10¹⁰-10¹⁵ 10⁴-10⁵ 10⁶+    10¹²-10¹⁵
  Retention         days-years   10년      10년     10년    hours-yr 10년
  Multi-bit         2-4          4-8       1        4        analog   1-multi
  BEOL              ✓            ✓         ✓        Front     Front    BEOL+Front
  CMOS compat       ✓            ✓         ✓        ✓        ✓        ✓ (HfO₂)
```

### 우리 formulation Layer S `σ_eff²` 정량 비교

각 device의 noise 기여 ranking (가장 작음 → 큼):
1. VCMA-MRAM: thermal stability factor Δ > 60 → noise 거의 없음
2. FeFET: σ_polarization ~ 1-3% retention shift
3. PCM: σ_drift ~ 5-10%/decade + cell-to-cell σ_R
4. Memristor (filamentary): σ_R ~ 10-30% cell-to-cell
5. Flash MLC: σ_VT ~ 50-100 mV programming spread

→ 학습 정확도 critical할수록 MRAM/FeFET 선호, 면적·multi-bit critical할수록 PCM 선호.

이로써 Part 3 4편 + textbook 2편 (Sze/Tsividis)이 모든 device family에 대한 정량 reference를 제공.

다음: Part 1·2·3 텍스트북 9편 통합 후 `--update`로 그래프 통합.
