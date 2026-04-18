# 그래프 보고서 (Graph Report) - ./raw  (2026-04-18)

## 코퍼스 점검 (Corpus Check)
- 코퍼스 규모 약 18,082 단어 — 단일 컨텍스트 윈도우(context window)에 들어갑니다. 그래프가 꼭 필요하지 않을 수 있습니다.

## 요약 (Summary)
- 노드 159개 · 엣지(edge) 176개 · 커뮤니티(community) 15개 검출
- 추출 결과: 73% EXTRACTED · 26% INFERRED · 1% AMBIGUOUS · INFERRED 엣지 45개 (평균 신뢰도 0.77)
- 토큰(token) 비용: 입력 42,000 · 출력 11,500

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Neural Representation & Geometry|신경 표현(Neural Representation)과 기하(Geometry)]]
- [[_COMMUNITY_EML Operator & Symbolic Foundations|EML 연산자(EML Operator)와 기호적(symbolic) 기반]]
- [[_COMMUNITY_NS-RAM & Neuromorphic Hardware|NS-RAM과 뉴로모픽(Neuromorphic) 하드웨어]]
- [[_COMMUNITY_Bit-Plane & Binarized Computation|비트 플레인(Bit-Plane) 및 이진(Binarized) 연산]]
- [[_COMMUNITY_Evolution Strategies Core|진화 전략(Evolution Strategies) 코어]]
- [[_COMMUNITY_Local  Non-Backprop Learning|지역(Local) / 비역전파(Non-Backprop) 학습]]
- [[_COMMUNITY_Physical Substrates & Slow-Fast Learning|물리적 기질(Physical Substrates)과 느림/빠름(Slow-Fast) 학습]]
- [[_COMMUNITY_EGGROLL (Markdown Notes)|EGGROLL (마크다운 노트)]]
- [[_COMMUNITY_LLM Memory & In-Memory Attention|LLM 메모리(Memory)와 인메모리 어텐션(In-Memory Attention)]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV 캐시(KV-Cache) 양자화(Quantization) 계열]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]
- [[_COMMUNITY_Rank Convergence Proofs|랭크 수렴(Rank Convergence) 증명]]
- [[_COMMUNITY_Single-Cell Two-Timescale Rationale|단일 셀 이중 시간척도(Single-Cell Two-Timescale) 근거]]
- [[_COMMUNITY_Test-Time Discovery & World Models|테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `EGGROLL Algorithm` - 엣지 13개
2. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 12개
3. `NS-RAM Cell (Neuro-Synaptic RAM)` - 엣지 8개
4. `Bit-Level Operator Framework for ReLU MLPs (overview)` - 엣지 8개
5. `NNs as State-Region Dictionaries (overview)` - 엣지 7개
6. `Semi-Passive Physical Neural Devices (overview)` - 엣지 6개
7. `Self-Organizing CMOS-Memory Architecture (overview)` - 엣지 6개
8. `Symbolic Regression via EML Trees` - 엣지 5개
9. `Learnable Physical Medium (not a programmed computer)` - 엣지 5개
10. `Bit-Plane Profile Representation` - 엣지 5개

## 놀라운 연결들 (Surprising Connections, 미처 몰랐을 관계)
- `EGGROLL (Korean Translation)` --semantically_similar_to--> `EGGROLL Algorithm`  [INFERRED] [의미적 유사성(semantically similar)]
  raw/Evolution Strategies at the Hyperscale.md → raw/Evolution Strategies at the Hyperscale.pdf
- `In-Memory Attention Compute (analog crossbars for KV)` --semantically_similar_to--> `Learnable Physical Medium (not a programmed computer)`  [INFERRED] [의미적 유사성]
  raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf → raw/Semi-Passive Physical Neural Devices.md
- `EGGROLL Connection (perturbation-response-fitness)` --semantically_similar_to--> `Layer-Local Training Without End-to-End Backprop`  [INFERRED] [의미적 유사성]
  raw/Semi-Passive Physical Neural Devices.md → raw/NOPROP- TRAINING NEURAL NETWORKS WITHOUT FULL BACK-PROPAGATION OR FULL FORWARD-PROPAGATION.pdf
- `Event-Driven Sparse Interaction Model` --semantically_similar_to--> `On-Chip Local Learning Rule for Beyond-CMOS Devices`  [INFERRED] [의미적 유사성]
  raw/A Physical Reinterpretation of Deep Learning.md → raw/A neuromorphic processor with on-chip learning for beyond-CMOS device integration.pdf
- `Variational Quantum Circuits as Learnable Physical Systems` --semantically_similar_to--> `Learnable Physical Medium (not a programmed computer)`  [INFERRED] [의미적 유사성]
  raw/A Primer on Quantum Machine Learning.pdf → raw/Semi-Passive Physical Neural Devices.md

## 하이퍼엣지 (Hyperedges, 그룹 관계)
- **EML Universality / Sheffer-Type Reduction Pattern** — all_elementary_functions_from_a_single_operator_pdf_eml_operator, all_elementary_functions_from_a_single_operator_pdf_edl_operator, all_elementary_functions_from_a_single_operator_pdf_ternary_operator, all_elementary_functions_from_a_single_operator_pdf_nand_gate [EXTRACTED 0.85]
- **EGGROLL Low-Rank Decomposition Pipeline** — evolution_strategies_at_the_hyperscale_pdf_evolution_strategies, evolution_strategies_at_the_hyperscale_pdf_lora, evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation, evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation, evolution_strategies_at_the_hyperscale_pdf_eggroll [EXTRACTED 0.95]
- **NS-RAM Neuro-Synaptic Dual-Use Pattern** — synaptic_and_neural_behaviours_pdf_mosfet, synaptic_and_neural_behaviours_pdf_punch_through, synaptic_and_neural_behaviours_pdf_floating_bulk, synaptic_and_neural_behaviours_pdf_bulk_bias_control_transistor, synaptic_and_neural_behaviours_pdf_ns_ram_cell [EXTRACTED 0.90]
- **Fast/Slow Two-Timescale Learning Substrate (cross-paper motif)** — semi_passive_physical_neural_devices_memorable_operational_split, self_organizing_cmos_memory_architecture_for_representation_learning_time_scale_separation, semi_passive_physical_neural_devices_flash_slow_parameter, self_organizing_cmos_memory_architecture_for_representation_learning_consolidation_mechanism [INFERRED 0.90]
- **Local Learning Without Full Backprop** — semi_passive_physical_neural_devices_three_factor_learning, noprop_training_neural_networks_without_full_back_propagation_or_full_forward_propagation_local_layer_training, hebbian_learning_with_global_direction_local_rule_global_signal, a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_on_chip_local_learning, self_organizing_cmos_memory_architecture_for_representation_learning_feeding_protocol_learning [INFERRED 0.85]
- **Bit-Level Partial-Product / Carry-Save Compute Pipeline** — bit_level_operator_framework_for_relu_mlps_outermul_dimsum_fold, bit_level_operator_framework_for_relu_mlps_packed_bitslice, bit_level_operator_framework_for_relu_mlps_carry_save_tree, binarized_neural_networks_xnor_popcount_mac, a_physical_reinterpretation_of_deep_learning_bit_plane_overlap_model [INFERRED 0.85]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "신경 표현(Neural Representation)과 기하(Geometry)"
응집도(Cohesion): 0.09
노드 (27개): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks (+19 more)

### 커뮤니티 1 - "EML 연산자(EML Operator)와 기호적(symbolic) 기반"
응집도: 0.1
노드 (20개): Binary Tree Grammar S->1|eml(S,S), EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke) (+12 more)

### 커뮤니티 2 - "NS-RAM과 뉴로모픽(Neuromorphic) 하드웨어"
응집도: 0.11
노드 (20개): EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN), Bulk Bias Control Transistor (2-Transistor Cell), Embedded Flash Memory (Reference), Hot-Carrier (Electron/Hole) Injection, Intel Loihi 2 (Orchard et al. 2021), Long-Term Plasticity (Charge-Trapping) (+12 more)

