---
title: Part 2 — Translinear Principle와 전류-모드 회로 (Gilbert, Toumazou)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: paper_classic_summary
part: 2
covers:
  - Gilbert (1968) Precise four-quadrant multiplier
  - Gilbert (1975) Translinear circuits classification
  - Gilbert (1996) Translinear circuits historical overview
  - Toumazou, Lidgey, Haigh (eds.) (1990) Analogue IC Design - Current-Mode Approach
---

# Part 2 — Translinear Principle와 전류-모드 (Current-Mode) 회로

지수 I-V 소자(BJT 또는 서브임계 MOSFET)를 닫힌 루프로 배치하면 곱셈/나눗셈/지수/로그가 자동 계산된다는 원리. 모든 아날로그 곱셈기·승산기의 수학적 기반.

---

## 1. Gilbert (1968) — Precise Four-Quadrant Multiplier

### 핵심 회로 구조

두 차동 쌍(differential pair)을 cross-coupled로 배치, tail current로 두 입력을 곱함:

```
               V_y+ ─┐  ┌─ V_y−
                    Q1  Q2
       V_x+ ─┐    /     \    ┌─ V_x−
            Q3   Q5     Q6   Q4
            └─Vy+─┘     └─Vy−┘
                  │           │
                I_tail (V_x scaled)
```

소신호 영역에서 출력 차동 전류:
```
  ΔI_out = (I_tail · V_x · V_y) / (2 V_T²)
```

### 4-quadrant의 의미

V_x, V_y가 **양/음 모두** 가능 (4 사분면). 단일 트랜지스터 곱셈기는 한 사분면만, Gilbert cell이 처음으로 부호 있는 곱셈을 한 회로로 실현.

### 정밀도 한계

- **V_T 매칭**: 트랜지스터 mismatch가 곱셈 오차 → typical INL 0.1-0.5%
- **Tail current 정확도**: I_tail 잡음이 직접 출력에 곱해짐
- **Bandwidth**: ns-급 응답 (1968년 BJT 기준)

### 우리 formulation에서의 사용

Layer C `S(x, y*)·δW`의 outer product 계산 = Gilbert cell strip per 셀. PPCA의 Phase 6 (consolidation Gilbert) 가 직접 이것.

### 참조
- Gilbert, *A precise four-quadrant multiplier with subnanosecond response*, IEEE JSSC, SC-3 (1968), pp. 365-373 — 회로 원전.

---

## 2. Gilbert (1975) — Translinear Circuits: A Proposed Classification

### Translinear Principle (정식 진술)

지수 I-V 소자들의 V_BE (또는 V_GS) 합이 0인 폐 루프에서:
```
  ∏_{k ∈ CW} I_k = ∏_{k ∈ CCW} I_k
```
- CW = clockwise traversal
- CCW = counter-clockwise traversal

V_BE = V_T · ln(I/I_S) → Σ V_BE = 0 → Σ ln(I/I_S) = 0 → ∏ I = const.

### 4가지 기본 패턴

1. **Squarer** (제곱): I_out = I_in² / I_ref
2. **Geometric mean** (기하 평균): I_out = √(I_1 · I_2)
3. **Vector magnitude**: I_out = √(I_x² + I_y²)
4. **Multiplier-Divider**: I_out = I_x · I_y / I_ref

각각 4-6 트랜지스터로 구현. 회로 면적·전력 매우 작음.

### Gilbert cell as translinear special case

Gilbert cell도 translinear loop의 한 인스턴스 — 두 차동 쌍의 cross-coupling이 곱셈/나눗셈을 동시에 수행.

### 우리 formulation EML 연산자와의 관계

Translinear 대수: `log(xy) = log(x) + log(y)`, `log(x/y) = log(x) − log(y)`.
EML 연산자: `eml(x, y) = exp(x) − ln(y)` — 이게 translinear 대수의 한 atomic 연산.

→ EML 가족 정리에서 살펴본 "EML 연산자가 모든 elementary function을 합성한다"는 주장이, translinear principle 위에서 회로로 직접 실현 가능.

