# 그래프 보고서 (Graph Report) - ./raw  (2026-04-26)

## 코퍼스 점검
- 44 파일 · 약 100,000 단어 (이번 update에서 +30k)
- 노드 641개 · 엣지 1540개 · 커뮤니티 17개 · AMBIGUOUS 0 유지

## 이번 update 요약

11개 신규 파일 (사용자가 별도 작성) 통합:

### Code (2)
- `raw/simulations/eggroll_ppca/ppca_sim.py` — NumPy behavioral twin
- `raw/simulations/eggroll_ppca/ppca_physical_sim.py` — physical functional simulator

AST 추출: **73 nodes, 167 edges** (함수·클래스 시그니처).

### Documents (9)
- 3개 2026 neuromorphic 서베이/연구 chunks
- 6개 Stage 3a 시뮬레이션 문서 (README, ANALYSIS, EXPLANATION_KO, RUN_NOTES, VISUAL_SUMMARY, PHYSICAL_FUNCTIONAL_SIMULATOR)

Semantic 추출: **60 nodes, 120 edges, 2 hyperedges**.

### 핵심 새 발견 — 두 시뮬레이터의 결과가 충돌

서브에이전트가 발견한 것: 
- **Behavioral Twin** (`ppca_sim.py`) — Layer S T5'의 cross-tile correlation 영향이 **3.18×** degradation 보고
- **Physical Functional Simulator** (`ppca_physical_sim.py`) — 같은 cross-tile correlation 영향이 거의 0 (0.008572 → 0.008569)

추정 원인 4가지: (1) 작은 target voltages, (2) score saturation, (3) write compression, (4) normalized voltage encoding. → `proxy_too_mild` 노드로 `contradicts` 엣지 명시.

이는 **Behavioral Twin이 실제 물리 효과를 underestimate하는 가능성**을 그래프가 자체 검증한 사례 — Layer S T5' 예측 검증의 첫 실증 발견.

## Top 10 갓 노드

| Rank | Node | Edges (Δ) |
|---|---|---|
| 1 | EGGROLL-PPCA Architecture | 61 (+2) |
| 2 | **Theorem 4 (Convergence)** | **30** (+4 — sim 검증으로 강화) |
| 3 | EGGROLL Algorithm | 29 (+2) |
| 4 | Subthreshold Exponential | 29 |
| 5 | **Theorem 5 (Noise Tolerance)** | **26** (+3 — sim 결과로 정량화) |
| 6 | Formulation Layer D | 25 |
| 7 | Theorem 3 (Switched Volterra) | 25 |
| 8 | FPGA Implementation Analysis | 23 |
| 9 | Physics Correspondence Table | 22 |
| 10 | Rank-r Perturbation Structure | 21 |

T4·T5가 +4·+3 — **Stage 3a simulation이 정리들에 정량적 검증 엣지를 다수 추가**.

## 새 커뮤니티 구조 (17개)

| C# | 이름 | 신규 |
|---|---|---|
| 0 | Alternative Catalog + Class Generalization Hub | |
| 1 | **Layer S + EGGROLL Convergence + Stage 3a Sim Validation** | sim 10 |
| 3 | **Three-Tier Memory + 2026 Neuromorphic Survey** | survey 17 |
| 4 | **PPCA Physical Functional Simulator** | sim code |
| 6 | **Beyond-CMOS TEXEL + Latest Neuromorphic Research** | survey |
| 7 | **PPCA NumPy Behavioral Twin** | sim 18 |
| 10 | **PPCA sim helper code** (ppca_sim.py functions) | sim code |
| 12 | **Analog Physical NN Major Cases (2026)** | survey |

8개 커뮤니티가 새 콘텐츠를 흡수 — 그래프가 이론↔실험 두 축 모두에서 두꺼워짐.

## Token reduction benchmark

```
Corpus:          100,000 words → ~133,333 tokens (naive)
Graph:           641 nodes, 1,540 edges
Avg query cost:  ~26,906 tokens
Reduction:       5.0x fewer tokens per query
```

(corpus가 100k words로 커지면서 효율은 다소 감소 — 더 큰 코퍼스는 일반적 패턴.)

## 지표 변화

| 지표 | 이전 | 이후 |
|---|---|---|
| 노드 | 508 | **641** (+133) |
| 엣지 | 1275 | **1540** (+265) |
| 커뮤니티 | 13 | **17** (+4 신규) |
| AMBIGUOUS | 0 | **0** 유지 |
| PPCA main 차수 | 59 | **61** |
| Theorem 4 | 26 | **30** |
| Theorem 5 | 23 | **26** |

## 추천 다음 작업

1. **Behavioral vs Physical 시뮬 충돌 분석** — 서브에이전트가 발견한 cross-tile correlation 결과 차이 (3.18× vs 0×)를 정밀 분석. Physical sim에서 4개 추정 원인을 하나씩 검증.
2. **2026 neuromorphic 서베이 통합 정리** — 3개 서베이 노트가 가져온 새 device 후보들을 alternative catalog의 alt_W, alt_N 슬롯에 추가
3. **Stage 3b SPICE 시뮬레이션 시작** — Behavioral twin이 underestimate하는 효과를 SPICE에서 검증
