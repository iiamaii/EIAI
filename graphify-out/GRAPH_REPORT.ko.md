# 그래프 보고서 (Graph Report) - ./raw  (2026-04-19)

## 코퍼스 점검 (Corpus Check)
- 27 파일 · 약 20,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 187개 · 엣지(edge) 254개 · 커뮤니티(community) 16개 검출
- 추출 결과: 74% EXTRACTED · 24% INFERRED · 2% AMBIGUOUS · INFERRED 엣지 61개 (평균 신뢰도 0.76)
- 토큰(token) 비용: 입력 5,200 · 출력 7,600

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Representation Geometry + Catalog Backbone|표현 기하(Representation Geometry) + 카탈로그(Catalog) 척추]]
- [[_COMMUNITY_Two-Timescale Bridge (device↔slowfast math)|두 시간척도 교량(Two-Timescale Bridge, 장치↔slow/fast 수학)]]
- [[_COMMUNITY_Bit-Plane & Binarized Computation|비트 플레인(Bit-Plane) 및 이진(Binarized) 연산]]
- [[_COMMUNITY_Local  Non-Backprop Learning|지역(Local) / 비역전파(Non-Backprop) 학습]]
- [[_COMMUNITY_EGGROLL + Symbolic Regression|EGGROLL + 기호 회귀(Symbolic Regression)]]
- [[_COMMUNITY_Interaction Field & State-Region Formalism|상호작용장(Interaction Field) 및 상태 영역(State-Region) 형식론(Formalism)]]
- [[_COMMUNITY_EML Operator Foundations|EML 연산자(EML Operator) 기반]]
- [[_COMMUNITY_NS-RAM & Neuromorphic Hardware|NS-RAM과 뉴로모픽(Neuromorphic) 하드웨어]]
- [[_COMMUNITY_Learnable Physical Parameter (VQC↔KAN bridge)|학습 가능 물리 파라미터(Learnable Physical Parameter, VQC↔KAN 교량)]]
- [[_COMMUNITY_Analog Continuum → Low-Rank Bridge|아날로그 연속체(Analog Continuum) → 저랭크(Low-Rank) 교량]]
- [[_COMMUNITY_In-Memory Attention + Crossbar-Logit Bridge|인메모리 어텐션(In-Memory Attention) + 크로스바 로짓(Crossbar-Logit) 교량]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV 캐시(KV-Cache) 양자화(Quantization) 계열]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]
- [[_COMMUNITY_Rank Convergence Proofs|랭크 수렴(Rank Convergence) 증명]]
- [[_COMMUNITY_Test-Time Discovery & World Models|테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `EGGROLL Algorithm` - 엣지 15개
2. `Device-Math Correspondence Catalog` - 엣지 13개
3. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 12개
4. `NNs as State-Region Dictionaries (overview)` - 엣지 10개
5. `NS-RAM Cell (Neuro-Synaptic RAM)` - 엣지 9개
6. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 엣지 9개
7. `Bit-Level Operator Framework for ReLU MLPs (overview)` - 엣지 8개
8. `Fast Activation x(t) / Slow Weight w(t) Time-Scale Separation` - 엣지 8개
9. `Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight` - 엣지 8개
10. `Pair 6: Single-Cell Two-Timescale ↔ Fast/Slow LR` - 엣지 8개

## 놀라운 연결들 (Surprising Connections, 미처 몰랐을 관계)
- `Operation-First: Transition Speed = Compute Throughput` --semantically_similar_to--> `In-Memory Attention Compute (analog crossbars for KV)`  [INFERRED] [의미적 유사성(semantically similar)]
  raw/Semi-Passive Physical Neural Devices.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Mixture of Transition Autoencoders` --semantically_similar_to--> `Learnable Edge Activation Functions (KAN)`  [INFERRED] [의미적 유사성]
  raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md → raw/A Practitioner's Guide to Kolmogorov–Arnold Networks.pdf
- `Punch-Through Impact Ionization` --semantically_similar_to--> `Depth as Iterative Operator Flow`  [AMBIGUOUS] [의미적 유사성]
  raw/Synaptic and neural behaviours.pdf → raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md
- `Kink Effect (Boudou & Doyle 1987)` --semantically_similar_to--> `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS] [의미적 유사성]
  raw/Synaptic and neural behaviours.pdf → raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md
- `Learnable Physical Medium (not a programmed computer)` --semantically_similar_to--> `In-Memory Attention Compute (analog crossbars for KV)`  [INFERRED] [의미적 유사성]
  raw/Semi-Passive Physical Neural Devices.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf

## 하이퍼엣지 (Hyperedges, 그룹 관계)
- **Two-Timescale Physics → Slow/Fast Math** —  [EXTRACTED 1.00]
- **Analog Continuum → Low-Rank Math** —  [EXTRACTED 1.00]
- **Piecewise Physics → Piecewise-Linear Math** —  [EXTRACTED 1.00]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "표현 기하(Representation Geometry) + 카탈로그(Catalog) 척추"
응집도(Cohesion): 0.12
노드 (24개): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Grouping B: Analog continuum → low-rank math, Grouping C: Piecewise physics → piecewise-linear math, Grouping A: Two-timescale physics → slow/fast math, Device-Math Correspondence Catalog, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum (+16 more)

### 커뮤니티 1 - "두 시간척도 교량(Two-Timescale Bridge, 장치↔slow/fast 수학)"
응집도: 0.13
노드 (24개): Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative (+16 more)

### 커뮤니티 2 - "비트 플레인(Bit-Plane) 및 이진(Binarized) 연산"
응집도: 0.11
노드 (20개): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel (+12 more)

### 커뮤니티 3 - "지역(Local) / 비역전파(Non-Backprop) 학습"
응집도: 0.13
노드 (20개): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, FPGA/ASIC Systolic Target, Hybrid CMOS + Organic Neuromorphic Device Stack, CMOS-Integrated Organic Neuromorphic Imagers, Local Hebbian Rule Modulated by Global Direction Signal, Hebbian Learning with Global Direction, Layer-Local Training Without End-to-End Backprop (+12 more)

### 커뮤니티 4 - "EGGROLL + 기호 회귀(Symbolic Regression)"
응집도: 0.11
노드 (18개): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, EGGROLL (Korean Translation), Evolution Strategies (ES), LoRA (Low-Rank Adaptation) (+10 more)

### 커뮤니티 5 - "상호작용장(Interaction Field) 및 상태 영역(State-Region) 형식론"
응집도: 0.14
노드 (16개): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### 커뮤니티 6 - "EML 연산자(EML Operator) 기반"
응집도: 0.15
노드 (13개): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+5 more)

