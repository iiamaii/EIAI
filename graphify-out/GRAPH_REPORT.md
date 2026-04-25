# Graph Report - ./raw  (2026-04-25)

## Corpus Check
- 40 files · ~66,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 517 nodes · 1243 edges · 17 communities detected
- Extraction: 40% EXTRACTED · 8% INFERRED · 0% AMBIGUOUS · INFERRED: 94 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_EGGROLL-PPCA Architecture Hub|EGGROLL-PPCA Architecture Hub]]
- [[_COMMUNITY_Layer S Stochastic Dynamics + Theorems 4-5|Layer S Stochastic Dynamics + Theorems 4-5]]
- [[_COMMUNITY_Three-Tier Memory + Charge-Trap Consolidation|Three-Tier Memory + Charge-Trap Consolidation]]
- [[_COMMUNITY_Bit-Plane Encoder + Physical Reinterpretation|Bit-Plane Encoder + Physical Reinterpretation]]
- [[_COMMUNITY_Log-Domain Multiplication + EML + KAN|Log-Domain Multiplication + EML + KAN]]
- [[_COMMUNITY_Subthreshold Nonlinearity + MOSFET Three Regimes|Subthreshold Nonlinearity + MOSFET Three Regimes]]
- [[_COMMUNITY_Layer D Deterministic Theorems 1-3 + Theory Background|Layer D Deterministic Theorems 1-3 + Theory Background]]
- [[_COMMUNITY_Alternative Candidate Catalog + In-Memory Attention|Alternative Candidate Catalog + In-Memory Attention]]
- [[_COMMUNITY_Layer C Symbolic + Physics Correspondence + Formulation v1|Layer C Symbolic + Physics Correspondence + Formulation v1]]
- [[_COMMUNITY_KV-Cache Quantization + Conditional Memory|KV-Cache Quantization + Conditional Memory]]
- [[_COMMUNITY_Beyond-CMOS TEXEL + NoProp Local Learning|Beyond-CMOS TEXEL + NoProp Local Learning]]
- [[_COMMUNITY_Stateful Interaction Field + Primitive Geometry|Stateful Interaction Field + Primitive Geometry]]
- [[_COMMUNITY_Test-Time Learning + World Models + OOD|Test-Time Learning + World Models + OOD]]
- [[_COMMUNITY_NS-RAM + Floating-Bulk + LIF Neuron|NS-RAM + Floating-Bulk + LIF Neuron]]
- [[_COMMUNITY_Binarized NN + STE Pipeline|Binarized NN + STE Pipeline]]
- [[_COMMUNITY_Symbolic Regression + Adam + EML Master|Symbolic Regression + Adam + EML Master]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 53 edges
2. `Subthreshold Exponential Regime (primitive)` - 30 edges
3. `EGGROLL Algorithm` - 27 edges
4. `Formulation Layer D — Deterministic Dynamics and Theorems 1-3` - 25 edges
5. `Theorem 4 — Learning convergence of W(t) to a local minimum W* a.s.` - 25 edges
6. `Theorem 3 — Signal-Processing Completeness (Switched Volterra Representation)` - 24 edges
7. `Physics Correspondence Table (math ↔ device realization)` - 22 edges
8. `Theorem 5 — Noise tolerance: E[‖W(∞)−W*‖²] ≤ C_H·Σσ²/η` - 22 edges
9. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 21 edges
10. `Log-Domain / Translinear Computation (primitive)` - 21 edges

## Surprising Connections (you probably didn't know these)
- `Component W — Linear Combiner (Kirchhoff crossbar MVM)` --semantically_similar_to--> `XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical)` --semantically_similar_to--> `Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` --semantically_similar_to--> `Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)`  [INFERRED] [semantically similar]
  raw/stage2_eggroll_ppca_architecture.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md

## Hyperedges (group relationships)
- **Seven PPCA slot family** —  [EXTRACTED 1.00]
- **Canonical PPCA vs alternative-catalog relation** —  [EXTRACTED 0.95]

## Communities

### Community 0 - "EGGROLL-PPCA Architecture Hub"
Cohesion: 0.06
Nodes (71): Binary Tree Grammar S->1|eml(S,S), Claim: PPCA template invariance under slot substitution, Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native, Cleanest signed scalar multiplication z=x·y; dot-products of small vectors via parallel cells (+63 more)

### Community 1 - "Layer S Stochastic Dynamics + Theorems 4-5"
Cohesion: 0.11
Nodes (57): Identity: usable rank r bounded by cell resolution b, Convergence to Linearity Theorem, Edgeworth Expansion (Bhattacharya & Ranga Rao), Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018), EGGROLL Rank Convergence O(r^-1), ES score-function identity: averaged S3 drift = ∇_W log E[S], Formulation Layer S — Stochastic Dynamics and Theorems 4-5 (+49 more)

