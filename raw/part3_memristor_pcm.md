---
title: Part 3 — 멤리스터 (Memristor) 와 상변화 메모리 (PCM)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: paper_book_summary
part: 3
covers:
  - Strukov, Snider, Stewart, Williams (2008) The missing memristor found
  - Ielmini, Waser (eds.) (2016) Resistive Switching - Wiley-VCH
  - Burr et al. (2010) Phase change memory technology
  - Burr et al. (2017) Neuromorphic computing using non-volatile memory
---

# Part 3 — 멤리스터(Memristor)와 상변화 메모리(PCM)

크로스바 가중치 행렬 `W`의 가장 유망한 두 device family. 둘 다 비휘발성 + analog 가변 + BEOL (Back-End-of-Line) CMOS 호환.

---

## 1. Strukov, Snider, Stewart, Williams (2008) — *The missing memristor found*

### 배경

Leon Chua가 1971년 4번째 fundamental 회로 element로 memristor 예측 (R, L, C 외). 37년 동안 물리적 실현 없음. 2008년 HP Labs가 TiO₂ 박막에서 memristive behavior 시연.

### 1.1 Memristor 정의 (Chua 1971)

전하 q와 자속 φ의 관계:
```
  dφ = M(q) · dq
```
M(q)가 메모리스턴스 (memristance). 시간 적분 형태:
```
  v(t) = M(q(t)) · i(t),   q(t) = ∫ i(τ) dτ
```
저항이 **누적된 전하의 함수** — 과거를 기억.

### 1.2 HP TiO₂ memristor 모델 (Strukov 2008)

이중층 구조: TiO₂ (절연) + TiO₂₋ₓ (산소 결손, 전도). 산소 결손 영역의 폭 `w(t)`가 가변:
```
  v = [R_ON · w/D + R_OFF · (1 - w/D)] · i
  dw/dt = μ_v · R_ON · i / D
```
- D = 총 박막 두께 (~10 nm)
- μ_v = drift mobility (~10⁻¹⁴ m²/Vs)
- 전류 적분 → drift → 저항 변화

### 1.3 실험 결과

- 저항비 (HRS/LRS): 100-10,000×
- 스위칭 시간: 1-100 ns
- Endurance: 10⁵-10⁹ cycles (재료에 따라)
- Retention: hours - years (cell physics 의존)

### 1.4 우리 formulation에서의 역할

크로스바 cell의 전도도 `G_{ij} = 1/M_{ij}`. Pulse-driven write로 G 조절. Forward path:
```
  I_j = Σ_i G_{ij} · V_i        (Kirchhoff, 즉시)
```
Write path: 전압 펄스 (V_set, V_reset)로 `w` 조절 → G 변경 → 가중치 학습 후 상태 유지.

### 참조
- Strukov, Snider, Stewart, Williams, *The missing memristor found*, Nature, 453 (2008), pp. 80-83.

---

## 2. Ielmini & Waser (2016) — *Resistive Switching* (book)

memristor / RRAM (Resistive RAM)의 종합서. 8가지 cell type, 물리 메커니즘, 회로/시스템 응용.

### 2.1 Resistive switching 메커니즘 분류

1. **Filament 형성** (Filamentary RRAM):
   - Cu/Ag 등 금속 이온이 산화막 안에 metallic filament 형성/해체
   - 빠름 (ns), 강한 비선형, multi-level 어려움
2. **Vacancy migration** (HP TiO₂ memristor):
   - 산소 결손 drift
   - 더 안정, multi-level 가능
3. **Mott insulator transition**:
   - VO₂ 등 strongly correlated 시스템
   - 매우 빠름 (ps), threshold switching
4. **Phase change** (PCM, 별도 family):
   - Chalcogenide의 amorphous ↔ crystalline
   - 다음 섹션 참조

### 2.2 1S1R cell 구조

selector (S) + resistor (R) — sneak path 차단을 위한 직렬 selector. Selector 후보:
- Diode (단방향)
- OTS (Ovonic Threshold Switch — chalcogenide 기반 양방향)
- Threshold MOSFET

→ 우리 formulation alternative catalog의 OTS Slot N 후보가 이 selector 가족.

### 2.3 Multi-level cell (MLC)

Single cell에 여러 저항 레벨 (4-bit = 16 레벨, 8-bit = 256 레벨). Programming protocol:
- Iterative write-verify (정밀 가능, 느림)
- Pulse train (빠름, 정확도 ↓)

→ 우리 Pair 3 identity (`bits ↔ rank`) 정량 입력.

### 2.4 회로/시스템 통합

