# Graph Report - ./raw  (2026-04-24)

## Corpus Check
- 39 files · ~62,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 485 nodes · 1197 edges · 13 communities detected
- Extraction: 39% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED: 87 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Symbolic Regression + EML + Theory Chain 4 (Stochastic Approximation)|Symbolic Regression + EML + Theory Chain 4 (Stochastic Approximation)]]
- [[_COMMUNITY_Analog Multiplication + Theory Chain 5 (Gaussian Concentration)|Analog Multiplication + Theory Chain 5 (Gaussian Concentration)]]
- [[_COMMUNITY_Analog Primitives + Theory Chain 3 (Stochastic Calculus)|Analog Primitives + Theory Chain 3 (Stochastic Calculus)]]
- [[_COMMUNITY_Charge-Trap Consolidation + Catalog Pair 2|Charge-Trap Consolidation + Catalog Pair 2]]
- [[_COMMUNITY_Physical Reinterpretation of DL + Bit-Plane|Physical Reinterpretation of DL + Bit-Plane]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|Subthreshold Score + Nonlinearity Realization]]
- [[_COMMUNITY_Formulation Layer CD — Operators + Theorems 1-3 + Theory Chain 1-2|Formulation Layer C/D — Operators + Theorems 1-3 + Theory Chain 1-2]]
- [[_COMMUNITY_Analog In-Memory Attention + Gain-Cell|Analog In-Memory Attention + Gain-Cell]]
- [[_COMMUNITY_Stateful Interaction Field + Axiomatization|Stateful Interaction Field + Axiomatization]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem|KAN + Kolmogorov-Arnold Theorem]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor|Beyond-CMOS Neuromorphic Processor]]
- [[_COMMUNITY_Geometric OOD + Manifold LID|Geometric OOD + Manifold LID]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 50 edges
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
- `Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical)` --semantically_similar_to--> `Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Log-Domain / Translinear Computation (primitive)` --semantically_similar_to--> `Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention`  [INFERRED] [semantically similar]
  raw/analog_primitive_gaps.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Gilbert Cell Four-Quadrant Multiplier (primitive)` --semantically_similar_to--> `Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC)`  [INFERRED] [semantically similar]
  raw/analog_primitive_gaps.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` --semantically_similar_to--> `Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)`  [INFERRED] [semantically similar]
  raw/stage2_eggroll_ppca_architecture.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md

## Hyperedges (group relationships)
- **math_theory_01_foundations_chain** —  [INFERRED]
- **Geometry-Combinatorics-Analysis Triangle** —  [EXTRACTED]
- **math_theory_03_stochastic_calculus_chain** —  [1.0]
- **Stochastic approximation tool chain: RM 1951 + Kushner-Yin ODE + Borkar two-timescale + Martingale + Khasminskii Lyapunov + NES score + Fisher natural gradient, composed into the Theorem 4 convergence skeleton** —  [1.0]
- **Gaussian concentration chain (annulus -> Edgeworth -> rank convergence -> Layer S Theorem 5)** —  [EXTRACTED 1.0]
- **Five theory-background notes form unified foundation for Layer D + Layer S formulation** —  [EXTRACTED 0.95]

## Communities

### Community 0 - "Symbolic Regression + EML + Theory Chain 4 (Stochastic Approximation)"
Cohesion: 0.04
Nodes (78): Adam Optimizer, Binary Tree Grammar S->1|eml(S,S), EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals (+70 more)

### Community 1 - "Analog Multiplication + Theory Chain 5 (Gaussian Concentration)"
Cohesion: 0.1
Nodes (60): Identity: usable rank r bounded by cell resolution b, Convergence to Linearity Theorem, Edgeworth Expansion (Bhattacharya & Ranga Rao), Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018), EGGROLL Rank Convergence O(r^-1), Formulation-complete check: T1+T2+T3+T4+T5+corollary, Corollary — Continual learning via three-tier memory under distribution shift (+52 more)

### Community 2 - "Analog Primitives + Theory Chain 3 (Stochastic Calculus)"
Cohesion: 0.11
Nodes (53): Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp (main), Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Triangular structure: log-domain (algebra), Gilbert (topology), subthreshold exp (device regime) are three views of one fact (+45 more)