### Community 2 - "Three-Tier Memory + Charge-Trap Consolidation"
Cohesion: 0.08
Nodes (54): Alt W: STT-MRAM crossbar, Alt Update: CBRAM (Conductive Bridge), Alt Update: FeRAM Polarization Flip, Alt Update: VCMA-MRAM Voltage Write, Slot 5: Slow Memory Update, Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA (+46 more)

### Community 3 - "Bit-Plane Encoder + Physical Reinterpretation"
Cohesion: 0.06
Nodes (43): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), NN as Structured Reactive Medium, Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+35 more)

### Community 4 - "Log-Domain Multiplication + EML + KAN"
Cohesion: 0.08
Nodes (42): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and theta of rotation gates, Barren plateaus and NP-hard VQC training (+34 more)

### Community 5 - "Subthreshold Nonlinearity + MOSFET Three Regimes"
Cohesion: 0.15
Nodes (41): Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp (main), Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Triangular structure: log-domain (algebra), Gilbert (topology), subthreshold exp (device regime) are three views of one fact (+33 more)

### Community 6 - "Layer D Deterministic Theorems 1-3 + Theory Background"
Cohesion: 0.12
Nodes (37): Operator D — Decoder comparator array, Operator E — Encoder (capacitor sampling + anti-alias RC), Operator S — Gaussian fitness readout (subthreshold transistor), Operator W — Linear combiner (Kirchhoff crossbar MVM), Operator I_τ — RC integrator (not symbolic, capacitor), Signal Space 𝒳 (internal node voltages, C¹), Time constant τ_x — activation RC filter (ns–μs), Section 5 claim — Euler discretization reduces (D1)–(D3) to NN + EGGROLL (+29 more)

### Community 7 - "Alternative Candidate Catalog + In-Memory Attention"
Cohesion: 0.06
Nodes (33): Alt E: Current-Mode Direct, Alt E: Delta-Sigma 1-bit stream, Alt E: Phase-Shift Encoding, Alt E: Pulse-Width Modulation, Alt N: CMOS Inverter (Sign + Schmitt), Alt N: LIF Neuron, Alt N: OpAmp Hard-tanh, Alt N: Schottky Diode Knee (+25 more)

### Community 8 - "Layer C Symbolic + Physics Correspondence + Formulation v1"
Cohesion: 0.12
Nodes (28): Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, Composition Theorem — (E_binary,W,N_kink|Vk=∞,D) = XNOR-popcount MAC, Component D — Decoder (comparator array), Invariant 1 — E is a linear injection, Invariant 2 — W preserves E's linearity, Invariant 3 — N sign-commutes with thresholding (monotone), Invariant 4 — D reuses the same transistor as N, Bit-Analog Formulation v1 (E,W,N,D Quadruple) (+20 more)