- **Crossbar architecture**: N×N 메모리 + N×N MVM 동시
- **Sneak path 분석**: parasitic 전류로 인한 정확도 손실 → selector 또는 differential cell
- **Variation tolerance**: cell-to-cell σ가 정확도에 미치는 영향 모델링

### 참조
- Ielmini, Waser (eds.), *Resistive Switching: From Fundamentals of Nanoionic Redox Processes to Memristive Device Applications*, Wiley-VCH (2016).

---

## 3. Burr et al. (2010, 2017) — Phase Change Memory (PCM)

PCM은 chalcogenide (GeSbTe, GST 합금)의 비정질↔결정질 상전이를 활용. IBM이 30년 가까이 연구한 비휘발성 메모리 기술.

### 3.1 PCM 작동 원리

**Chalcogenide phase**:
- Crystalline (결정질): 낮은 저항 (~10 kΩ)
- Amorphous (비정질): 높은 저항 (~1 MΩ)

**Programming**:
- **SET** (crystalline 화): 약한 전류 + 긴 펄스 → 결정 성장 (~100 ns)
- **RESET** (amorphous 화): 강한 전류 + 짧은 펄스 → 녹았다가 빠른 냉각 (~10 ns)

**Read**: 작은 전압으로 저항 측정, 셀 상태 변경 안 함.

### 3.2 Multi-level PCM (Burr 그룹)

부분 결정질 영역의 비율을 조절하여 4-8 레벨. Iterative SET-pulse train + read-verify.

### 3.3 Drift 문제

PCM amorphous 영역의 저항이 시간에 따라 증가 (drift):
```
  R(t) = R_0 · (t / t_0)^ν,    ν ≈ 0.05-0.1
```
1년 후 저항이 2-10× 증가 → 정확도 손실.

**해결책**: 
- Differential cell (두 셀의 비)
- Batch normalization 적용 (Joshi 2019, 그래프에 이미 ingest)
- Periodic refresh

### 3.4 PCM neural network training (Joshi et al. 2019)

Burr 그룹의 종합 결과 (이미 graph에 포함):
- ResNet-32 → CIFAR-10 93.7% (PCM hardware)
- ResNet-50 → ImageNet Top-1 71.6%
- Differential cell + drift compensation으로 weight transfer 후 정확도 유지

이게 **PCM이 가중치 저장 + MVM 둘 다를 수행한 첫 본격 NN 데모**.

### 3.5 우리 formulation에서의 역할

- **Slot W (linear combiner)**: PCM 크로스바, 전도도 다중 레벨, BEOL CMOS 호환
- **Slot Update (slow memory)**: SET/RESET 펄스로 W 조절
- **Tier-3 archive 후보**: 10년 이상 retention (drift 감안 시)
- **Drift 대응**: 우리 Layer S Theorem 5'의 noise 모델에 추가 1/f-like component

### 참조
- Burr et al., *Phase change memory technology*, J. Vac. Sci. Technol. B, 28 (2010), pp. 223-262.
- Burr et al., *Neuromorphic computing using non-volatile memory*, Adv. Phys. X, 2 (2017), pp. 89-124.
- Burr et al., *Equivalent-accuracy accelerated neural-network training using analogue memory*, Nature, 558 (2018), pp. 60-67 — IBM의 PCM training 결과.

---

## 두 device family의 비교 — 우리 PPCA 슬롯에 대한 적합성

| 측면 | Memristor (HfO₂/TiO₂) | PCM (GST) |
|---|---|---|
| 저항비 (HRS/LRS) | 10²-10⁴ | 10²-10³ |
| Switching speed | 1-10 ns | 10-100 ns (RESET 빠름, SET 느림) |
| Endurance | 10⁶-10¹⁰ cycles | 10⁸-10¹² cycles |
| Retention | days-years (cell-specific) | 10년 (drift 감안 시) |
| Multi-level (bits) | 2-4 bits | 4-8 bits |
| BEOL 호환 | ✓ | ✓ |
| Variability | medium | medium-high |
| Drift | low | high (1/f-like) |

### 우리 formulation에서의 우선 채택

- **고밀도 weight 저장 + MVM**: PCM (multi-bit ↑, drift 보정 가능)
- **빠른 perturbation**: Memristor (switching speed ↑)
- **Tier-2 (live weight)**: PCM 또는 charge-trap
- **Tier-3 (archive)**: PCM 또는 Flash

### 다음 노트

- `part3_mram.md` — MRAM (STT, VCMA) — 더 빠르고 endurance 높지만 multi-bit 어려움
- `part3_charge_storage_nvm.md` — Flash, FeRAM, charge-trap, NS-RAM — charge-based 비휘발성 메모리 가족
