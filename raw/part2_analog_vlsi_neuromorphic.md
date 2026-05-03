---
title: Part 2 — Analog VLSI 정전 (Mead, Liu, Vittoz)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: textbook_classic_summary
part: 2
covers:
  - Mead (1989) Analog VLSI and Neural Systems
  - Liu, Kramer, Indiveri, Delbruck, Douglas (2002) Analog VLSI Circuits and Principles
  - Vittoz weak inversion / subthreshold work
---

# Part 2 — Analog VLSI 정전 (Mead, Liu, Vittoz)

서브임계(subthreshold) MOSFET을 신경계 모방 회로로 활용하는 패러다임의 시초. 이후 모든 뉴로모픽 칩의 수학적 어휘가 여기서 나옴.

---

## 1. Mead (1989) — *Analog VLSI and Neural Systems*

뉴로모픽 엔지니어링의 **창립 텍스트**. Caltech의 Carver Mead가 신경 회로의 아날로그 VLSI 모방을 체계화.

### 1.1 핵심 통찰: 서브임계 MOSFET = 생물학적 시냅스의 물리적 등가물

전류와 전압의 지수 관계 (subthreshold I-V):
```
  I_D = I_0 · exp(V_GS / n V_T)         (V_GS < V_T 이하)
```
- `V_T` = 25 mV (300K thermal voltage)
- `n` ≈ 1.3-1.5 (subthreshold slope factor)
- `I_0` = bias-dependent prefactor

이 식이 **neuron의 sigmoid activation**과 **시냅스 전류의 자연스러운 분포**를 둘 다 한 트랜지스터로 표현하게 함.

### 1.2 Translinear Loop (Mead Ch. 5)

여러 트랜지스터의 V_BE (또는 V_GS) 합이 0인 폐 루프에서:
```
  ∏ I_k(시계방향) = ∏ I_k(반시계방향)
```
→ 곱셈, 나눗셈, 제곱근, 지수, 로그 모두 4-6개 트랜지스터로 구현 가능. 이게 **모든 후속 아날로그 ML 회로의 기반**.

### 1.3 시각 시스템 회로 (Silicon Retina, Mead Ch. 15)

- Photoreceptor → log-compression (subthreshold) → spatial Laplacian (저항 격자) → contrast detection
- 인간 망막의 outer plexiform layer를 VLSI로 직접 모방
- **순수 아날로그 회로가 디지털 image processing보다 1000배 적은 전력으로 같은 작업 수행** 증명

### 1.4 Mead의 5가지 설계 원칙

1. 물리(physics)가 곧 알고리즘 — 신경계가 그러하듯 회로도 매체의 본성을 활용
2. 전류 모드 우선 — KCL이 자연스러운 합산
3. 서브임계로 동작 — 지수 비선형성이 풍부한 표현력 제공
4. Local-only 연결 — 글로벌 클럭 회피, 비동기
5. 적응성 (adaptation) — 회로 자체가 환경에 맞춰 변화 (floating-gate)

### 우리 formulation과의 직접 연결

| Layer C 정의 | Mead 1989 chapter |
|---|---|
| `N` (nonlinearity) | Ch. 3 — subthreshold I-V |
| `W·v` (Kirchhoff sum) | Ch. 4 — current-mode wiring |
| Translinear (Gilbert cell) | Ch. 5 |
| `S` (Gaussian score via exp) | Ch. 5-6 |
| Adaptive weight (Tier-2 storage) | Ch. 12 — floating-gate adaptation |

**우리 PPCA의 거의 모든 슬롯이 Mead 1989에서 회로 형태로 이미 제시됨.** 차이: Mead는 학습을 명시적으로 다루지 않았고 (forward path만), 우리는 backprop-free 학습까지 포함.

### 참조
- Mead, *Analog VLSI and Neural Systems*, Addison-Wesley (1989) — 표준 textbook, 일부 챕터 저자 웹사이트 PDF 공개.
- Mead, *Neuromorphic Electronic Systems*, Proc. IEEE, 78 (1990), pp. 1629-1636 — 1.5 MA 적은 paper, 분야 정의.

---

## 2. Liu, Kramer, Indiveri, Delbruck, Douglas (2002) — *Analog VLSI: Circuits and Principles*

Mead의 후속 세대 (ETH Zurich + Caltech)가 쓴 종합 textbook. Mead 1989 이후 13년의 발전을 통합.

### 2.1 Mead 1989와의 차이

- **Spike-based computation 통합**: leaky integrate-and-fire (LIF) 뉴런, address-event representation (AER)
- **STDP** (Spike-Timing-Dependent Plasticity) — 학습 규칙을 회로로 구현
- **Floating-gate adaptive synapse** 정량 분석 — `g_m`-mismatch, retention, programming protocol
- **Aer 기반 multi-chip 시스템** — large-scale neuromorphic hardware의 첫 청사진

### 2.2 LIF 뉴런 회로

```
  C · dV/dt = I_in − g_leak · (V − V_rest)
  if V ≥ V_th:  spike + V ← V_reset
```
- 적분기 (커패시터 + leak 트랜지스터)
- 비교기 (Schmitt trigger)
- 리셋 스위치 (트랜지스터)

총 ~10 트랜지스터로 구현. 이게 모든 spiking neural network 칩의 기본 셀.

