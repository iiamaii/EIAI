---
title: Part 3 — MRAM (STT-MRAM, VCMA-MRAM)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: paper_summary
part: 3
covers:
  - Apalkov, Dieny, Slaughter (2016) Magnetoresistive Random Access Memory (Proc. IEEE)
  - Wang, Khalili Amiri (2012) Voltage-controlled magnetic anisotropy in MTJ
  - Bhatti et al. (2017) Spintronics based random access memory - a review
---

# Part 3 — MRAM: STT-MRAM과 VCMA-MRAM

자성 터널 접합(MTJ, Magnetic Tunnel Junction)을 비트 셀로 사용. 전류(STT) 또는 전압(VCMA)으로 자화 방향 전환. 매우 높은 endurance, BEOL 호환, 비휘발성.

---

## 1. MTJ 기본 구조

MTJ = pinned layer + tunnel barrier (MgO) + free layer

```
  [강자성층 1 — 자화 방향 고정]
  [터널 barrier — MgO 1-1.5 nm]
  [강자성층 2 — 자화 방향 가변]
```

자화 평행/반평행에 따른 저항 차이 (TMR, Tunnel Magnetoresistance):
```
  TMR = (R_AP − R_P) / R_P
```
- 현재 공정: TMR ~150-300%
- R_P ≈ 1-10 kΩ, R_AP ≈ 2.5-40 kΩ

비트 = 자화 정렬 (P=0, AP=1).

---

## 2. STT-MRAM (Spin-Transfer Torque)

### 2.1 작동 원리

전류가 fixed layer를 통과하며 spin-polarized → free layer에 spin angular momentum 전달 → 자화 방향 전환.

임계 전류 밀도:
```
  J_c = (2eα · M_s · t · H_eff) / (ℏ · η)
```
- α = damping constant
- M_s = saturation magnetization
- t = free layer 두께
- H_eff = effective field
- η = spin polarization efficiency

전형적 J_c ~ 10⁶ A/cm² → ns 펄스로 switching.

### 2.2 성능 메트릭

- **Switching time**: 1-10 ns
- **Switching energy**: ~100 fJ/bit (CMOS DRAM의 1/100)
- **Endurance**: 10¹⁰-10¹⁵ cycles (가장 높음)
- **Retention**: 10+ 년 (300K thermal stability)
- **Read disturb**: 미미 (작은 read current)

### 2.3 Multi-level 어려움

MTJ는 본질적으로 binary (P/AP). Multi-level 시도:
- 여러 MTJ 직렬/병렬 (면적 비용)
- Skyrmion 또는 domain wall 동역학 (실험 단계)

→ 우리 formulation에서 **MRAM은 binary weight 또는 1-bit perturbation에 적합**, multi-bit weight는 PCM/memristor가 유리.

### 참조
- Apalkov, Dieny, Slaughter, *Magnetoresistive Random Access Memory*, Proc. IEEE, 104 (2016), pp. 1796-1830 — STT-MRAM 종합 reference.
- Bhatti et al., *Spintronics based random access memory: a review*, Materials Today, 20 (2017), pp. 530-548.

---

## 3. VCMA-MRAM (Voltage-Controlled Magnetic Anisotropy)

### 3.1 작동 원리 (Wang, Khalili Amiri)

전류 대신 **전압**으로 자기 이방성(anisotropy) 변경. MgO/CoFeB interface의 전기장이 결정 이방성 에너지 K_u 조절:
```
  ΔK_u = β · E_field
```
- β ≈ 30-100 fJ/V·m (재료 상수)

K_u 감소 시 자화 안정성 ↓ → 작은 보조 자기장(또는 STT 펄스)으로 switching.

### 3.2 VCMA의 장점

| 측면 | STT-MRAM | VCMA-MRAM |
|---|---|---|
| Switch 신호 | 큰 전류 (~mA) | 작은 전압 (~V) + 작은 보조 |
| Switch 에너지 | ~100 fJ/bit | ~1 fJ/bit (10-100× 감소) |
| Read disturb | 미미 | 매우 미미 |
| Endurance | 10¹⁰-10¹⁵ | 10¹⁵+ |
| 공정 성숙도 | 양산 (Everspin, Samsung) | 연구/시제품 단계 |

VCMA가 **궁극의 저전력 NVM** — 우리 PPCA "semi-passive" 목표에 가장 적합.

### 3.3 우리 formulation에서의 역할

- **Tier-3 archive**: STT-MRAM은 이미 산업 양산, VCMA가 미래
- **Slot Update (slow memory)**: VCMA write energy가 가장 작음 → "데이터 들어올 때마다 학습 갱신"의 power budget 가장 유리
- **Slot W (binary weight)**: STT-MRAM 크로스바 (단, multi-bit 한계 → 가중치 정밀도 제한)

### 참조
- Wang, Khalili Amiri, *Voltage-controlled magnetic anisotropy in magnetic tunnel junctions*, SPIN, 2 (2012), 1240002.
- Wang et al., *Voltage-induced switching of nanoscale magnetic tunnel junctions*, IEDM (2018).

---

## 4. MRAM 회로 통합 — Differential pair / sense amp

### 4.1 1T1MTJ cell

각 비트 = 1 access 트랜지스터 + 1 MTJ. Word-line / bit-line / source-line (3-line) 구조.

Read: 작은 V_read 적용, sense amp로 R_P vs R_AP 구분.

### 4.2 2T2MTJ differential

두 cell의 차이 신호로 readout → 각 cell의 process variation 상쇄. 정확도 ↑, 면적 2× 비용.

→ 우리 formulation에서 **bit 정확도 critical할 때 differential 사용**, 면적 critical할 때 single-ended.

### 4.3 BEOL 호환성

MTJ stack은 후공정(BEOL)에서 형성 — CMOS logic 위에 추가 가능. 기존 logic die 위에 1-2 layer MRAM을 stack → **3D integrated 메모리**.

→ 우리 PPCA의 Tier-3 archive를 logic 위에 BEOL stack으로 통합 가능 → 면적 efficient.

---

## MRAM의 PPCA에서의 위치

```
  Tier 1 (perturbation, ns)         floating-bulk + analog node
  Tier 2 (live weight, μs-h)        charge-trap or PCM
  Tier 3 (archive, years)           Flash / MRAM ← VCMA-MRAM 가장 efficient
```

**가장 효율적 조합**:
- Live weight: PCM (multi-bit, drift compensation)
- Archive: VCMA-MRAM (energy ↓, BEOL stack)

또는 **VCMA-MRAM 단독**:
- Tier 2 + 3 통합 (VCMA의 빠른 write로 live update + 비휘발성)
- 단, multi-bit 어려움 → rank-r perturbation이 적합

### Layer S Theorem 5'와의 정량 연결

VCMA-MRAM의 noise 기여:
- **Thermal**: 미미 (자성 시스템 thermal stability factor Δ ≥ 60 → noise 없음)
- **Read 1/f**: 매우 작음 (binary readout)
- **Variability**: σ_TMR ≈ 10-20% cell-to-cell

→ `σ_eff²(MRAM)` 가장 작음 → bound 가장 tight → 학습 정확도 최고.

### 다음 노트

`part3_charge_storage_nvm.md` — Flash (Pavan) + Floating-gate (Hasler) + FeRAM (Müller) + NS-RAM (Synaptic and neural behaviours).
