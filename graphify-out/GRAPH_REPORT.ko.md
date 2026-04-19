# 그래프 보고서 (Graph Report) - ./raw  (2026-04-19)

## 코퍼스 점검 (Corpus Check)
- 28 파일 · 약 23,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 213개 · 엣지(edge) 356개 · 커뮤니티(community) 14개 검출
- 추출 결과: 79% EXTRACTED · 20% INFERRED · 1% AMBIGUOUS · INFERRED 엣지 70개 (평균 신뢰도 0.77)
- 토큰(token) 비용: 입력 4,800 · 출력 7,200

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_ES + Symbolic Regression + Catalog Core|ES + 기호 회귀(Symbolic Regression) + 카탈로그(Catalog) 중심]]
- [[_COMMUNITY_Bit-Level Physics & Reinterpretation + Encoder|비트-레벨(Bit-Level) 물리 및 재해석(Reinterpretation) + 인코더(Encoder)]]
- [[_COMMUNITY_Two-Timescale Bridge + Pulse-Density Encoder|두 시간척도 교량(Two-Timescale Bridge) + 펄스-밀도(Pulse-Density) 인코더]]
- [[_COMMUNITY_Canonical Forward Pass + State-Region Nonlinearity|정준(canonical) 순전파(Forward Pass) + 상태-영역(State-Region) 비선형성]]
- [[_COMMUNITY_LocalNon-Backprop Learning + Stage-2 Options|지역(Local) / 비역전파(Non-Backprop) 학습 + 2단계(Stage-2) 옵션]]
- [[_COMMUNITY_Linear Combiner W + In-Memory Attention|선형 결합기 W (Linear Combiner) + 인메모리 어텐션(In-Memory Attention)]]
- [[_COMMUNITY_EML Operator Foundations|EML 연산자(EML Operator) 기반]]
- [[_COMMUNITY_Interaction Field & State-Region Formalism|상호작용장(Interaction Field) 및 상태-영역(State-Region) 형식론(Formalism)]]
- [[_COMMUNITY_Learnable Physical Parameter (VQC↔KAN)|학습 가능 물리 파라미터(Learnable Physical Parameter, VQC↔KAN)]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV 캐시(KV-Cache) 양자화(Quantization) 계열]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]
- [[_COMMUNITY_Rank Convergence Proofs|랭크 수렴(Rank Convergence) 증명]]
- [[_COMMUNITY_Test-Time Discovery & World Models|테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `EGGROLL Algorithm` - 엣지 16개
2. `Device-Math Correspondence Catalog` - 엣지 16개
3. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 12개
4. `NNs as State-Region Dictionaries (overview)` - 엣지 12개
5. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 엣지 12개
6. `Component E — Encoder (bits → analog, linear injection)` - 엣지 12개
7. `CMOS MOSFET (Bulk-Silicon)` - 엣지 11개
8. `Bit-Level Operator Framework for ReLU MLPs (overview)` - 엣지 11개
9. `Bit-Analog Formulation v1 (E,W,N,D Quadruple)` - 엣지 11개
10. `Component N — Selective-passing nonlinearity (transistor I-V)` - 엣지 11개

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
- **Bit-Analog Forward-Pass Quadruple (E,W,N,D + formulation)** —  [EXTRACTED 1.00]
- **Canonical Minimal Model (E=A bit-plane, W=crossbar, N=α kink, D=comparator)** —  [EXTRACTED 1.00]
- **Same-Transistor Dual-Read (N analog-read + D binary-read of one MOSFET at kink)** —  [INFERRED 0.90]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "ES + 기호 회귀(Symbolic Regression) + 카탈로그 중심"
응집도(Cohesion): 0.06
노드 (36개): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum, Test: 2-transistor EGGROLL vs FP logistic regression (+28 more)

### 커뮤니티 1 - "비트-레벨(Bit-Level) 물리 및 재해석(Reinterpretation) + 인코더(Encoder)"
응집도: 0.11
노드 (29개): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+21 more)

### 커뮤니티 2 - "두 시간척도 교량(Two-Timescale Bridge) + 펄스-밀도(Pulse-Density) 인코더"
응집도: 0.11
노드 (27개): Encoder Option B — Pulse-density (unary, Hamming weight), Hybrid CMOS + Organic Neuromorphic Device Stack, Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B (+19 more)

### 커뮤니티 3 - "정준(canonical) 순전파(Forward Pass) + 상태-영역(State-Region) 비선형성"
응집도: 0.2
노드 (22개): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Component D — Decoder (comparator array), Component N — Selective-passing nonlinearity (transistor I-V), Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical), Nonlinearity Option β — Subthreshold exponential (weak inversion), Nonlinearity Option γ — Saturation square-law (≈ squared-ReLU/GELU) (+14 more)