### 2.3 AER (Address Event Representation)

여러 뉴런의 spike를 하나의 디지털 버스에 시간순으로 전송 (각 spike = "이 뉴런 ID"). 비동기, 이벤트 구동, 통신 효율 ↑.

→ 우리 formulation의 Encoder Option (spike-timing) 직접 대응.

### 2.4 Floating-Gate Adaptive Synapse

전하 보존 + 프로그래밍 가능한 weight:
```
  Q_FG = ∫ I_inj dt − ∫ I_leak dt
```
hot-electron injection (write +) + Fowler-Nordheim tunneling (write −) → 비휘발성, 정밀 가중치.

→ 우리 formulation Tier-2 (charge-trap)과 Tier-3 (flash) 모두의 회로 패턴.

### 2.5 4가지 컴퓨팅 패러다임 분류 (Indiveri-Liu)

1. **Threshold-based** (LIF, sigma-delta) — 비교기 + 적분기
2. **Translinear** (Gilbert) — exp/log 활용 곱셈
3. **Charge-mode** (switched-cap) — 전하 보존 활용 합산
4. **Mixed-signal** (DAC/ADC at boundaries) — 디지털 + 아날로그

우리 PPCA가 **이 4가지를 동시에 사용**하는 hybrid 시스템 (Encoder는 charge, W는 charge sum, N은 threshold + translinear, 학습은 mixed-signal feedback).

### 참조
- Liu, Kramer, Indiveri, Delbruck, Douglas, *Analog VLSI: Circuits and Principles*, MIT Press (2002) — 뉴로모픽 표준 textbook.
- Indiveri et al., *Neuromorphic silicon neuron circuits*, Frontiers Neurosci. (2011) — LIF 회로 종합 survey.

---

## 3. Vittoz — Weak Inversion (Subthreshold) 회로 가족

스위스 EPFL의 Eric Vittoz가 1970-80년대 정립. 서브임계 MOSFET을 BJT처럼 활용하는 회로 패턴.

### 3.1 Lateral Bipolar Mode

NMOS의 source/drain/well로 substrate parasitic NPN을 형성. 서브임계 MOSFET이 BJT와 거의 동일한 exp I-V를 보이지만, full CMOS 공정에서 추가 마스크 없이 가능.

→ Translinear circuits을 BJT 없이 표준 CMOS에서 구현 가능 → **Mead 패러다임의 산업화 가능성**.

### 3.2 Vittoz의 서브임계 노이즈 분석

서브임계 MOSFET의 thermal noise:
```
  i_n² = 2 q I_D · Δf      (shot noise dominant)
```
sample-and-hold 후의 transferred noise:
```
  V_n² = k_B T / C          (kT/C noise)
```
이 두 식이 우리 Layer S Theorem 5'의 `σ_th²` 계산에 사용.

### 3.3 Vittoz의 "ultimate low-power" 한계

서브임계에서 동작하면 transconductance:
```
  g_m = I_D / (n V_T)        ≈ 40 I_D  (n=1)
```
같은 g_m을 얻는 데 strong-inversion보다 100-1000× 적은 전류. → 모든 ultra-low-power 회로의 기반.

### Part 4와의 연결

Vittoz의 서브임계 노이즈 모델 + Pelgrom mismatch가 Theorem 5'의 정량 입력. 우리 formulation의 "semi-passive" 목표를 만족하는 power budget = Vittoz의 ultimate low-power region.

### 참조
- Vittoz, *MOS Transistors Operated in the Lateral Bipolar Mode*, IEEE JSSC, SC-18 (1983), pp. 273-279.
- Vittoz, *Weak Inversion for Ultimate Low-Power Logic*, in *Low-Power Electronics Design* (CRC Press, 2004) — book chapter.
- Vittoz, *The Design of High-Performance Analog Circuits on Digital CMOS Chips*, IEEE JSSC, SC-20 (1985), pp. 657-665.

---

## 세 권의 통합 — Part 2의 "물리-수학 사전"

```
  Mead 1989       서브임계 → 신경계 모방의 패러다임 시초
        │
        ├── Vittoz  ────  Subthreshold lateral BJT 회로 가족
        │                 (CMOS-compatible Mead 회로의 산업화)
        │
        └── Liu 2002 ────  Spike + AER + STDP + 적응 시냅스
                          (Mead의 다음 세대 통합)
```

이 셋이 **Part 2 모든 operator의 회로 구현 reference**:

| 수학 operator | Mead/Vittoz/Liu 어디 |
|---|---|
| 적분 ∫ | Mead Ch. 4 (커패시터), Liu Ch. 6 (leak) |
| Kirchhoff sum | Mead Ch. 4, Vittoz current-mode |
| 곱셈 (Gilbert cell) | Mead Ch. 5, Liu Ch. 4 |
| 임계 (sigmoid) | Mead Ch. 3 (subthreshold), Liu Ch. 8 (LIF) |
| 지수 / 로그 | Vittoz lateral BJT (translinear loop) |
| 가우시안 score | Mead Ch. 5 (winner-take-all 회로 일부) |
| Adaptive weight | Mead Ch. 12, Liu Ch. 11 (floating-gate) |

다음 노트: Part 2 — Gilbert translinear principle + Toumazou current-mode (`part2_translinear_principle.md`).