### 커뮤니티 3 - "비트 플레인(Bit-Plane) 및 이진(Binarized) 연산"
응집도: 0.11
노드 (20개): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel (+12 more)

### 커뮤니티 4 - "진화 전략(Evolution Strategies) 코어"
응집도: 0.12
노드 (17개): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Central Limit Theorem (justification), Counter-Based Deterministic RNG (Salmon 2011), EGGROLL Algorithm (+9 more)

### 커뮤니티 5 - "지역(Local) / 비역전파(Non-Backprop) 학습"
응집도: 0.18
노드 (15개): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, FPGA/ASIC Systolic Target, CMOS-Integrated Organic Neuromorphic Imagers, Local Hebbian Rule Modulated by Global Direction Signal, Hebbian Learning with Global Direction, Layer-Local Training Without End-to-End Backprop, NoProp: Training NNs Without Full Back/Forward-Propagation (+7 more)

### 커뮤니티 6 - "물리적 기질(Physical Substrates)과 느림/빠름(Slow-Fast) 학습"
응집도: 0.17
노드 (15개): NN as Structured Reactive Medium, Primer on Quantum Machine Learning, Variational Quantum Circuits as Learnable Physical Systems, Hybrid CMOS + Organic Neuromorphic Device Stack, CMOS-Centered + RAM-like Memory Hybrid Architecture, Consolidation / Metaplasticity Mechanism, Self-Organizing CMOS-Memory Architecture (overview), Rationale: disambiguating 'device' between memory device and transistor primitive (+7 more)

### 커뮤니티 7 - "EGGROLL (마크다운 노트)"
응집도: 0.33
노드 (6개): EGGROLL (Korean Translation), Evolution Strategies (ES), LoRA (Low-Rank Adaptation), Low-Rank Perturbation E=AB^T/sqrt(r), Rationale: Arithmetic Intensity Improvement, Score Function Gradient Estimation

### 커뮤니티 8 - "LLM 메모리(Memory)와 인메모리 어텐션(In-Memory Attention)"
응집도: 0.4
노드 (5개): In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Lookup-Based Conditional Memory as New Sparsity Axis, Conditional Memory via Scalable Lookup, Operation-First: Transition Speed = Compute Throughput