### 커뮤니티 4 - "지역(Local) / 비역전파(Non-Backprop) 학습 + 2단계(Stage-2) 옵션"
응집도: 0.13
노드 (21개): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, Event-Driven Sparse Interaction Model, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Layer-local learning (no gradient crosses D), Stage 2 Option — Score-function / ES gradient (black-box perturbation), Stage 2 Option — Surrogate / straight-through gradient (enrichment target), FPGA/ASIC Systolic Target (+13 more)

### 커뮤니티 5 - "선형 결합기 W (Linear Combiner) + 인메모리 어텐션(In-Memory Attention)"
응집도: 0.19
노드 (21개): In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Catalog Absorption — 8-pair mapping ⇒ 4-slot schema + pending learning rule, Component W — Linear Combiner (Kirchhoff crossbar MVM), Constraint — G must be updated locally per crossbar cell, Lookup-Based Conditional Memory as New Sparsity Axis, Conditional Memory via Scalable Lookup, Grouping B: Analog continuum → low-rank math (+13 more)

### 커뮤니티 6 - "EML 연산자(EML Operator) 기반"
응집도: 0.12
노드 (16개): Binary Tree Grammar S->1|eml(S,S), EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke) (+8 more)

### 커뮤니티 7 - "상호작용장(Interaction Field) 및 상태-영역(State-Region) 형식론"
응집도: 0.14
노드 (16개): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### 커뮤니티 8 - "학습 가능 물리 파라미터(Learnable Physical Parameter, VQC↔KAN)"
응집도: 0.22
노드 (13개): NN as Structured Reactive Medium, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning, Variational Quantum Circuits as Learnable Physical Systems, Identity: VQC angle = KAN periodic edge activation, Rationale: physics-unitarity ↔ constraint-unitarity duality, Pair 8: VQC Angle θ ↔ KAN Learnable Rotation (+5 more)

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

### 커뮤니티 13 - "테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)"
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
- **고립 노드 81개:** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+76 more)
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
- **왜 `Device-Math Correspondence Catalog`가 `Linear Combiner W + In-Memory Attention`을 `ES + Symbolic Regression + Catalog Core`, `Bit-Level Physics & Reinterpretation + Encoder`, `Two-Timescale Bridge + Pulse-Density Encoder`, `Canonical Forward Pass + State-Region Nonlinearity`, `Learnable Physical Parameter (VQC↔KAN)`와 이어주는가?**
  _높은 매개 중심성(betweenness centrality) 0.269 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `EGGROLL Algorithm`이 `ES + Symbolic Regression + Catalog Core`를 `Local/Non-Backprop Learning + Stage-2 Options`, `EML Operator Foundations`과 이어주는가?**
  _높은 매개 중심성 0.139 — 커뮤니티 간 교량 노드._
- **왜 `CMOS MOSFET (Bulk-Silicon)`이 `Canonical Forward Pass + State-Region Nonlinearity`를 `ES + Symbolic Regression + Catalog Core`, `Linear Combiner W + In-Memory Attention`, `EML Operator Foundations`과 이어주는가?**
  _높은 매개 중심성 0.118 — 커뮤니티 간 교량 노드._
