# 그래프 보고서 (Graph Report) - ./raw  (2026-04-22)

## 코퍼스 점검 (Corpus Check)
- 30 파일 · 약 35,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 333개 · 엣지(edge) 648개 · 커뮤니티(community) 16개 검출
- 추출 결과: 54% EXTRACTED · 13% INFERRED · 0% AMBIGUOUS · INFERRED 엣지 87개 (평균 신뢰도 0.8)
- 토큰(token) 비용: 입력 0 · 출력 0 (이번 감사 재추출 분은 별도 기록)

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Substrate + Consolidation + Reactive Medium|기질(Substrate) + 공고화(Consolidation) + 반응 매질(Reactive Medium)]]
- [[_COMMUNITY_Analog In-Memory Attention (body-extracted)|아날로그 인메모리 어텐션(Analog In-Memory Attention, 본문 추출)]]
- [[_COMMUNITY_Analog Multiplication Family (Gilbert + log-domain + crossbar)|아날로그 곱셈 가족(Analog Multiplication Family, Gilbert + log-domain + 크로스바)]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|서브임계(Subthreshold) 스코어 + 비선형성 실현]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem (body-extracted)|KAN + 콜모고로프-아놀드(Kolmogorov-Arnold) 정리 (본문 추출)]]
- [[_COMMUNITY_Symbolic Regression + EML Master Formula + Adam|기호 회귀(Symbolic Regression) + EML 마스터 공식 + Adam]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor (body-extracted)|Beyond-CMOS 뉴로모픽(Neuromorphic) 프로세서 (본문 추출)]]
- [[_COMMUNITY_Physical Reinterpretation of DL|딥러닝 물리적 재해석(Physical Reinterpretation of DL)]]
- [[_COMMUNITY_Formulation v1 Canonical + Composition Theorem|Formulation v1 정준(Canonical) + 합성 정리(Composition Theorem)]]
- [[_COMMUNITY_EML + Log-Domain Algebra|EML + 로그-도메인(Log-Domain) 대수]]
- [[_COMMUNITY_Floating-Bulk RC + LIF Subthreshold + Pair 5|Floating-Bulk RC + LIF 서브임계 + Pair 5]]
- [[_COMMUNITY_Stateful Interaction Field|상태를 가진 상호작용장(Stateful Interaction Field)]]
- [[_COMMUNITY_Geometric OOD + Manifold LID (body-extracted)|기하학적 OOD + 매니폴드(Manifold) LID (본문 추출)]]
- [[_COMMUNITY_Binarized NN + XNOR Pipeline (body-extracted)|이진 신경망(Binarized NN) + XNOR 파이프라인 (본문 추출)]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 엣지 39개
2. `Subthreshold Exponential Regime (primitive)` - 엣지 24개
3. `EGGROLL Algorithm` - 엣지 22개
4. `Log-Domain / Translinear Computation (primitive)` - 엣지 19개
5. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 18개
6. `CMOS MOSFET (Bulk-Silicon)` - 엣지 18개
7. `Device-Math Correspondence Catalog` - 엣지 18개
8. `Component N — Selective-passing nonlinearity (transistor I-V)` - 엣지 17개
9. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 엣지 16개
10. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 엣지 15개

## 놀라운 연결들 (Surprising Connections, 미처 몰랐을 관계)
- `Component W — Linear Combiner (Kirchhoff crossbar MVM)` --semantically_similar_to--> `XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))`  [INFERRED] [의미적 유사성]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical)` --semantically_similar_to--> `Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)`  [INFERRED] [의미적 유사성]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Log-Domain / Translinear Computation (primitive)` --semantically_similar_to--> `Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention`  [INFERRED] [의미적 유사성]
  raw/analog_primitive_gaps.md → raw/Analog in-memory computing attention mechanism....pdf
- `Gilbert Cell Four-Quadrant Multiplier (primitive)` --semantically_similar_to--> `Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC)`  [INFERRED] [의미적 유사성]
  raw/analog_primitive_gaps.md → raw/Analog in-memory computing attention mechanism....pdf
