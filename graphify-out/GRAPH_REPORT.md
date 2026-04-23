# Graph Report - ./raw  (2026-04-23)

## Corpus Check
- 34 files · ~47,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 442 nodes · 1013 edges · 14 communities detected
- Extraction: 37% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 87 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Charge-Trap Consolidation + Catalog Pairs 256|Charge-Trap Consolidation + Catalog Pairs 2/5/6]]
- [[_COMMUNITY_Analog Multiplication (Gilbert + log-domain + crossbar)|Analog Multiplication (Gilbert + log-domain + crossbar)]]
- [[_COMMUNITY_Physical Reinterpretation of DL + Bit-Plane Encoder|Physical Reinterpretation of DL + Bit-Plane Encoder]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|Subthreshold Score + Nonlinearity Realization]]
- [[_COMMUNITY_Symbolic Regression + EML Master + Adam|Symbolic Regression + EML Master + Adam]]
- [[_COMMUNITY_Convergence Theory + NTK + Layer-S Theorem 4|Convergence Theory + NTK + Layer-S Theorem 4]]
- [[_COMMUNITY_Analog In-Memory Attention + Gain-Cell|Analog In-Memory Attention + Gain-Cell]]
- [[_COMMUNITY_Reactive Medium + Stateful Interaction Field|Reactive Medium + Stateful Interaction Field]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem|KAN + Kolmogorov-Arnold Theorem]]
- [[_COMMUNITY_Formulation Layer C — Operator Definitions|Formulation Layer C — Operator Definitions]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor (TEXEL)|Beyond-CMOS Neuromorphic Processor (TEXEL)]]
- [[_COMMUNITY_Geometric OOD + Manifold LID|Geometric OOD + Manifold LID]]
- [[_COMMUNITY_LIF Neuron + EGG (Evolved Generative GRU)|LIF Neuron + EGG (Evolved Generative GRU)]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 50 edges
2. `Subthreshold Exponential Regime (primitive)` - 29 edges
3. `EGGROLL Algorithm` - 26 edges
4. `Physics Correspondence Table (math ↔ device realization)` - 22 edges
5. `Formulation Layer D — Deterministic Dynamics and Theorems 1-3` - 22 edges
6. `Log-Domain / Translinear Computation (primitive)` - 21 edges
7. `Rank-r Perturbation Structure` - 20 edges
8. `CMOS MOSFET (Bulk-Silicon)` - 20 edges
9. `Three-Tier Memory Hierarchy + Sensor Readout (PPCA Extension)` - 20 edges
10. `Component N — Selective-passing nonlinearity (transistor I-V)` - 19 edges

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

## Communities

### Community 0 - "Charge-Trap Consolidation + Catalog Pairs 2/5/6"
Cohesion: 0.07
Nodes (59): Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative (+51 more)

### Community 1 - "Analog Multiplication (Gilbert + log-domain + crossbar)"
Cohesion: 0.07
Nodes (56): Binary Tree Grammar S->1|eml(S,S), Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native, Cleanest signed scalar multiplication z=x·y; dot-products of small vectors via parallel cells, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad (+48 more)

### Community 2 - "Physical Reinterpretation of DL + Bit-Plane Encoder"
Cohesion: 0.07
Nodes (47): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y) (+39 more)

### Community 3 - "Subthreshold Score + Nonlinearity Realization"
Cohesion: 0.15
Nodes (39): Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Component D — Decoder (comparator array), Component N — Selective-passing nonlinearity (transistor I-V) (+31 more)

### Community 4 - "Symbolic Regression + EML Master + Adam"
Cohesion: 0.08
Nodes (38): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum (+30 more)

### Community 5 - "Convergence Theory + NTK + Layer-S Theorem 4"
Cohesion: 0.11
Nodes (34): Convergence to Linearity Theorem, Edgeworth Expansion (Bhattacharya & Ranga Rao), Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018), EGGROLL Rank Convergence O(r^-1), Formulation-complete check: T1+T2+T3+T4+T5+corollary, Corollary — Continual learning via three-tier memory under distribution shift, ES score-function identity: averaged S3 drift = ∇_W log E[S] (+26 more)

