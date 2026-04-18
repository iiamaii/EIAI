# 그래프 보고서 (Graph Report) - ./raw  (2026-04-18)

## 코퍼스 점검 (Corpus Check)
- 코퍼스 규모 약 5,993 단어 — 단일 컨텍스트 윈도우(context window)에 들어갑니다. 그래프가 꼭 필요하지 않을 수 있습니다.

## 요약 (Summary)
- 노드 70개 · 엣지(edge) 68개 · 커뮤니티(community) 11개 검출
- 추출 결과: 93% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED 엣지 5개 (평균 신뢰도 0.73)
- 토큰(token) 비용: 입력 95,000 · 출력 8,500

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Evolution Strategies & Baselines|진화 전략(Evolution Strategies) 및 베이스라인(Baselines)]]
- [[_COMMUNITY_EML Operator & Symbolic Foundations|EML 연산자(EML Operator) 및 기호적(symbolic) 기반]]
- [[_COMMUNITY_Neuromorphic Hardware & Plasticity|뉴로모픽(Neuromorphic) 하드웨어와 가소성(Plasticity)]]
- [[_COMMUNITY_NS-RAM Cell Architecture|NS-RAM 셀(Cell) 아키텍처(Architecture)]]
- [[_COMMUNITY_EGGROLL (Markdown Notes)|EGGROLL (마크다운 노트)]]
- [[_COMMUNITY_Symbolic Regression Training|기호 회귀(Symbolic Regression) 학습]]
- [[_COMMUNITY_MOSFET Device Physics|MOSFET 소자 물리(Device Physics)]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory) 및 NTK]]
- [[_COMMUNITY_Low-Rank Tree Structures|저랭크(Low-Rank) 트리 구조]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안 ES (Matrix Gaussian ES)]]
- [[_COMMUNITY_Rank Convergence Proofs|랭크 수렴(Rank Convergence) 증명]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `EGGROLL Algorithm` - 엣지 13개
2. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 12개
3. `NS-RAM Cell (Neuro-Synaptic RAM)` - 엣지 8개
4. `Symbolic Regression via EML Trees` - 엣지 5개
5. `EGGROLL (Korean Translation)` - 엣지 4개
6. `Artificial Neural Network (ANN)` - 엣지 4개
7. `Electronic Synapse (Plasticity)` - 엣지 4개
8. `Long-Term Plasticity (Charge-Trapping)` - 엣지 4개
9. `Gaussian Approximate Score Function` - 엣지 3개
10. `EGG (Evolved Generative GRU, int8 RNN)` - 엣지 3개

## 놀라운 연결들 (Surprising Connections, 미처 몰랐을 관계)
- `EGGROLL (Korean Translation)` --semantically_similar_to--> `EGGROLL Algorithm`  [INFERRED] [의미적 유사성(semantically similar)]
  raw/Evolution Strategies at the Hyperscale.md → raw/Evolution Strategies at the Hyperscale.pdf
- `Symbolic Regression via EML Trees` --semantically_similar_to--> `EGGROLL Algorithm`  [INFERRED] [의미적 유사성]
  raw/All elementary functions from a single operator.pdf → raw/Evolution Strategies at the Hyperscale.pdf
- `NS-RAM Cell (Neuro-Synaptic RAM)` --semantically_similar_to--> `EGG (Evolved Generative GRU, int8 RNN)`  [INFERRED] [의미적 유사성]
  raw/Synaptic and neural behaviours.pdf → raw/Evolution Strategies at the Hyperscale.pdf
- `Binary Tree Grammar S->1|eml(S,S)` --semantically_similar_to--> `Rank-r Perturbation Structure`  [INFERRED] [의미적 유사성]
  raw/All elementary functions from a single operator.pdf → raw/Evolution Strategies at the Hyperscale.pdf
- `NAND Gate (Sheffer Stroke)` --semantically_similar_to--> `CMOS MOSFET (Bulk-Silicon)`  [INFERRED] [의미적 유사성]
  raw/All elementary functions from a single operator.pdf → raw/Synaptic and neural behaviours.pdf

## 하이퍼엣지 (Hyperedges, 그룹 관계)
- **EGGROLL Low-Rank Decomposition Pipeline** — evolution_strategies_at_the_hyperscale_pdf_evolution_strategies, evolution_strategies_at_the_hyperscale_pdf_lora, evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation, evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation, evolution_strategies_at_the_hyperscale_pdf_eggroll [EXTRACTED 0.95]
- **NS-RAM Neuro-Synaptic Dual-Use Pattern** — synaptic_and_neural_behaviours_pdf_mosfet, synaptic_and_neural_behaviours_pdf_punch_through, synaptic_and_neural_behaviours_pdf_floating_bulk, synaptic_and_neural_behaviours_pdf_bulk_bias_control_transistor, synaptic_and_neural_behaviours_pdf_ns_ram_cell [EXTRACTED 0.90]
- **EML Universality / Sheffer-Type Reduction Pattern** — all_elementary_functions_from_a_single_operator_pdf_eml_operator, all_elementary_functions_from_a_single_operator_pdf_edl_operator, all_elementary_functions_from_a_single_operator_pdf_ternary_operator, all_elementary_functions_from_a_single_operator_pdf_nand_gate [EXTRACTED 0.85]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "진화 전략(Evolution Strategies) 및 베이스라인(Baselines)"
응집도(Cohesion): 0.17
노드 (12개): Central Limit Theorem (justification), Counter-Based Deterministic RNG (Salmon 2011), EGGROLL Algorithm, Evolution Strategies (ES), Gaussian Approximate Score Function, GRPO (Shao et al. 2024), LoRA (Hu et al. 2022), MeZO (Malladi et al. 2023) (+4 more)

### 커뮤니티 1 - "EML 연산자(EML Operator) 및 기호적 기반"
응집도: 0.17
노드 (12개): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, Rationale: Complex Domain Required Internally, Rationale: Single Primitive Aesthetic/Pedagogy Value (+4 more)

### 커뮤니티 2 - "뉴로모픽(Neuromorphic) 하드웨어와 가소성(Plasticity)"
응집도: 0.18
노드 (11개): Artificial Neural Network (ANN), Embedded Flash Memory (Reference), Hot-Carrier (Electron/Hole) Injection, Intel Loihi 2 (Orchard et al. 2021), Long-Term Plasticity (Charge-Trapping), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024), Rationale: Charge-Trapping Explains Long-Term Retention (+3 more)