- `Stage-2 Architecture — EGGROLL-PPCA` --semantically_similar_to--> `Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)`  [INFERRED] [의미적 유사성]
  raw/stage2_eggroll_ppca_architecture.md → raw/Analog in-memory computing attention mechanism....pdf

## 하이퍼엣지 (Hyperedges, 그룹 관계)
- **KV-cache compression family (post body-extraction)** — QJL, PolarQuant, TurboQuant 계열 [EXTRACTED 1.00]
- **Spectral-theoretic polynomial-time invariance pipeline** — Laplace-Beltrami 분해 + 군 불변 다항시간 학습 [1.0]
- **KAT -> learnable edges -> basis parameterization -> trainability** — KAN 이론→실전 파이프라인 [1.0]
- **TTT-Discover = entropic objective + PUCT reuse + test-time gradient steps** [1.0]
- **VQC training: angle encoding + PQC + parameter shift + hybrid loop** — 양자 머신러닝(QML) 학습 [1.0]
- **hyper_neuromorphic_hardware_trio** — CMOS 유기 이미저 + Beyond-CMOS 프로세서 + NS-RAM/멤리스터/PCM [0.85]
- **hyper_latent_geometry_cluster** — LeWorldModel SIGReg + OOD Paradox manifold + LID score-rank + PPCA + Jacobian conditioning [0.8]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "기질(Substrate) + 공고화(Consolidation) + 반응 매질(Reactive Medium)"
응집도(Cohesion): 0.08 · 노드 41개
NN as Structured Reactive Medium, Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative, Pair 6: Single-Cell Two-Timescale ↔ Fast/Slow LR (+33)

### 커뮤니티 1 - "아날로그 인메모리 어텐션(Analog In-Memory Attention, 본문 추출)"
응집도: 0.07 · 노드 33개
Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation (avoid ADCs), Up to ×10² latency and ×10⁴ energy reduction vs GPU, Charge-based gain cell, Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (+25)

### 커뮤니티 2 - "아날로그 곱셈 가족(Analog Multiplication Family)"
응집도: 0.13 · 노드 32개
Binary Tree Grammar S->1|eml(S,S), Cross-coupled differential pairs sharing common tail-current, Four-quadrant signed multiplication I_out = (I_tail/V_T²)·V_x·V_y, Gilbert Cell Four-Quadrant Multiplier (primitive), Gilbert cells evaluate outer product a_i·b_j one row/column at a time, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad (+24)

### 커뮤니티 3 - "서브임계(Subthreshold) 스코어 + 비선형성 실현"
응집도: 0.18 · 노드 29개
Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor, Fills N_β placeholder from formulation v1, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)), Softmax-native: K subthreshold transistors at normalizing node, Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET three regimes (+21)

### 커뮤니티 4 - "KAN + 콜모고로프-아놀드(Kolmogorov-Arnold) 정리 (본문 추출)"
응집도: 0.14 · 노드 25개
B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and θ of rotation gates, Barren plateaus and NP-hard VQC training (+17)

### 커뮤니티 5 - "기호 회귀(Symbolic Regression) + EML 마스터 공식 + Adam"
응집도: 0.09 · 노드 24개
Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch, Symbolic Regression via EML Trees, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum (+16)

### 커뮤니티 6 - "Beyond-CMOS 뉴로모픽(Neuromorphic) 프로세서 (본문 추출)"
응집도: 0.11 · 노드 24개
TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Hybrid CMOS + organic BHJ device stack, Dual-modal operation: static frame + dynamic synaptic (+16)

### 커뮤니티 7 - "딥러닝 물리적 재해석(Physical Reinterpretation of DL)"
응집도: 0.13 · 노드 22개
Adjoint Credit Field, Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Component E — Encoder, Encoder Option A — Bit-plane weighted charge (canonical) (+14)

### 커뮤니티 8 - "Formulation v1 정준(Canonical) + 합성 정리(Composition Theorem)"
응집도: 0.16 · 노드 22개
Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree, Composition Theorem — (E_binary,W,N_kink|Vk=∞,D) = XNOR-popcount MAC, Component D — Decoder (comparator array), 4 불변량(Invariants) (+14)