### Community 3 - "Charge-Trap Consolidation + Catalog Pair 2"
Cohesion: 0.09
Nodes (52): Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative, Pair 6: Single-Cell Two-Timescale ↔ Fast/Slow LR, Derived ratio K_batch := τ_W / τ_δ ≈ 50–100, Operator Σ/Π — Archive snapshot/restore (flash-MRAM cycle) (+44 more)

### Community 4 - "Physical Reinterpretation of DL + Bit-Plane"
Cohesion: 0.07
Nodes (44): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y) (+36 more)

### Community 5 - "Subthreshold Score + Nonlinearity Realization"
Cohesion: 0.08
Nodes (37): Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Central Limit Theorem (justification), Counter-Based Deterministic RNG (Salmon 2011), Gaussian Approximate Score Function (+29 more)

### Community 6 - "Formulation Layer C/D — Operators + Theorems 1-3 + Theory Chain 1-2"
Cohesion: 0.12
Nodes (36): Operator D — Decoder comparator array, Operator E — Encoder (capacitor sampling + anti-alias RC), Operator S — Gaussian fitness readout (subthreshold transistor), Operator W — Linear combiner (Kirchhoff crossbar MVM), Operator I_τ — RC integrator (not symbolic, capacitor), Signal Space 𝒳 (internal node voltages, C¹), Time constant τ_x — activation RC filter (ns–μs), Section 5 claim — Euler discretization reduces (D1)–(D3) to NN + EGGROLL (+28 more)

### Community 7 - "Analog In-Memory Attention + Gain-Cell"
Cohesion: 0.07
Nodes (33): Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention, Up to ×10^2 latency and ×10^4 energy reduction vs GPU for attention, Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC), Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM), Analog in-memory computing attention mechanism for fast and energy-efficient LLMs, Sliding-window causal attention keeps fixed M KV entries, bounding array size; layer stacking recovers global receptive field, Context-aware gating: hidden state is Query, retrieved memory is K/V; sigmoid gate α suppresses collision noise (+25 more)

### Community 8 - "Stateful Interaction Field + Axiomatization"
Cohesion: 0.07
Nodes (32): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), NN as Structured Reactive Medium, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T) (+24 more)

### Community 9 - "KAN + Kolmogorov-Arnold Theorem"
Cohesion: 0.14
Nodes (25): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and theta of rotation gates, Barren plateaus and NP-hard VQC training (+17 more)

### Community 10 - "Beyond-CMOS Neuromorphic Processor"
Cohesion: 0.18
Nodes (17): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+9 more)

### Community 11 - "Geometric OOD + Manifold LID"
Cohesion: 0.22
Nodes (16): LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Geometric Explanation of the Likelihood OOD Detection Paradox, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains: math, GPU kernels, algorithms, biology, Entropic objective J_beta favoring max-reward actions, Learning to Discover at Test Time (TTT-Discover) (+8 more)

### Community 12 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Knowledge Gaps
- **123 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+118 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `Symbolic Regression + EML + Theory Chain 4 (Stochastic Approximation)` to `Analog Multiplication + Theory Chain 5 (Gaussian Concentration)`, `Analog Primitives + Theory Chain 3 (Stochastic Calculus)`, `Charge-Trap Consolidation + Catalog Pair 2`, `Physical Reinterpretation of DL + Bit-Plane`, `Subthreshold Score + Nonlinearity Realization`, `Formulation Layer C/D — Operators + Theorems 1-3 + Theory Chain 1-2`, `Analog In-Memory Attention + Gain-Cell`, `Geometric OOD + Manifold LID`?**
  _High betweenness centrality (0.238) - this node is a cross-community bridge._
- **Why does `Analog in-memory computing attention mechanism for fast and energy-efficient LLMs` connect `Analog In-Memory Attention + Gain-Cell` to `Charge-Trap Consolidation + Catalog Pair 2`?**
  _High betweenness centrality (0.114) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Analog Primitives + Theory Chain 3 (Stochastic Calculus)` to `Symbolic Regression + EML + Theory Chain 4 (Stochastic Approximation)`, `Analog Multiplication + Theory Chain 5 (Gaussian Concentration)`, `Physical Reinterpretation of DL + Bit-Plane`, `Subthreshold Score + Nonlinearity Realization`, `Formulation Layer C/D — Operators + Theorems 1-3 + Theory Chain 1-2`, `KAN + Kolmogorov-Arnold Theorem`?**
  _High betweenness centrality (0.112) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _123 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Symbolic Regression + EML + Theory Chain 4 (Stochastic Approximation)` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._