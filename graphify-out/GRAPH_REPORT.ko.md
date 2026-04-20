# 그래프 보고서 (Graph Report) - ./raw  (2026-04-20)

## 코퍼스 점검 (Corpus Check)
- 29 파일 · 약 26,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 235개 · 엣지(edge) 440개 · 커뮤니티(community) 13개 검출
- 추출 결과: 75% EXTRACTED · 24% INFERRED · 1% AMBIGUOUS · INFERRED 엣지 104개 (평균 신뢰도 0.8)
- 토큰(token) 비용: 입력 4,200 · 출력 6,400

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_ES + Symbolic Regression + Gaussian-Score Device Realization|ES + 기호 회귀(Symbolic Regression) + 가우시안-스코어(Gaussian-Score) 소자 실현]]
- [[_COMMUNITY_Analog Multiplication Family (crossbar + Gilbert + log-domain)|아날로그 곱셈 가족(Analog Multiplication Family, 크로스바 + Gilbert + log-domain)]]
- [[_COMMUNITY_Interaction Field & Learnable Physical Substrate|상호작용장(Interaction Field)과 학습 가능 물리 기질(Learnable Physical Substrate)]]
- [[_COMMUNITY_Bit-Level Physics & Reinterpretation + Encoder|비트-레벨(Bit-Level) 물리 및 재해석(Reinterpretation) + 인코더(Encoder)]]
- [[_COMMUNITY_Subthreshold Nonlinearity + State-Region Bridge|서브임계(Subthreshold) 비선형성 + 상태-영역(State-Region) 교량]]
- [[_COMMUNITY_LocalNon-Backprop Learning + Stage-2 Options|지역(Local) / 비역전파(Non-Backprop) 학습 + 2단계(Stage-2) 옵션]]
- [[_COMMUNITY_Two-Timescale Bridge + Pulse-Density Encoder|두 시간척도 교량(Two-Timescale Bridge) + 펄스-밀도(Pulse-Density) 인코더]]
- [[_COMMUNITY_EML Operator + Symbolic Foundations (log-domain algebra)|EML 연산자(EML Operator) + 기호적 기반 (log-domain 대수)]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV 캐시(KV-Cache) 양자화(Quantization) 계열]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]
- [[_COMMUNITY_Rank Convergence Proofs|랭크 수렴(Rank Convergence) 증명]]
- [[_COMMUNITY_Test-Time Discovery & World Models|테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `Subthreshold Exponential Regime (primitive)` - 엣지 21개
2. `EGGROLL Algorithm` - 엣지 18개
3. `Log-Domain / Translinear Computation (primitive)` - 엣지 18개
4. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 17개
5. `CMOS MOSFET (Bulk-Silicon)` - 엣지 16개
6. `Device-Math Correspondence Catalog` - 엣지 16개
7. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 엣지 14개
8. `Component N — Selective-passing nonlinearity (transistor I-V)` - 엣지 14개
9. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 엣지 14개
10. `Component E — Encoder (bits → analog, linear injection)` - 엣지 13개

## 놀라운 연결들 (Surprising Connections, 미처 몰랐을 관계)
- `Operation-First: Transition Speed = Compute Throughput` --semantically_similar_to--> `In-Memory Attention Compute (analog crossbars for KV)`  [INFERRED] [의미적 유사성(semantically similar)]
  raw/Semi-Passive Physical Neural Devices.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [의미적 유사성]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS`  [INFERRED] [의미적 유사성]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `Exp-Log Representation (Liouville 1835)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [의미적 유사성]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `Punch-Through Impact Ionization` --semantically_similar_to--> `Depth as Iterative Operator Flow`  [AMBIGUOUS] [의미적 유사성]
  raw/Synaptic and neural behaviours.pdf → raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md

## 하이퍼엣지 (Hyperedges, 그룹 관계)
- **Analog multiplication family: log-domain, Gilbert cell, crossbar MVM, bit-plane overlap as four implementations of one primitive** —  [INFERRED 0.85]
- **MOSFET three-regime N-option family: one device instantiates N_α (kink), N_β (subthreshold exp), N_γ (saturation) depending on bias** —  [EXTRACTED 1.00]
- **Exponential-law family: exp() is the unifying physics across log-domain, subthreshold, EML, Gaussian score, exp/log pair** —  [INFERRED 0.90]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "ES + 기호 회귀(Symbolic Regression) + 가우시안-스코어(Gaussian-Score) 소자 실현"
응집도(Cohesion): 0.06
노드 (39개): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror (+31 more)

### 커뮤니티 1 - "아날로그 곱셈 가족(Analog Multiplication Family, 크로스바 + Gilbert + log-domain)"
응집도: 0.12
노드 (31개): Binary Tree Grammar S->1|eml(S,S), In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native (+23 more)

### 커뮤니티 2 - "상호작용장(Interaction Field)과 학습 가능 물리 기질(Learnable Physical Substrate)"
응집도: 0.09
노드 (29개): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), NN as Structured Reactive Medium, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning (+21 more)

### 커뮤니티 3 - "비트-레벨(Bit-Level) 물리 및 재해석(Reinterpretation) + 인코더(Encoder)"
응집도: 0.11
노드 (29개): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+21 more)

