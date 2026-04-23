# Graph Report - ./raw  (2026-04-23)

## Corpus Check
- 31 files · ~38,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 358 nodes · 729 edges · 17 communities detected
- Extraction: 48% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 87 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Charge-Trap Consolidation + Tier-23 Memory Bridge|Charge-Trap Consolidation + Tier-2/3 Memory Bridge]]
- [[_COMMUNITY_Analog Multiplication + Beyond-CMOS Hardware|Analog Multiplication + Beyond-CMOS Hardware]]
- [[_COMMUNITY_Symbolic Regression + EML Master + Catalog Core|Symbolic Regression + EML Master + Catalog Core]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|Subthreshold Score + Nonlinearity Realization]]
- [[_COMMUNITY_Physical Reinterpretation of DL + Bit-Plane|Physical Reinterpretation of DL + Bit-Plane]]
- [[_COMMUNITY_LLM Memory + Conditional Lookup|LLM Memory + Conditional Lookup]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem|KAN + Kolmogorov-Arnold Theorem]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor (TEXEL)|Beyond-CMOS Neuromorphic Processor (TEXEL)]]
- [[_COMMUNITY_EML + Log-Domain Arithmetic Family|EML + Log-Domain Arithmetic Family]]
- [[_COMMUNITY_Self-Organizing CMOS-Memory + Reactive Medium|Self-Organizing CMOS-Memory + Reactive Medium]]
- [[_COMMUNITY_Stateful Interaction Field & Axiomatization|Stateful Interaction Field & Axiomatization]]
- [[_COMMUNITY_Geometric OOD + Manifold LID|Geometric OOD + Manifold LID]]
- [[_COMMUNITY_Analog In-Memory Attention + Gain-Cell (body-extracted)|Analog In-Memory Attention + Gain-Cell (body-extracted)]]
- [[_COMMUNITY_Binarized NN + XNOR Pipeline|Binarized NN + XNOR Pipeline]]
- [[_COMMUNITY_LIF Neuron + Electronic Synapse|LIF Neuron + Electronic Synapse]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 44 edges
2. `Subthreshold Exponential Regime (primitive)` - 24 edges
3. `EGGROLL Algorithm` - 22 edges
4. `Log-Domain / Translinear Computation (primitive)` - 19 edges
5. `EML Operator eml(x,y)=exp(x)-ln(y)` - 18 edges
6. `CMOS MOSFET (Bulk-Silicon)` - 18 edges
7. `Device-Math Correspondence Catalog` - 18 edges
8. `Three-Tier Memory Hierarchy + Sensor Readout (PPCA Extension)` - 18 edges
9. `Component N — Selective-passing nonlinearity (transistor I-V)` - 17 edges
10. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 17 edges

## Surprising Connections (you probably didn't know these)
- `Component W — Linear Combiner (Kirchhoff crossbar MVM)` --semantically_similar_to--> `XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical)` --semantically_similar_to--> `Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Log-Domain / Translinear Computation (primitive)` --semantically_similar_to--> `Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention`  [INFERRED] [semantically similar]
  raw/analog_primitive_gaps.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Gilbert Cell Four-Quadrant Multiplier (primitive)` --semantically_similar_to--> `Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC)`  [INFERRED] [semantically similar]
  raw/analog_primitive_gaps.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` --semantically_similar_to--> `Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)`  [INFERRED] [semantically similar]
  raw/stage2_eggroll_ppca_architecture.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf

## Hyperedges (group relationships)
- **Three-tier memory hierarchy unifying Tier 1 (floating-bulk) + Tier 2 (charge-trap) + Tier 3 (flash/MRAM archive) within PPCA** —  [1.0]
- **Semi-passive adaptive memory device unified as learner + live memory + sensor + persistent archive** —  [0.9]

## Communities

### Community 0 - "Charge-Trap Consolidation + Tier-2/3 Memory Bridge"
Cohesion: 0.09
Nodes (44): Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative (+36 more)

### Community 1 - "Analog Multiplication + Beyond-CMOS Hardware"
Cohesion: 0.1
Nodes (40): BEOL differential interface for two- and three-terminal memristors, Binary Tree Grammar S->1|eml(S,S), Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native, Cleanest signed scalar multiplication z=x·y; dot-products of small vectors via parallel cells (+32 more)

### Community 2 - "Symbolic Regression + EML Master + Catalog Core"
Cohesion: 0.08
Nodes (36): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Layer-local learning (no gradient crosses D), Stage 2 Option — Score-function / ES gradient (black-box perturbation) (+28 more)

### Community 3 - "Subthreshold Score + Nonlinearity Realization"
Cohesion: 0.17
Nodes (32): Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp (main), Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Triangular structure: log-domain (algebra), Gilbert (topology), subthreshold exp (device regime) are three views of one fact (+24 more)

### Community 4 - "Physical Reinterpretation of DL + Bit-Plane"
Cohesion: 0.09
Nodes (32): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree, Composition Theorem — (E_binary,W,N_kink|Vk=∞,D) = XNOR-popcount MAC (+24 more)