### 커뮤니티 7 - "NS-RAM과 뉴로모픽(Neuromorphic) 하드웨어"
응집도: 0.18
노드 (12개): EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024), NS-RAM Cell (Neuro-Synaptic RAM), Rationale: CMOS Compatibility/No Alien Materials (+4 more)

### 커뮤니티 8 - "학습 가능 물리 파라미터(Learnable Physical Parameter, VQC↔KAN 교량)"
응집도: 0.27
노드 (11개): NN as Structured Reactive Medium, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning, Variational Quantum Circuits as Learnable Physical Systems, Identity: VQC angle = KAN periodic edge activation, Rationale: physics-unitarity ↔ constraint-unitarity duality, Pair 8: VQC Angle θ ↔ KAN Learnable Rotation (+3 more)

### 커뮤니티 9 - "아날로그 연속체(Analog Continuum) → 저랭크(Low-Rank) 교량"
응집도: 0.27
노드 (10개): Binary Tree Grammar S->1|eml(S,S), Identity: usable rank r bounded by cell resolution b, Pair 3: Memristor/PCM Levels ↔ Low-Rank Rank r, Test: b=4 vs b=8 memristor EGGROLL convergence knee, Low-Rank Perturbation E=AB^T/sqrt(r), Rationale: Arithmetic Intensity Improvement, Rank-r Perturbation Structure, Rationale: Low-rank Structure for High Arithmetic Intensity (+2 more)

### 커뮤니티 10 - "인메모리 어텐션(In-Memory Attention) + 크로스바 로짓(Crossbar-Logit) 교량"
응집도: 0.33
노드 (7개): In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Lookup-Based Conditional Memory as New Sparsity Axis, Conditional Memory via Scalable Lookup, Pair 4: Analog Crossbar MVM ↔ Pre-Softmax Logits, Identity: one crossbar MVM cycle = QK^T/√d_k, Implication: softmax must be off-chip or approximated

### 커뮤니티 11 - "수렴 이론(Convergence Theory)과 NTK"
응집도: 0.67
노드 (3개): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### 커뮤니티 12 - "KV 캐시(KV-Cache) 양자화(Quantization) 계열"
응집도: 1.0
노드 (3개): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### 커뮤니티 13 - "행렬 가우시안(Matrix Gaussian) ES"
응집도: 1.0
노드 (2개): Gaussian ES, Matrix Gaussian Distribution

