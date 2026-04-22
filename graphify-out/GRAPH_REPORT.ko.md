# 그래프 보고서 (Graph Report) - ./raw  (2026-04-22)

## 코퍼스 점검 (Corpus Check)
- 30 파일 · 약 29,500 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 258개 · 엣지(edge) 559개 · 커뮤니티(community) 13개 검출
- 추출 결과: 59% EXTRACTED · 19% INFERRED · 1% AMBIGUOUS · INFERRED 엣지 104개 (평균 신뢰도 0.8)
- 토큰(token) 비용: 입력 6,200 · 출력 8,400

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)|아날로그 산술 슈퍼허브(Analog Arithmetic Super-Hub, W + Gilbert + 크로스바 + log-domain)]]
- [[_COMMUNITY_Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)|비선형성·스코어 슈퍼허브(Nonlinearity & Score Super-Hub, 서브임계 + 상태-영역 + PPCA 정준)]]
- [[_COMMUNITY_Consolidation & Two-Timescale Hub (charge-trap + PPCA Phase 6 + Pair 256)|공고화·두 시간척도 허브(Consolidation & Two-Timescale Hub, charge-trap + PPCA Phase 6 + Pair 2/5/6)]]
- [[_COMMUNITY_Bit-Level Physics & Encoder|비트-레벨(Bit-Level) 물리 + 인코더(Encoder)]]
- [[_COMMUNITY_EGGROLL + Symbolic Regression + PPCA Outer Loop|EGGROLL + 기호 회귀(Symbolic Regression) + PPCA 외부 루프(Outer Loop)]]
- [[_COMMUNITY_Physical Substrate & Interaction Field|물리적 기질(Physical Substrate)과 상호작용장(Interaction Field)]]
- [[_COMMUNITY_EML + Log-Domain Arithmetic Family|EML + 로그-도메인(Log-Domain) 산술 가족]]
- [[_COMMUNITY_LocalNon-Backprop Learning + PPCA Rejections|지역(Local) / 비역전파(Non-Backprop) 학습 + PPCA 거부(Rejections)]]
- [[_COMMUNITY_Punch-Through ES Fast-Weight + LIF|Punch-Through ES 고속 가중치(Fast-Weight) + LIF]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV 캐시(KV-Cache) 양자화(Quantization) 계열]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]
- [[_COMMUNITY_Test-Time Discovery & World Models|테스트 타임 발견(Test-Time Discovery)과 월드 모델(World Models)]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `Subthreshold Exponential Regime (primitive)` - 엣지 23개
2. `EGGROLL Algorithm` - 엣지 21개
3. `Log-Domain / Translinear Computation (primitive)` - 엣지 20개
4. `CMOS MOSFET (Bulk-Silicon)` - 엣지 18개
5. `Device-Math Correspondence Catalog` - 엣지 18개
6. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 17개
7. `Component N — Selective-passing nonlinearity (transistor I-V)` - 엣지 17개
8. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 엣지 16개
9. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 엣지 15개
10. `Component E — Encoder (bits → analog, linear injection)` - 엣지 15개

(추가 정보: `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` 노드는 file_type 필드 누락으로 갓 노드 랭킹에서 자동 제외되었으나, 실제 차수는 36개로 그래프 전체 1위 — 5개 커뮤니티 교차의 최대 허브.)

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
- **stage2_closure_hyperedge** —  [0.95]
- **eggroll_ppca_operational_cycle** —  [1.0]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "아날로그 산술 슈퍼허브(Analog Arithmetic Super-Hub)"
응집도(Cohesion): 0.12
노드 (35개): Binary Tree Grammar S->1|eml(S,S), In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Catalog Absorption — 8-pair mapping ⇒ 4-slot schema + pending learning rule, Component W — Linear Combiner (Kirchhoff crossbar MVM) (+27 more)

### 커뮤니티 1 - "비선형성·스코어 슈퍼허브(Nonlinearity & Score Super-Hub)"
응집도: 0.15
노드 (34개): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5 (+26 more)

### 커뮤니티 2 - "공고화·두 시간척도 허브(Consolidation & Two-Timescale Hub)"
응집도: 0.11
노드 (32개): Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast (+24 more)

### 커뮤니티 3 - "비트-레벨(Bit-Level) 물리 + 인코더(Encoder)"
응집도: 0.11
노드 (30개): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+22 more)

