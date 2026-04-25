# 그래프 보고서 (Graph Report) - ./raw  (2026-04-25)

## 코퍼스 점검 (Corpus Check)
- 42 파일 · 약 76,000 단어
- 노드 564개 · 엣지 1365개 · 커뮤니티 13개 · AMBIGUOUS 0 유지

## 이번 업데이트 — FPGA 구현 가능성 분석

Step 9 verification protocol을 FPGA primitive에 직접 적용. 결과:

### 7개 슬롯 멤버십 결과
- **Slot 1 W (DSP slice)**: 𝒞_W 조건 (iv) **FAIL** — Kirchhoff sum 아닌 digital MAC
- **Slot 2 N (LUT)**: 𝒞_N 조건 (v) **FAIL** — transistor I-V 아닌 lookup
- **Slot 3 S (LUT/arith)**: 형식 PASS, 의미 △
- **Slot 4 E (Fabric+ADC)**: bypass-digitalization 조건 **FAIL** (ADC 사용)
- **Slot 5 Update (BRAM/Flash)**: BRAM 휘발성 △, 외부 Flash로 보완 가능
- **Slot 6 Batch (clock)**: 형식 PASS, but 시정수가 device 아닌 hyperparameter
- **Slot 7 Power**: ~25W FPGA → semi-passive **FAIL**

**결론**: 7개 중 4개 명확히 FAIL — strict한 의미로 FPGA는 𝒮 ∈ ℳ_PPCA의 멤버 **아님**.

### 4개 가능 모드

| 모드 | FPGA 역할 | 살아남는 주장 |
|---|---|---|
| **M1 Strict Analog** | 사용 안 함 | 모든 주장 (canonical PPCA) |
| **M2 Behavioral Twin** | 모든 슬롯 | T1', T4' (디지털 의미) — Stage 3a 가속화 용 |
| **M3 Hybrid** | RNG, snapshot, archive, debug | T1'-T4' 부분, T5' 대부분 — **권장 prototyping** |
| **M4 Control-Only** | snapshot trigger, flash controller | 거의 모든 주장 — production 적합 |

### 핵심 새 발견

`fpga_analysis_new_class_distinction_analog_vs_digital_PPCA` — **`ℳ_PPCA^analog`와 `ℳ_PPCA^digital`이 다른 물리 카테고리의 instance family**. 같은 수학(T1', T3', T4'는 양쪽 적용)이지만 다른 family — T5'와 semi-passive는 family-specific. 이로써 향후 연구의 새 차원: "어느 family의 PPCA를 만드는가"가 명시적 설계 결정.

### 권장 — M3 Hybrid 구체 설계

**Analog daughterboard**:
- W: Memristor crossbar IC 또는 Switched-cap array
- N: Discrete MOSFET array (kink) 또는 op-amp
- S: Differential amp + squarer + subthreshold transistor
- δW: Gilbert cell IC (e.g., AD633)

**FPGA backend**:
- Counter-RNG (LFSR/Philox)
- Snapshot trigger state machine
- Flash controller (SPI)
- Sensor readout digitization (모니터링)
- Host PC 통신

**예산**: 1-2k$ FPGA 보드 (Versal VCK190 등) + 50-200$ analog frontend.

## 갓 노드 (Top 10)

| Rank | Node | Edges |
|---|---|---|
| 1 | EGGROLL-PPCA Architecture | **61** (+5) |
| 2 | Subthreshold Exponential Regime | 30 |
| 3 | EGGROLL Algorithm | 27 |
| 4 | Theorem 4 (Convergence) | 26 |
| 5 | Formulation Layer D | 25 |
| 6 | Theorem 3 (Switched Volterra) | 25 |
| 7 | Theorem 5 (Noise Tolerance) | 23 |
| 8 | **FPGA Implementation Analysis** | **23** ← **NEW** |
| 9 | Physics Correspondence Table | 22 |
| 10 | Pair 7 (Kink ↔ ReLU Polytope) | 21 |

PPCA 56→61 (+5) — FPGA 분석이 PPCA의 "어떤 부분이 본질적인가"를 슬롯별로 명료하게 함.

### 구조적 변화

| 지표 | 이전 | 이후 | Δ |
|---|---|---|---|
| 노드 | 542 | **564** | +22 |
| 엣지 | 1310 | **1365** | +55 |
| PPCA main 차수 | 56 | **61** | +5 |

### 다음 작업 후보

1. **M3 Hybrid 보드 구체 설계 노트** — 부품 BoM, 회로 schematic 수준 설계
2. **M2 Behavioral Twin SystemVerilog 구현** — 알고리즘 검증 가속화
3. **`ℳ_PPCA^digital` family 별도 형식화** — Layer C/D/S의 디지털 family 버전 정리