### 커뮤니티 9 - "수렴 이론(Convergence Theory)과 NTK"
응집도: 0.67
노드 (3개): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### 커뮤니티 10 - "KV 캐시(KV-Cache) 양자화(Quantization) 계열"
응집도: 1.0
노드 (3개): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### 커뮤니티 11 - "행렬 가우시안(Matrix Gaussian) ES"
응집도: 1.0
노드 (2개): Gaussian ES, Matrix Gaussian Distribution

### 커뮤니티 12 - "랭크 수렴(Rank Convergence) 증명"
응집도: 1.0
노드 (2개): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

### 커뮤니티 13 - "단일 셀 이중 시간척도(Single-Cell Two-Timescale) 근거"
응집도: 1.0
노드 (2개): Rationale: Fabrication simplicity demands single-cell two-timescale physics, Single Adaptive Cell with Two Timescales

### 커뮤니티 14 - "테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)"
응집도: 1.0
노드 (2개): Learning to Discover at Test Time, LeWorldModel (paper)

## 모호한 엣지 (Ambiguous Edges) - 검토 필요
- `LeWorldModel (paper)` → `Learning to Discover at Test Time`  [AMBIGUOUS]
  raw/Learning to Discover at Test Time.pdf · relation: semantically_similar_to
- `Learnable Edge Activation Functions (KAN)` → `Learning with Exact Invariances in Polynomial Time`  [AMBIGUOUS]
  raw/Learning with Exact Invariances in Polynomial Time.pdf · relation: semantically_similar_to

## 지식 공백 (Knowledge Gaps)
- **고립 노드 79개:** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+74 more)
  연결이 1개 이하 — 누락된 엣지이거나 문서화되지 않은 컴포넌트(component)일 수 있습니다.
- **얇은 커뮤니티 `Matrix Gaussian ES`** (노드 2개): `Gaussian ES`, `Matrix Gaussian Distribution`
  의미 있는 클러스터(cluster)로 보기엔 너무 작음 — 노이즈(noise)이거나 추가 연결 추출이 필요합니다.
- **얇은 커뮤니티 `Rank Convergence Proofs`** (노드 2개): `Edgeworth Expansion (Bhattacharya & Ranga Rao)`, `EGGROLL Rank Convergence O(r^-1)`
  의미 있는 클러스터로 보기엔 너무 작음 — 노이즈이거나 추가 연결 추출이 필요합니다.
- **얇은 커뮤니티 `Single-Cell Two-Timescale Rationale`** (노드 2개): `Rationale: Fabrication simplicity demands single-cell two-timescale physics`, `Single Adaptive Cell with Two Timescales`
  의미 있는 클러스터로 보기엔 너무 작음 — 노이즈이거나 추가 연결 추출이 필요합니다.
- **얇은 커뮤니티 `Test-Time Discovery & World Models`** (노드 2개): `Learning to Discover at Test Time`, `LeWorldModel (paper)`
  의미 있는 클러스터로 보기엔 너무 작음 — 노이즈이거나 추가 연결 추출이 필요합니다.

## 추천 질문 (Suggested Questions)
_이 그래프가 고유하게 답할 수 있는 질문들:_

- **`LeWorldModel (paper)`와 `Learning to Discover at Test Time`의 정확한 관계는?**
  _AMBIGUOUS로 태깅된 엣지(relation: semantically_similar_to) — 신뢰도가 낮음._
- **`Learnable Edge Activation Functions (KAN)`와 `Learning with Exact Invariances in Polynomial Time`의 정확한 관계는?**
  _AMBIGUOUS로 태깅된 엣지(relation: semantically_similar_to) — 신뢰도가 낮음._
- **왜 `NN as Structured Reactive Medium`가 `Physical Substrates & Slow-Fast Learning`을 `Neural Representation & Geometry`, `Bit-Plane & Binarized Computation`와 이어주는가?**
  _높은 매개 중심성(betweenness centrality) 0.106 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `Stateful Interaction Field Formalism`이 `Neural Representation & Geometry`를 `Physical Substrates & Slow-Fast Learning`과 이어주는가?**
  _높은 매개 중심성 0.099 — 커뮤니티 간 교량 노드._
- **왜 `EGGROLL Algorithm`이 `Evolution Strategies Core`를 `EML Operator & Symbolic Foundations`, `NS-RAM & Neuromorphic Hardware`, `EGGROLL (Markdown Notes)`와 이어주는가?**
  _높은 매개 중심성 0.093 — 커뮤니티 간 교량 노드._
- **`EGGROLL Algorithm`과 관련된 2개의 추론(INFERRED) 관계 (예: `EGGROLL (Korean Translation)`, `Symbolic Regression via EML Trees`와의 연결)가 실제로 맞는가?**
  _`EGGROLL Algorithm`에는 INFERRED 엣지가 2개 있음 — 모델이 추론한 연결이라 검증이 필요._
- **`LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`은 시스템의 나머지와 어떻게 연결되는가?**
  _약연결(weakly-connected) 노드 79개 검출 — 문서화 공백이거나 누락된 엣지일 가능성._