### 커뮤니티 9 - "EML + 로그-도메인(Log-Domain) 대수"
응집도: 0.16 · 노드 20개
EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula, Exp-Log Representation (Liouville 1835), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+12)

### 커뮤니티 10 - "Floating-Bulk RC + LIF Subthreshold + Pair 5"
응집도: 0.12 · 노드 17개
LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), EGG (Evolved Generative GRU, int8 RNN), ANN, Bulk Bias Control Transistor (+9)

### 커뮤니티 11 - "상태를 가진 상호작용장(Stateful Interaction Field)"
응집도: 0.14 · 노드 16개
10-Axiom Formalization of Stateful NN, Interaction-State Layer, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (+8)

### 커뮤니티 12 - "기하학적 OOD + 매니폴드(Manifold) LID (본문 추출)"
응집도: 0.22 · 노드 16개
LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains (math, GPU kernels, algorithms, biology), Entropic objective J_beta, Learning to Discover at Test Time (TTT-Discover) (+8)

### 커뮤니티 13 - "이진 신경망(Binarized NN) + XNOR 파이프라인 (본문 추출)"
응집도: 0.29 · 노드 7개
Binarized Neural Networks (Hubara, Courbariaux et al. 2016), Deterministic sign() binarization of weights AND activations to {-1,+1}, XNOR + popcount replaces floating-point MAC, STE: gr = gq · 1_{|r|≤1}, Shift-based BatchNorm and AdaMax (power-of-2 bit-shifts), Real-valued weight accumulators during training, Binary matmul GPU kernel 7× speedup

### 커뮤니티 14 - "수렴 이론(Convergence Theory)과 NTK"
응집도: 0.67 · 노드 3개
Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### 커뮤니티 15 - "행렬 가우시안(Matrix Gaussian) ES"
응집도: 1.0 · 노드 2개
Gaussian ES, Matrix Gaussian Distribution

## 모호한 엣지 (Ambiguous Edges) - 검토 필요
- `Punch-Through Impact Ionization` → `Depth as Iterative Operator Flow`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `Kink Effect (Boudou & Doyle 1987)` → `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to

(이전 run의 AMBIGUOUS 4개 중 2개는 본문 재추출로 해소되어 `disjoint_from` EXTRACTED 1.0으로 승격됨: LeWorldModel↔TTT-Discover, KAN↔Learning with Exact Invariances.)

## 지식 공백 (Knowledge Gaps)
- **고립 노드 117개**: `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+112)
  연결이 1개 이하 — 대부분 본문 추출이 표면적이었던 초기 노드들. 향후 --mode deep 재실행 시 감소 예상.
- **얇은 커뮤니티 `Matrix Gaussian ES`** (노드 2개): `Gaussian ES`, `Matrix Gaussian Distribution`
  의미 있는 클러스터로 보기엔 너무 작음.

## 추천 질문 (Suggested Questions)
_이 그래프가 고유하게 답할 수 있는 질문들:_

- **`Punch-Through Impact Ionization`과 `Depth as Iterative Operator Flow`의 정확한 관계는?** (AMBIGUOUS 0.3 — Neural ODE 논문 추가로 해소 예상)
- **`Kink Effect (Boudou & Doyle 1987)`와 `NNs as State-Region Dictionaries (overview)`의 정확한 관계는?** (AMBIGUOUS 0.3 — Hanin-Rolnick region counting 논문 추가로 해소 예상)
- **왜 `Stage-2 Architecture — EGGROLL-PPCA`가 10개 커뮤니티를 잇는가?** (매개 중심성 0.322 — 그래프 전체 최대)
- **왜 `Device-Math Correspondence Catalog`가 7개 커뮤니티를 잇는가?** (매개 중심성 0.161)
- **`Subthreshold Exponential Regime (primitive)`의 6개 INFERRED 연결이 실제로 맞는가?** (EML Operator, Exp-Log Representation 등 — 본문 근거 확인 필요)
- **`EGGROLL Algorithm`의 5개 INFERRED 연결이 실제로 맞는가?**
- **`Log-Domain / Translinear Computation (primitive)`의 9개 INFERRED 연결이 실제로 맞는가?**