### Community 6 - "Analog In-Memory Attention + Gain-Cell"
Cohesion: 0.07
Nodes (33): Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention, Up to ×10^2 latency and ×10^4 energy reduction vs GPU for attention, Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC), Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM), Analog in-memory computing attention mechanism for fast and energy-efficient LLMs, Sliding-window causal attention keeps fixed M KV entries, bounding array size; layer stacking recovers global receptive field, Context-aware gating: hidden state is Query, retrieved memory is K/V; sigmoid gate α suppresses collision noise (+25 more)

### Community 7 - "Reactive Medium + Stateful Interaction Field"
Cohesion: 0.07
Nodes (32): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), NN as Structured Reactive Medium, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T) (+24 more)

### Community 8 - "KAN + Kolmogorov-Arnold Theorem"
Cohesion: 0.14
Nodes (25): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and theta of rotation gates, Barren plateaus and NP-hard VQC training (+17 more)

### Community 9 - "Formulation Layer C — Operator Definitions"
Cohesion: 0.14
Nodes (25): Operator E — Encoder (capacitor sampling + anti-alias RC), Operator S — Gaussian fitness readout (subthreshold transistor), Operator W — Linear combiner (Kirchhoff crossbar MVM), Operator I_τ — RC integrator (not symbolic, capacitor), Signal Space 𝒳 (internal node voltages, C¹), Time constant τ_x — activation RC filter (ns–μs), Key observation — Derivatives are inverse of RC integrator (physics-closed), Formulation Layer D — Deterministic Dynamics and Theorems 1-3 (+17 more)

### Community 10 - "Beyond-CMOS Neuromorphic Processor (TEXEL)"
Cohesion: 0.11
Nodes (24): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+16 more)

### Community 11 - "Geometric OOD + Manifold LID"
Cohesion: 0.22
Nodes (16): LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Geometric Explanation of the Likelihood OOD Detection Paradox, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains: math, GPU kernels, algorithms, biology, Entropic objective J_beta favoring max-reward actions, Learning to Discover at Test Time (TTT-Discover) (+8 more)

### Community 12 - "LIF Neuron + EGG (Evolved Generative GRU)"
Cohesion: 0.18
Nodes (12): LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024), NS-RAM Cell (Neuro-Synaptic RAM) (+4 more)

### Community 13 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Knowledge Gaps
- **124 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+119 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `Analog Multiplication (Gilbert + log-domain + crossbar)` to `Charge-Trap Consolidation + Catalog Pairs 2/5/6`, `Physical Reinterpretation of DL + Bit-Plane Encoder`, `Subthreshold Score + Nonlinearity Realization`, `Symbolic Regression + EML Master + Adam`, `Convergence Theory + NTK + Layer-S Theorem 4`, `Analog In-Memory Attention + Gain-Cell`, `Geometric OOD + Manifold LID`, `LIF Neuron + EGG (Evolved Generative GRU)`?**
  _High betweenness centrality (0.252) - this node is a cross-community bridge._
- **Why does `Analog in-memory computing attention mechanism for fast and energy-efficient LLMs` connect `Analog In-Memory Attention + Gain-Cell` to `Charge-Trap Consolidation + Catalog Pairs 2/5/6`?**
  _High betweenness centrality (0.125) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `Symbolic Regression + EML Master + Adam` to `Charge-Trap Consolidation + Catalog Pairs 2/5/6`, `Analog Multiplication (Gilbert + log-domain + crossbar)`, `Subthreshold Score + Nonlinearity Realization`, `Convergence Theory + NTK + Layer-S Theorem 4`, `Beyond-CMOS Neuromorphic Processor (TEXEL)`, `LIF Neuron + EGG (Evolved Generative GRU)`?**
  _High betweenness centrality (0.111) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _124 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Charge-Trap Consolidation + Catalog Pairs 2/5/6` be split into smaller, more focused modules?**
  _Cohesion score 0.07 - nodes in this community are weakly interconnected._