### 참조
- Gilbert, *Translinear Circuits: A Proposed Classification*, Electronics Letters, 11 (1975), pp. 14-16 — 원리 정전.
- Gilbert, *Translinear Circuits: An Historical Overview*, Analog Integrated Circuits and Signal Processing, 9 (1996), pp. 95-118 — primer (가장 읽기 쉬움).

---

## 3. Toumazou, Lidgey, Haigh (1990) — *Analogue IC Design: The Current-Mode Approach*

### 전류-모드 (current-mode) 패러다임

기존 voltage-mode 회로에 비해:
- **No internal node voltages restrict bandwidth** — 전류 합산은 즉시
- **High dynamic range** — 전류는 선형 범위가 넓음 (V는 V_DD 한계)
- **Inherent simplicity** for nonlinear ops — 트랜지스터 I-V는 본질적으로 비선형, 전류 모드가 자연스러움

### 핵심 빌딩블록

1. **Current Mirror** — 입력 전류를 다른 노드로 복사 (정확도 ↑ via cascode)
2. **Current Conveyor** (CCII) — 표준 회로 셀, 모든 current-mode 함수 합성
3. **Translinear cells** — Gilbert cell + 변형들
4. **Log/Antilog amplifiers** — exp/log 직접 구현 (subthreshold MOSFET 또는 BJT)

### Gm-C Filters

전류-모드 Filter:
```
  H(s) = G_m / (s C + G_m / Q)
```
G_m을 가변 (bias-controlled), C를 면적-효율적 → MHz-GHz tunable filters.

### 우리 formulation과의 연결

| 우리 회로 슬롯 | Current-mode 빌딩블록 |
|---|---|
| Encoder E (current-mode option) | Current mirror at input |
| W·v (Kirchhoff) | Current summation node |
| N (subthreshold) | Diode-connected MOSFET |
| S (Gaussian score) | Log + squarer + exp translinear chain |
| δG outer product | Gilbert cell |
| Gm-C integrator | LPF for ΣΔ-style decoding |

거의 모든 PPCA 슬롯이 current-mode 빌딩블록의 직접 조합.

### 참조
- Toumazou, Lidgey, Haigh (eds.), *Analogue IC Design: The Current-Mode Approach*, Peter Peregrinus / IET (1990) — current-mode 정전.

---

## 통합 — Translinear 대수가 우리 formulation에 주는 것

### 1. 비선형 연산자 자동 합성

translinear loop만 만들면:
- 곱셈 / 나눗셈
- 제곱근, 제곱
- 지수, 로그
- 사인, 코사인 (Padé 근사 + translinear)

→ Layer C의 거의 모든 비선형 operator가 4-8 트랜지스터로 가능.

### 2. EML 연산자의 회로 실현

EML(x, y) = exp(x) − ln(y) ↔ translinear loop 한 개:
- exp(x): subthreshold MOSFET 한 개 (V_GS = x → I = exp(x/nV_T))
- ln(y): diode-connected MOSFET (I = y → V = nV_T · ln(y))
- 두 V를 KVL로 합산 → exp(x) − ln(y) 전압

→ 우리 alternative catalog의 "log-domain" Slot N 후보가 정확히 이 회로.

### 3. 4-quadrant 곱셈 (Gilbert)

Outer product `S · a_i · b_j`는 4-quadrant 곱셈 — `S` 부호 + `a, b` 부호 모두 가능. Single Gilbert cell per (i,j) 쌍.

### 4. Power 효율

Translinear 회로는 모두 nA-μA 전류로 동작 가능 (서브임계 영역). 우리 PPCA의 "semi-passive" 목표와 호환.

---

## Mead/Vittoz/Gilbert/Toumazou의 세대 흐름

```
  1968  Gilbert cell        — 첫 4Q 곱셈기, 1 회로
  1975  Translinear principle — 일반 원리 정식화
  1983  Vittoz lateral BJT   — CMOS에서 BJT 회로 가능
  1989  Mead Analog VLSI     — 신경계 모방의 종합 패러다임
  1990  Toumazou current-mode — 산업 회로 설계 표준화
  2002  Liu Analog VLSI      — spike + STDP + AER 통합
```

다음 노트: Part 2 — Volterra/Wiener nonlinear 시스템 이론 (Rugh, Schetzen).