### 커뮤니티 4 - "서브임계(Subthreshold) 비선형성 + 상태-영역(State-Region) 교량"
응집도: 0.18
노드 (28개): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator) (+20 more)

### 커뮤니티 5 - "지역(Local) / 비역전파(Non-Backprop) 학습 + 2단계(Stage-2) 옵션"
응집도: 0.11
노드 (26개): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, Event-Driven Sparse Interaction Model, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Layer-local learning (no gradient crosses D), Stage 2 Option — Score-function / ES gradient (black-box perturbation), Stage 2 Option — Surrogate / straight-through gradient (enrichment target), FPGA/ASIC Systolic Target (+18 more)

### 커뮤니티 6 - "두 시간척도 교량(Two-Timescale Bridge) + 펄스-밀도(Pulse-Density) 인코더"
응집도: 0.15
노드 (21개): Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast (+13 more)

### 커뮤니티 7 - "EML 연산자(EML Operator) + 기호적 기반 (log-domain 대수)"
응집도: 0.15
노드 (20개): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+12 more)

### 커뮤니티 8 - "수렴 이론(Convergence Theory)과 NTK"
응집도: 0.67
노드 (3개): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### 커뮤니티 9 - "KV 캐시(KV-Cache) 양자화(Quantization) 계열"
응집도: 1.0
노드 (3개): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### 커뮤니티 10 - "행렬 가우시안(Matrix Gaussian) ES"
응집도: 1.0
노드 (2개): Gaussian ES, Matrix Gaussian Distribution

### 커뮤니티 11 - "랭크 수렴(Rank Convergence) 증명"
응집도: 1.0
노드 (2개): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

### 커뮤니티 12 - "테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)"
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
- **고립 노드 82개:** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+77 more)
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
- **왜 `Device-Math Correspondence Catalog`가 `Analog Multiplication Family`를 `ES + Symbolic Regression + Gaussian-Score Device Realization`, `Interaction Field & Learnable Physical Substrate`, `Bit-Level Physics & Reinterpretation + Encoder`, `Subthreshold Nonlinearity + State-Region Bridge`, `Two-Timescale Bridge + Pulse-Density Encoder`와 이어주는가?**
  _높은 매개 중심성(betweenness centrality) 0.179 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `Subthreshold Exponential Regime (primitive)`가 `Subthreshold Nonlinearity + State-Region Bridge`를 `ES + Symbolic Regression + Gaussian-Score Device Realization`, `EML Operator + Symbolic Foundations (log-domain algebra)`과 이어주는가?**
  _높은 매개 중심성 0.158 — 커뮤니티 간 교량 노드._
- **왜 `EGGROLL Algorithm`이 `ES + Symbolic Regression + Gaussian-Score Device Realization`을 `Analog Multiplication Family`, `Subthreshold Nonlinearity + State-Region Bridge`, `Local/Non-Backprop Learning + Stage-2 Options`과 이어주는가?**
  _높은 매개 중심성 0.143 — 커뮤니티 간 교량 노드._
