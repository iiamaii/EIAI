# 그래프 보고서 (Graph Report) - ./raw  (2026-04-25)

## 코퍼스 점검 (Corpus Check)
- 40 파일 · 약 66,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 517개 · 엣지(edge) 1243개 · 커뮤니티(community) 17개
- 추출 결과: 40% EXTRACTED · 8% INFERRED · **0% AMBIGUOUS** · INFERRED 엣지 94개 (평균 신뢰도 0.81)

## 이번 업데이트 — 대안 후보 카탈로그 (Slot-level Alternative Candidates)

전체 PPCA 흐름은 그대로 유지하면서, 7개 구성요소 슬롯 각각에 대한 대안 물리 구현을 탐색:

| 슬롯 | Canonical | 대안 후보 (이번 카탈로그) |
|---|---|---|
| **W (Linear Combiner)** | Memristor crossbar | PCM, Gain Cell, MRAM, Photonic MZI |
| **N (Nonlinearity)** | Kink MOSFET | LIF Neuron, Schottky Knee, OpAmp tanh, CMOS Inverter |
| **S (Score)** | Subthreshold exp | Photon Counting, Race Logic, PWM Integrator |
| **E (Encoding)** | Bit-plane / Pulse-density / Binarized | ΣΔ, PWM, Phase-shift, Current-mode |
| **Update (Slow Memory)** | Charge-trap | VCMA-MRAM, FeRAM, CBRAM |
| **Batch Processing** | Floating-bulk two-timescale | SC integrator, Event-driven, Photonic delay loop |
| **Power (Semi-passive)** | Input signal | PV, Thermal, RF, Biopotential |

### 4개 응용 묶음 (cross-component bundle)

- **Biomedical Implant**: Current-mode E + STT-MRAM W + LIF N + Schmidt-trigger S + VCMA-MRAM update + Event-driven batch + Biofuel/Thermal power. 예상 power < 1 μW.
- **Always-on Keyword**: PWM E + Gain cell W + Schottky N + Charge-packet S + Flash update + SC integrator batch + PV. 예상 power ~10 μW.
- **RF Backscatter**: Phase-shift E + Switched-cap W + CMOS Inverter N + Race-logic S + MRAM update + Photonic delay batch + RF harvesting. 예상 power ~100 nW.
- **High-Performance LLM** (canonical PPCA의 specialization): Bit-plane E + PCM W + Kink N + Subthreshold-exp S + Charge-trap update + Floating-bulk batch + 유선 전원.

### 핵심 주장 (그래프에 명시됨)

1. **`claim_template_invariance`** — PPCA 6-phase + 3-tier + forward-only + two-timescale 골격이 슬롯 swap 하에서 보존됨. `preserves` 엣지로 PPCA main에 연결.
2. **`claim_canonical_is_specialization`** — 현재 canonical PPCA는 application-D (high-performance LLM) 스펙에 최적화된 한 instance. 다른 슬롯 조합으로 다른 application family 진입 가능.

## 커뮤니티 허브 (17개)

이전과 거의 동일하지만 **C7 ("Alternative Candidate Catalog + In-Memory Attention")** 신설 — 26개의 alt-catalog 노드가 In-Memory Attention paper 본문 노드들과 **자연스럽게 결합**. In-Memory Attention 논문의 gain cell·charge-to-pulse hardsigmoid 등이 본 카탈로그의 대안 W·N 후보를 이미 부분 검증한 셈.

## 갓 노드 (Top 10)

| Rank | Node | Edges |
|---|---|---|
| 1 | EGGROLL-PPCA Architecture | 53 (+3) |
| 2 | Subthreshold Exponential Regime | 30 |
| 3 | EGGROLL Algorithm | 27 |
| 4 | Formulation Layer D | 25 |
| 5 | Theorem 4 (Learning Convergence) | 25 |
| 6 | Theorem 3 (Switched Volterra) | 24 |
| 7 | Physics Correspondence Table | 22 |
| 8 | Theorem 5 (Noise Tolerance) | 22 |
| 9 | Pair 7 (Kink ↔ ReLU Polytope) | 21 |
| 10 | Log-Domain / Translinear | 21 |

PPCA가 50→53으로 +3 — 7개 슬롯 노드와 직접 또는 간접으로 연결됨.

### 구조적 의미

대안 카탈로그가 그래프에 들어오면서 **PPCA가 "특정 설계"가 아닌 "설계 가족(design family)의 대표 sample"**으로 재위치됨. 같은 수학 (Layer C/D/S, 5개 이론 사슬)이 다양한 물리 구현에 적용 가능함을 그래프가 인증.

### 지표 변화

| 지표 | 이전 | 이후 | Δ |
|---|---|---|---|
| 노드 | 485 | **517** | +32 |
| 엣지 | 1197 | **1243** | +46 |
| 커뮤니티 | 13 | **17** | +4 (작은 thin community 분리) |
| AMBIGUOUS | 0 | **0** | 유지 |
| PPCA main 차수 | 50 | **53** | +3 |

### 다음 작업 후보

1. **Application bundle별 정량 simulation** — 4개 응용 (biomedical, keyword, RF, LLM)에 대해 Stage 3a functional simulation을 따로 돌려 power/latency/accuracy 비교
2. **Slot 호환성 매트릭스 검증** — 노트 §"구성요소 간 호환성 매트릭스"의 ◎/○/△/× 판정을 SPICE-수준에서 검증
3. **Photonic backend 별도 노트** — MZI mesh + photodiode + photon-counting의 완전 photonic PPCA를 별도 형식화
4. **저전력 극단 케이스** — Biomedical implant 묶음의 < 1 μW 달성을 위한 device choice 정밀화