### 커뮤니티 14 - "랭크 수렴(Rank Convergence) 증명"
응집도: 1.0
노드 (2개): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

### 커뮤니티 15 - "테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)"
응집도: 1.0
노드 (2개): Learning to Discover at Test Time, LeWorldModel (paper)

## 모호한 엣지 (Ambiguous Edges) - 검토 필요
- `Punch-Through Impact Ionization` → `Depth as Iterative Operator Flow`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `Kink Effect (Boudou & Doyle 1987)` → `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `LeWorldModel (paper)` → `Learning to Discover at Test Time`  [AMBIGUOUS]
  raw/Learning to Discover at Test Time.pdf · relation: semantically_similar_to
- `Learnable Edge Activation Functions (KAN)` → `Learning with Exact Invariances in Polynomial Time`  [AMBIGUOUS]
  raw/Learning with Exact Invariances in Polynomial Time.pdf · relation: semantically_similar_to

## 지식 공백 (Knowledge Gaps)
- **고립 노드 86개:** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+81 more)
  연결이 1개 이하 — 누락된 엣지이거나 문서화되지 않은 컴포넌트(component)일 수 있습니다.
- **얇은 커뮤니티 `Matrix Gaussian ES`** (노드 2개): `Gaussian ES`, `Matrix Gaussian Distribution`
  의미 있는 클러스터(cluster)로 보기엔 너무 작음 — 노이즈(noise)이거나 추가 연결 추출이 필요합니다.
- **얇은 커뮤니티 `Rank Convergence Proofs`** (노드 2개): `Edgeworth Expansion (Bhattacharya & Ranga Rao)`, `EGGROLL Rank Convergence O(r^-1)`
  의미 있는 클러스터로 보기엔 너무 작음 — 노이즈이거나 추가 연결 추출이 필요합니다.
- **얇은 커뮤니티 `Test-Time Discovery & World Models`** (노드 2개): `Learning to Discover at Test Time`, `LeWorldModel (paper)`
  의미 있는 클러스터로 보기엔 너무 작음 — 노이즈이거나 추가 연결 추출이 필요합니다.

## 추천 질문 (Suggested Questions)
_이 그래프가 고유하게 답할 수 있는 질문들:_

- **`Punch-Through Impact Ionization`과 `Depth as Iterative Operator Flow`의 정확한 관계는?**
  _AMBIGUOUS로 태깅된 엣지(relation: semantically_similar_to) — 신뢰도가 낮음._
- **`Kink Effect (Boudou & Doyle 1987)`와 `NNs as State-Region Dictionaries (overview)`의 정확한 관계는?**
  _AMBIGUOUS로 태깅된 엣지(relation: semantically_similar_to) — 신뢰도가 낮음._
- **`LeWorldModel (paper)`와 `Learning to Discover at Test Time`의 정확한 관계는?**
  _AMBIGUOUS로 태깅된 엣지(relation: semantically_similar_to) — 신뢰도가 낮음._
- **`Learnable Edge Activation Functions (KAN)`와 `Learning with Exact Invariances in Polynomial Time`의 정확한 관계는?**
  _AMBIGUOUS로 태깅된 엣지(relation: semantically_similar_to) — 신뢰도가 낮음._
- **왜 `Device-Math Correspondence Catalog`가 `Representation Geometry + Catalog Backbone`을 `Two-Timescale Bridge`, `NS-RAM & Neuromorphic Hardware`, `Learnable Physical Parameter (VQC↔KAN bridge)`, `Analog Continuum → Low-Rank Bridge`, `In-Memory Attention + Crossbar-Logit Bridge`와 이어주는가?**
  _높은 매개 중심성(betweenness centrality) 0.333 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `NNs as State-Region Dictionaries (overview)`가 `Representation Geometry + Catalog Backbone`을 `In-Memory Attention + Crossbar-Logit Bridge`, `Interaction Field & State-Region Formalism`과 이어주는가?**
  _높은 매개 중심성 0.148 — 커뮤니티 간 교량 노드._
- **왜 `EGGROLL Algorithm`이 `EGGROLL + Symbolic Regression`을 `Representation Geometry + Catalog Backbone`, `Analog Continuum → Low-Rank Bridge`, `NS-RAM & Neuromorphic Hardware`와 이어주는가?**
  _높은 매개 중심성 0.148 — 커뮤니티 간 교량 노드._