### 커뮤니티 3 - "NS-RAM 셀(Cell) 아키텍처(Architecture)"
응집도: 0.22
노드 (9개): EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Bulk Bias Control Transistor (2-Transistor Cell), Memristor (Alternative Platform), NS-RAM Cell (Neuro-Synaptic RAM), Phase-Change Memory (PCM), Rationale: 2-Transistor for Tunability and Repeatability, Rationale: CMOS Compatibility/No Alien Materials (+1 more)

### 커뮤니티 4 - "EGGROLL (마크다운 노트)"
응집도: 0.33
노드 (6개): EGGROLL (Korean Translation), Evolution Strategies (ES), LoRA (Low-Rank Adaptation), Low-Rank Perturbation E=AB^T/sqrt(r), Rationale: Arithmetic Intensity Improvement, Score Function Gradient Estimation

### 커뮤니티 5 - "기호 회귀(Symbolic Regression) 학습"
응집도: 0.4
노드 (5개): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees

### 커뮤니티 6 - "MOSFET 소자 물리(Device Physics)"
응집도: 0.4
노드 (5개): NAND Gate (Sheffer Stroke), Floating-Bulk Configuration, Kink Effect (Boudou & Doyle 1987), CMOS MOSFET (Bulk-Silicon), Punch-Through Impact Ionization

### 커뮤니티 7 - "수렴 이론(Convergence Theory) 및 NTK"
응집도: 0.67
노드 (3개): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### 커뮤니티 8 - "저랭크(Low-Rank) 트리 구조"
응집도: 0.67
노드 (3개): Binary Tree Grammar S->1|eml(S,S), Rank-r Perturbation Structure, Rationale: Low-rank Structure for High Arithmetic Intensity

### 커뮤니티 9 - "행렬 가우시안 ES (Matrix Gaussian ES)"
응집도: 1.0
노드 (2개): Gaussian ES, Matrix Gaussian Distribution

### 커뮤니티 10 - "랭크 수렴(Rank Convergence) 증명"
응집도: 1.0
노드 (2개): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

## 지식 공백 (Knowledge Gaps)
- **고립 노드 48개:** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+43 more)
  연결이 1개 이하 — 누락된 엣지이거나 문서화되지 않은 컴포넌트(component)일 수 있습니다.
- **얇은 커뮤니티 `Matrix Gaussian ES`** (노드 2개): `Gaussian ES`, `Matrix Gaussian Distribution`
  의미 있는 클러스터(cluster)로 보기엔 너무 작음 — 노이즈(noise)이거나 추가 연결 추출이 필요합니다.
- **얇은 커뮤니티 `Rank Convergence Proofs`** (노드 2개): `Edgeworth Expansion (Bhattacharya & Ranga Rao)`, `EGGROLL Rank Convergence O(r^-1)`
  의미 있는 클러스터로 보기엔 너무 작음 — 노이즈이거나 추가 연결 추출이 필요합니다.

## 추천 질문 (Suggested Questions)
_이 그래프가 고유하게 답할 수 있는 질문들:_

- **왜 `EGGROLL Algorithm`이 `Evolution Strategies & Baselines`를 `Low-Rank Tree Structures`, `NS-RAM Cell Architecture`, `EGGROLL (Markdown Notes)`, `Symbolic Regression Training`와 이어주는가?**
  _높은 매개 중심성(betweenness centrality) 0.490 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `NS-RAM Cell (Neuro-Synaptic RAM)`이 `NS-RAM Cell Architecture`를 `Neuromorphic Hardware & Plasticity`, `MOSFET Device Physics`와 이어주는가?**
  _높은 매개 중심성 0.418 — 커뮤니티 간 교량 노드._
- **왜 `EML Operator eml(x,y)=exp(x)-ln(y)`가 `EML Operator & Symbolic Foundations`를 `Low-Rank Tree Structures`, `MOSFET Device Physics`와 이어주는가?**
  _높은 매개 중심성 0.276 — 커뮤니티 간 교량 노드._
- **`EGGROLL Algorithm`과 관련된 2개의 추론(INFERRED) 관계 (예: `EGGROLL (Korean Translation)` 및 `Symbolic Regression via EML Trees`와의 연결)가 실제로 맞는가?**
  _`EGGROLL Algorithm`에는 INFERRED 엣지가 2개 있음 — 모델이 추론한 연결이라 검증이 필요._
- **`LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`은 시스템의 나머지와 어떻게 연결되는가?**
  _약연결(weakly-connected) 노드 48개 검출 — 문서화 공백이거나 누락된 엣지일 가능성._