### Community 5 - "LLM Memory + Conditional Lookup"
Cohesion: 0.09
Nodes (26): Context-aware gating: hidden state is Query, retrieved memory is K/V; sigmoid gate α suppresses collision noise, Engram: O(1) hashed N-gram embedding lookup with multi-head multiplicative-XOR hash and shared table E_{n,k}, Deterministic addressing enables host-memory prefetching; 100B Engram table offloaded with <3% overhead, Conditional memory = new sparsity axis complementary to MoE (conditional computation), Conditional Memory via Scalable Lookup: A New Axis of Sparsity for LLMs (Engram), Mechanistic effect: Engram off-loads early-layer static reconstruction, freeing attention for global long-context (NIAH 84.2→97.0), U-shaped Sparsity Allocation: optimal hybrid MoE+Engram ratio beats pure MoE at iso-FLOPs, PolarQuant achieves >4.2x KV-cache compression with SOTA long-context quality (+18 more)

### Community 6 - "KAN + Kolmogorov-Arnold Theorem"
Cohesion: 0.14
Nodes (25): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and theta of rotation gates, Barren plateaus and NP-hard VQC training (+17 more)

### Community 7 - "Beyond-CMOS Neuromorphic Processor (TEXEL)"
Cohesion: 0.11
Nodes (23): Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack, CMOS-integrated Organic Neuromorphic Imagers for Dual-Modal Imaging (+15 more)

### Community 8 - "EML + Log-Domain Arithmetic Family"
Cohesion: 0.13
Nodes (22): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally, Rationale: Single Primitive Aesthetic/Pedagogy Value (+14 more)

### Community 9 - "Self-Organizing CMOS-Memory + Reactive Medium"
Cohesion: 0.14
Nodes (16): NN as Structured Reactive Medium, CMOS-Centered + RAM-like Memory Hybrid Architecture, Feeding Protocol as Part of Learning Law, Self-Organizing CMOS-Memory Architecture (overview), Rationale: disambiguating 'device' between memory device and transistor primitive, Self-Organizing Representation Space Goal, Trainable Analog Circuit with Gate-Bias Parameters, Analog VLSI / Neuromorphic Engineering Lineage (+8 more)

### Community 10 - "Stateful Interaction Field & Axiomatization"
Cohesion: 0.14
Nodes (16): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### Community 11 - "Geometric OOD + Manifold LID"
Cohesion: 0.22
Nodes (16): LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Geometric Explanation of the Likelihood OOD Detection Paradox, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains: math, GPU kernels, algorithms, biology, Entropic objective J_beta favoring max-reward actions, Learning to Discover at Test Time (TTT-Discover) (+8 more)

### Community 12 - "Analog In-Memory Attention + Gain-Cell (body-extracted)"
Cohesion: 0.18
Nodes (11): Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention, Up to ×10^2 latency and ×10^4 energy reduction vs GPU for attention, Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC), Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM), Analog in-memory computing attention mechanism for fast and energy-efficient LLMs, Sliding-window causal attention keeps fixed M KV entries, bounding array size; layer stacking recovers global receptive field, Analog vs digital readout — analog preserves semi-passive architectural purity (+3 more)

### Community 13 - "Binarized NN + XNOR Pipeline"
Cohesion: 0.29
Nodes (7): Binary matmul GPU kernel: 7× speedup on MNIST BNN without accuracy loss, Binarized Neural Networks (Hubara, Courbariaux, Soudry, El-Yaniv, Bengio 2016), Real-valued weight accumulators kept during training; clipped to [-1,1]; binarized only for forward/gradient compute, Shift-based BatchNorm and shift-based AdaMax: multiplies replaced by power-of-2 bit-shifts (AP2), Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x), Straight-through estimator (STE): gr = gq · 1_{|r|≤1}; gradient of sign() treated as gradient of hard-tanh, XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))

### Community 14 - "LIF Neuron + Electronic Synapse"
Cohesion: 0.29
Nodes (7): LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Artificial Neural Network (ANN), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024), Electronic Synapse (Plasticity), Tonotopic Mapping (Milozzi et al. 2024)

### Community 15 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 16 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Ambiguous Edges - Review These
- `Punch-Through Impact Ionization` → `Depth as Iterative Operator Flow`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `Kink Effect (Boudou & Doyle 1987)` → `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to

## Knowledge Gaps
- **119 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+114 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Punch-Through Impact Ionization` and `Depth as Iterative Operator Flow`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **What is the exact relationship between `Kink Effect (Boudou & Doyle 1987)` and `NNs as State-Region Dictionaries (overview)`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `Symbolic Regression + EML Master + Catalog Core` to `Charge-Trap Consolidation + Tier-2/3 Memory Bridge`, `Analog Multiplication + Beyond-CMOS Hardware`, `Subthreshold Score + Nonlinearity Realization`, `Physical Reinterpretation of DL + Bit-Plane`, `EML + Log-Domain Arithmetic Family`, `Geometric OOD + Manifold LID`, `Analog In-Memory Attention + Gain-Cell (body-extracted)`?**
  _High betweenness centrality (0.293) - this node is a cross-community bridge._
- **Why does `Analog in-memory computing attention mechanism for fast and energy-efficient LLMs` connect `Analog In-Memory Attention + Gain-Cell (body-extracted)` to `LLM Memory + Conditional Lookup`?**
  _High betweenness centrality (0.151) - this node is a cross-community bridge._
- **Why does `Device-Math Correspondence Catalog` connect `Analog Multiplication + Beyond-CMOS Hardware` to `Charge-Trap Consolidation + Tier-2/3 Memory Bridge`, `Symbolic Regression + EML Master + Catalog Core`, `Subthreshold Score + Nonlinearity Realization`, `Physical Reinterpretation of DL + Bit-Plane`, `KAN + Kolmogorov-Arnold Theorem`?**
  _High betweenness centrality (0.142) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._