### Community 9 - "KV-Cache Quantization + Conditional Memory"
Cohesion: 0.09
Nodes (26): Context-aware gating: hidden state is Query, retrieved memory is K/V; sigmoid gate α suppresses collision noise, Engram: O(1) hashed N-gram embedding lookup with multi-head multiplicative-XOR hash and shared table E_{n,k}, Deterministic addressing enables host-memory prefetching; 100B Engram table offloaded with <3% overhead, Conditional memory = new sparsity axis complementary to MoE (conditional computation), Conditional Memory via Scalable Lookup: A New Axis of Sparsity for LLMs (Engram), Mechanistic effect: Engram off-loads early-layer static reconstruction, freeing attention for global long-context (NIAH 84.2→97.0), U-shaped Sparsity Allocation: optimal hybrid MoE+Engram ratio beats pure MoE at iso-FLOPs, PolarQuant achieves >4.2x KV-cache compression with SOTA long-context quality (+18 more)

### Community 10 - "Beyond-CMOS TEXEL + NoProp Local Learning"
Cohesion: 0.11
Nodes (24): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+16 more)

### Community 11 - "Stateful Interaction Field + Primitive Geometry"
Cohesion: 0.14
Nodes (16): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### Community 12 - "Test-Time Learning + World Models + OOD"
Cohesion: 0.22
Nodes (16): LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Geometric Explanation of the Likelihood OOD Detection Paradox, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains: math, GPU kernels, algorithms, biology, Entropic objective J_beta favoring max-reward actions, Learning to Discover at Test Time (TTT-Discover) (+8 more)

### Community 13 - "NS-RAM + Floating-Bulk + LIF Neuron"
Cohesion: 0.14
Nodes (15): LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Artificial Neural Network (ANN), Bulk Bias Control Transistor (2-Transistor Cell), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire) (+7 more)

### Community 14 - "Binarized NN + STE Pipeline"
Cohesion: 0.29
Nodes (7): Binary matmul GPU kernel: 7× speedup on MNIST BNN without accuracy loss, Binarized Neural Networks (Hubara, Courbariaux, Soudry, El-Yaniv, Bengio 2016), Real-valued weight accumulators kept during training; clipped to [-1,1]; binarized only for forward/gradient compute, Shift-based BatchNorm and shift-based AdaMax: multiplies replaced by power-of-2 bit-shifts (AP2), Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x), Straight-through estimator (STE): gr = gq · 1_{|r|≤1}; gradient of sign() treated as gradient of hard-tanh, XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))

### Community 15 - "Symbolic Regression + Adam + EML Master"
Cohesion: 0.4
Nodes (5): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees

### Community 16 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Knowledge Gaps
- **138 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+133 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `EGGROLL-PPCA Architecture Hub` to `Layer S Stochastic Dynamics + Theorems 4-5`, `Three-Tier Memory + Charge-Trap Consolidation`, `Bit-Plane Encoder + Physical Reinterpretation`, `Subthreshold Nonlinearity + MOSFET Three Regimes`, `Layer D Deterministic Theorems 1-3 + Theory Background`, `Alternative Candidate Catalog + In-Memory Attention`, `Layer C Symbolic + Physics Correspondence + Formulation v1`, `Test-Time Learning + World Models + OOD`?**
  _High betweenness centrality (0.251) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Subthreshold Nonlinearity + MOSFET Three Regimes` to `EGGROLL-PPCA Architecture Hub`, `Layer S Stochastic Dynamics + Theorems 4-5`, `Log-Domain Multiplication + EML + KAN`, `Layer D Deterministic Theorems 1-3 + Theory Background`, `Layer C Symbolic + Physics Correspondence + Formulation v1`, `NS-RAM + Floating-Bulk + LIF Neuron`?**
  _High betweenness centrality (0.110) - this node is a cross-community bridge._
- **Why does `Analog in-memory computing attention mechanism for fast and energy-efficient LLMs` connect `Alternative Candidate Catalog + In-Memory Attention` to `Layer C Symbolic + Physics Correspondence + Formulation v1`, `KV-Cache Quantization + Conditional Memory`?**
  _High betweenness centrality (0.108) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _138 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `EGGROLL-PPCA Architecture Hub` be split into smaller, more focused modules?**
  _Cohesion score 0.06 - nodes in this community are weakly interconnected._