### 커뮤니티 4 - "EGGROLL + 기호 회귀(Symbolic Regression) + PPCA 외부 루프"
응집도: 0.1
노드 (27개): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Score-function / ES gradient (black-box perturbation), Stage 2 Option — Surrogate / straight-through gradient (enrichment target) (+19 more)

### 커뮤니티 5 - "물리적 기질(Physical Substrate)과 상호작용장(Interaction Field)"
응집도: 0.1
노드 (26개): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), NN as Structured Reactive Medium, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning (+18 more)

### 커뮤니티 6 - "EML + 로그-도메인(Log-Domain) 산술 가족"
응집도: 0.11
노드 (26개): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+18 more)

### 커뮤니티 7 - "지역(Local) / 비역전파(Non-Backprop) 학습 + PPCA 거부(Rejections)"
응집도: 0.13
노드 (24개): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, Event-Driven Sparse Interaction Model, Stage 2 Option — Layer-local learning (no gradient crosses D), FPGA/ASIC Systolic Target, Hybrid CMOS + Organic Neuromorphic Device Stack, CMOS-Integrated Organic Neuromorphic Imagers, Local Hebbian Rule Modulated by Global Direction Signal (+16 more)

### 커뮤니티 8 - "Punch-Through ES 고속 가중치(Fast-Weight) + LIF"
응집도: 0.15
노드 (14개): LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum, Test: 2-transistor EGGROLL vs FP logistic regression, Artificial Neural Network (ANN), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024) (+6 more)

### 커뮤니티 9 - "수렴 이론(Convergence Theory)과 NTK"
응집도: 0.67
노드 (3개): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### 커뮤니티 10 - "KV 캐시(KV-Cache) 양자화(Quantization) 계열"
응집도: 1.0
노드 (3개): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### 커뮤니티 11 - "행렬 가우시안(Matrix Gaussian) ES"
응집도: 1.0
노드 (2개): Gaussian ES, Matrix Gaussian Distribution

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
- **고립 노드 77개:** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+72 more)
  연결이 1개 이하 — 누락된 엣지이거나 문서화되지 않은 컴포넌트(component)일 수 있습니다.
- **얇은 커뮤니티 `Matrix Gaussian ES`** (노드 2개): `Gaussian ES`, `Matrix Gaussian Distribution`
  의미 있는 클러스터(cluster)로 보기엔 너무 작음 — 노이즈(noise)이거나 추가 연결 추출이 필요합니다.
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
- **왜 `Device-Math Correspondence Catalog`가 7개 커뮤니티를 잇는가? (Analog Arithmetic ↔ Nonlinearity & Score ↔ Consolidation ↔ Bit-Level ↔ EGGROLL+PPCA ↔ Physical Substrate ↔ EML+Log-Domain ↔ Punch-Through LIF)**
  _높은 매개 중심성(betweenness centrality) 0.150 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `EGGROLL Algorithm`이 `EGGROLL + Symbolic Regression + PPCA Outer Loop`을 `Analog Arithmetic Super-Hub`, `Nonlinearity & Score Super-Hub`, `Consolidation & Two-Timescale Hub`, `Punch-Through ES Fast-Weight + LIF`와 이어주는가?**
  _높은 매개 중심성 0.129 — 커뮤니티 간 교량 노드._
- **왜 `Subthreshold Exponential Regime (primitive)`가 `Nonlinearity & Score Super-Hub`를 `Analog Arithmetic Super-Hub`, `Punch-Through ES Fast-Weight + LIF`, `EGGROLL + Symbolic Regression + PPCA Outer Loop`, `EML + Log-Domain Arithmetic Family`와 이어주는가?**
  _높은 매개 중심성 0.122 — 커뮤니티 간 교량 노드._
