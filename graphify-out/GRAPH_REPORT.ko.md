# 그래프 보고서 (Graph Report) - ./raw  (2026-04-26)

## 코퍼스 점검 (Corpus Check)
- 33 파일 · 약 70,000 단어 (PDF 9개 제거 후)
- 노드 508개 · 엣지 1275개 · 커뮤니티 13개 · AMBIGUOUS 0 유지

## 이번 정리 작업 — Memristor/Neuromorphic 무관 자료 9개 PDF 제거

기준: (a) 멤리스터/뉴로모픽과 무관 AND (b) PPCA에 수학·이론 직관 제공 안 함

### 제거된 9개 PDF

| 파일 | 사유 |
|---|---|
| `Learning with Exact Invariances in Polynomial Time` | KAN과 disjoint_from 판정됨 |
| `A Primer on Quantum Machine Learning` | 양자 ML, 다른 물리 카테고리 |
| `Conditional Memory via Scalable Lookup` | LLM sparsity, PPCA 무관 |
| `Learning to Discover at Test Time` | TTT-Discover, LeWorldModel과 disjoint |
| `LeWorldModel` | JEPA world model, 다른 패러다임 |
| `Turboquant`, `QJL`, `PolarQuant...` | KV cache quantization, PPCA 무관 |
| `A Geometric Explanation of OOD Detection Paradox` | OOD detection, PPCA 무관 |
| (BitDance는 manifest에 원래 없었음 — sensitive 스킵) | — |

### 제거 후 그래프 정리

- **56개 ghost node 제거** (9개 파일에서 추출되었던 모든 노드)
- 그래프: 564 → **508 nodes** (−56), 1365 → **1275 edges** (−90)
- 커뮤니티: 15 → **13** (작은 cluster 흡수)
- AMBIGUOUS 0 유지

### 보존된 14개 PDF (KEEP)

**핵심 뉴로모픽**:
- `Synaptic and neural behaviours` (NS-RAM, kink, charge-trap)
- `CMOS-integrated organic neuromorphic imagers`
- `A neuromorphic processor with on-chip learning for beyond-CMOS` (TEXEL)
- `Analog in-memory computing attention` (gain cell crossbar)

**EGGROLL 알고리즘 + 수학적 기반**:
- `Evolution Strategies at the Hyperscale` (.pdf + .md)
- `All elementary functions from a single operator` (EML/log-domain)
- `Binarized Neural Networks` (composition theorem 특수화)
- `A Practitioner's Guide to KAN` (KAT, learnable edge ↔ EML)

**Stage 2 학습 규칙 대안 (이론 직관 제공)**:
- `NOPROP` (layer-local 학습)
- `HEBBIAN LEARNING WITH GLOBAL DIRECTION`

## Top 10 갓 노드

| Rank | Node | Edges (Δ) |
|---|---|---|
| 1 | EGGROLL-PPCA Architecture | 59 (−2) |
| 2 | Subthreshold Exponential Regime | 29 (−1) |
| 3 | EGGROLL Algorithm | 27 |
| 4 | Theorem 4 (Convergence) | 26 |
| 5 | Formulation Layer D | 25 |
| 6 | Theorem 3 (Switched Volterra) | 25 |
| 7 | Theorem 5 (Noise Tolerance) | 23 |
| 8 | FPGA Implementation Analysis | 23 |
| 9 | Physics Correspondence Table | 22 |
| 10 | Pair 7 (Kink ↔ ReLU Polytope) | 21 |

PPCA가 61→59로 −2 — 제거된 KV-quant 가족·world model이 카탈로그에서 부분적으로 제거되며 일부 약한 INFERRED edge가 사라진 결과. 핵심 구조는 **모두 유지**.

## 13개 커뮤니티 — 정리 후 더 응집

PDF 제거가 코어 메시지를 강화:
- C0 Three-Tier Memory + Charge-Trap (82n)
- C1 EGGROLL-PPCA Architecture Hub (78n)
- **C2 FPGA + Alternative Catalog + Class Generalization (68n)** — 메타 아키텍처 layer
- C3 Layer S + T4-T5 + EGGROLL Convergence (63n)
- C4-C7: Layer 별 정리 + 이론 사슬
- C8-C11: 도메인별 (TEXEL, Stateful Field, KAN, Symbolic Regression)

이전에 있던 KV-Cache Quantization, Geometric OOD, Test-Time Discovery + World Models 같은 **PPCA 외곽 cluster들이 모두 정리됨**. 그래프가 PPCA에 더 집중된 형태가 됨.

## 추가 발견 — `raw/simulations/eggroll_ppca/` 디렉토리

이번 점검에서 사용자가 별도로 추가한 Stage 3a simulation 작업 발견:
- 코드: `ppca_sim.py`, `ppca_physical_sim.py`
- 문서: 6개 .md (README, ANALYSIS, EXPLANATION_KO, RUN_NOTES, VISUAL_SUMMARY, PHYSICAL_FUNCTIONAL_SIMULATOR)
- 결과: 4개 .svg (rank_sweep, distribution_shift, feasibility_summary, noise_sweep)

또한 새 survey 노트 3개:
- `neuromorphic_survey_2025_2026.md`
- `latest_neuromorphic_research_chunks_2026-04-26.md`
- `analog_physical_neural_network_major_cases_2026-04-26.md`

이들은 PPCA에 직접 관련이므로 보존됨. 향후 `--update`로 그래프에 통합 가능 (이번 정리 작업에서는 제거에만 집중).
