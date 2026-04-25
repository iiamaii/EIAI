# Graph Report - ./raw  (2026-04-25)

## Corpus Check
- 42 files · ~76,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 564 nodes · 1365 edges · 13 communities detected
- Extraction: 39% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED: 94 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 61 edges
2. `Subthreshold Exponential Regime (primitive)` - 30 edges
3. `EGGROLL Algorithm` - 27 edges
4. `Theorem 4 — Learning convergence of W(t) to a local minimum W* a.s.` - 26 edges
5. `Formulation Layer D — Deterministic Dynamics and Theorems 1-3` - 25 edges
6. `Theorem 3 — Signal-Processing Completeness (Switched Volterra Representation)` - 25 edges
7. `Theorem 5 — Noise tolerance: E[‖W(∞)−W*‖²] ≤ C_H·Σσ²/η` - 23 edges
8. `FPGA Implementation Analysis (Step 9 Verification Applied)` - 23 edges
9. `Physics Correspondence Table (math ↔ device realization)` - 22 edges
10. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 21 edges

## Surprising Connections (you probably didn't know these)
- `Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical)` --semantically_similar_to--> `Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` --semantically_similar_to--> `Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)`  [INFERRED] [semantically similar]
  raw/stage2_eggroll_ppca_architecture.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Floating-Bulk Configuration` --semantically_similar_to--> `Fast Activation x(t) / Slow Weight w(t) Time-Scale Separation`  [INFERRED] [semantically similar]
  raw/Synaptic and neural behaviours.pdf → raw/Self-Organizing CMOS-Memory Architecture for Representation Learning.md
- `Bulk Bias Control Transistor (2-Transistor Cell)` --semantically_similar_to--> `Consolidation / Metaplasticity Mechanism`  [INFERRED] [semantically similar]
  raw/Synaptic and neural behaviours.pdf → raw/Self-Organizing CMOS-Memory Architecture for Representation Learning.md
- `Component W — Linear Combiner (Kirchhoff crossbar MVM)` --semantically_similar_to--> `XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf

## Hyperedges (group relationships)
- **Seven-slot 𝒞_X membership verdict for FPGA primitives** —  [1.0]
- **Four implementation modes M1/M2/M3/M4 with recommendation** —  [1.0]

## Communities

### Community 0 - "Community 0"
Cohesion: 0.04
Nodes (83): Adam Optimizer, Binary Tree Grammar S->1|eml(S,S), EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals (+75 more)

### Community 1 - "Community 1"
Cohesion: 0.08
Nodes (70): One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Component D — Decoder (comparator array), Component N — Selective-passing nonlinearity (transistor I-V), Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical), Nonlinearity Option β — Subthreshold exponential (weak inversion), Nonlinearity Option γ — Saturation square-law (≈ squared-ReLU/GELU), Shared-Silicon Dual-Read Claim (one transistor = N + D), Identity: transistor = 1-unit state-region dictionary (+62 more)

### Community 2 - "Community 2"
Cohesion: 0.09
Nodes (67): Identity: usable rank r bounded by cell resolution b, Convergence to Linearity Theorem, Edgeworth Expansion (Bhattacharya & Ranga Rao), Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018), EGGROLL Rank Convergence O(r^-1), Formulation-complete check: T1+T2+T3+T4+T5+corollary, Corollary — Continual learning via three-tier memory under distribution shift (+59 more)

### Community 3 - "Community 3"
Cohesion: 0.05
Nodes (65): Alt E: Current-Mode Direct, Alt E: Delta-Sigma 1-bit stream, Alt E: Phase-Shift Encoding, Alt N: CMOS Inverter (Sign + Schmitt), Alt N: OpAmp Hard-tanh, Alt N: Schottky Diode Knee, Alt S: Photon-Counting Score, Alt S: Pulse-Width Integrator Score (+57 more)

### Community 4 - "Community 4"
Cohesion: 0.04
Nodes (59): Adjoint Credit Field (backprop reinterpreted), 10-Axiom Formalization of Stateful NN, Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Interaction-State Layer (multi-channel node, edge-state), Physical Reinterpretation of Deep Learning (overview), NN as Structured Reactive Medium, Scattering-Kernel Interaction Model (+51 more)

### Community 5 - "Community 5"
Cohesion: 0.08
Nodes (57): Alt W: STT-MRAM crossbar, Alt Update: CBRAM (Conductive Bridge), Alt Update: FeRAM Polarization Flip, Alt Update: VCMA-MRAM Voltage Write, Slot 5: Slow Memory Update, Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA (+49 more)

### Community 6 - "Community 6"
Cohesion: 0.08
Nodes (43): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally, Rationale: Single Primitive Aesthetic/Pedagogy Value (+35 more)

### Community 7 - "Community 7"
Cohesion: 0.06
Nodes (35): Alt E: Pulse-Width Modulation, Alt W: Charge-based Gain Cell, Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention, Up to ×10^2 latency and ×10^4 energy reduction vs GPU for attention, Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC), Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM), Analog in-memory computing attention mechanism for fast and energy-efficient LLMs (+27 more)

### Community 8 - "Community 8"
Cohesion: 0.14
Nodes (25): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and theta of rotation gates, Barren plateaus and NP-hard VQC training (+17 more)

### Community 9 - "Community 9"
Cohesion: 0.11
Nodes (24): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+16 more)

### Community 10 - "Community 10"
Cohesion: 0.12
Nodes (18): Alt N: LIF Neuron, LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN) (+10 more)

### Community 11 - "Community 11"
Cohesion: 0.22
Nodes (16): LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Geometric Explanation of the Likelihood OOD Detection Paradox, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains: math, GPU kernels, algorithms, biology, Entropic objective J_beta favoring max-reward actions, Learning to Discover at Test Time (TTT-Discover) (+8 more)

### Community 12 - "Community 12"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Knowledge Gaps
- **142 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+137 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Community 12`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `Community 0` to `Community 1`, `Community 2`, `Community 3`, `Community 4`, `Community 5`, `Community 6`, `Community 7`, `Community 10`, `Community 11`?**
  _High betweenness centrality (0.311) - this node is a cross-community bridge._
- **Why does `Analog in-memory computing attention mechanism for fast and energy-efficient LLMs` connect `Community 7` to `Community 5`?**
  _High betweenness centrality (0.099) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Community 6` to `Community 0`, `Community 1`, `Community 2`, `Community 8`, `Community 10`?**
  _High betweenness centrality (0.098) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _142 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._