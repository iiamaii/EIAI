# Graph Report - ./raw  (2026-04-26)

## Corpus Check
- 33 files · ~70,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 508 nodes · 1275 edges · 13 communities detected
- Extraction: 40% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED: 89 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Three-Tier Memory + Charge-Trap Consolidation|Three-Tier Memory + Charge-Trap Consolidation]]
- [[_COMMUNITY_EGGROLL-PPCA Architecture Hub|EGGROLL-PPCA Architecture Hub]]
- [[_COMMUNITY_FPGA Analysis + Alternative Catalog + Class Generalization|FPGA Analysis + Alternative Catalog + Class Generalization]]
- [[_COMMUNITY_Layer S Stochastic + T4-T5 + EGGROLL Convergence|Layer S Stochastic + T4-T5 + EGGROLL Convergence]]
- [[_COMMUNITY_Subthreshold Nonlinearity + MOSFET Three Regimes|Subthreshold Nonlinearity + MOSFET Three Regimes]]
- [[_COMMUNITY_Log-Domain Multiplication + EML + KAN|Log-Domain Multiplication + EML + KAN]]
- [[_COMMUNITY_Layer D Deterministic Theorems + Theory Chains 1-2|Layer D Deterministic Theorems + Theory Chains 1-2]]
- [[_COMMUNITY_Layer C Symbolic + Physics Correspondence|Layer C Symbolic + Physics Correspondence]]
- [[_COMMUNITY_Beyond-CMOS TEXEL + NoProp + Hebbian|Beyond-CMOS TEXEL + NoProp + Hebbian]]
- [[_COMMUNITY_Stateful Interaction Field + Primitive Geometry|Stateful Interaction Field + Primitive Geometry]]
- [[_COMMUNITY_KAN Edge Functions + Kolmogorov-Arnold|KAN Edge Functions + Kolmogorov-Arnold]]
- [[_COMMUNITY_Symbolic Regression + Adam|Symbolic Regression + Adam]]
- [[_COMMUNITY_Matrix Gaussian ES (residual)|Matrix Gaussian ES (residual)]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 59 edges
2. `Subthreshold Exponential Regime (primitive)` - 29 edges
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
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Triangular structure: log-domain (algebra), Gilbert (topology), subthreshold exp (device regime) are three views of one fact`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md

## Hyperedges (group relationships)
- **Seven-slot 𝒞_X membership verdict for FPGA primitives** —  [1.0]
- **Four implementation modes M1/M2/M3/M4 with recommendation** —  [1.0]

## Communities

### Community 0 - "Three-Tier Memory + Charge-Trap Consolidation"
Cohesion: 0.05
Nodes (82): NN as Structured Reactive Medium, Alt W: STT-MRAM crossbar, Alt Update: CBRAM (Conductive Bridge), Alt Update: FeRAM Polarization Flip, Alt Update: VCMA-MRAM Voltage Write, Slot 5: Slow Memory Update, Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight (+74 more)

### Community 1 - "EGGROLL-PPCA Architecture Hub"
Cohesion: 0.05
Nodes (78): Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native, Cleanest signed scalar multiplication z=x·y; dot-products of small vectors via parallel cells, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad, Binary matmul GPU kernel: 7× speedup on MNIST BNN without accuracy loss (+70 more)

### Community 2 - "FPGA Analysis + Alternative Catalog + Class Generalization"
Cohesion: 0.05
Nodes (68): Alt E: Current-Mode Direct, Alt E: Delta-Sigma 1-bit stream, Alt E: Phase-Shift Encoding, Alt E: Pulse-Width Modulation, Alt N: CMOS Inverter (Sign + Schmitt), Alt N: OpAmp Hard-tanh, Alt N: Schottky Diode Knee, Alt S: Photon-Counting Score (+60 more)

### Community 3 - "Layer S Stochastic + T4-T5 + EGGROLL Convergence"
Cohesion: 0.09
Nodes (63): Identity: usable rank r bounded by cell resolution b, Convergence to Linearity Theorem, Edgeworth Expansion (Bhattacharya & Ranga Rao), Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018), EGGROLL Rank Convergence O(r^-1), ES score-function identity: averaged S3 drift = ∇_W log E[S], Formulation Layer S — Stochastic Dynamics and Theorems 4-5 (+55 more)

### Community 4 - "Subthreshold Nonlinearity + MOSFET Three Regimes"
Cohesion: 0.13
Nodes (45): Alt N: LIF Neuron, LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp (main), Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5 (+37 more)

### Community 5 - "Log-Domain Multiplication + EML + KAN"
Cohesion: 0.07
Nodes (42): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binary Tree Grammar S->1|eml(S,S), EDL Operator edl(x,y)=exp(x)/ln(y) (+34 more)

### Community 6 - "Layer D Deterministic Theorems + Theory Chains 1-2"
Cohesion: 0.11
Nodes (40): Operator E — Encoder (capacitor sampling + anti-alias RC), Operator S — Gaussian fitness readout (subthreshold transistor), Operator W — Linear combiner (Kirchhoff crossbar MVM), Operator I_τ — RC integrator (not symbolic, capacitor), Signal Space 𝒳 (internal node voltages, C¹), Time constant τ_x — activation RC filter (ns–μs), Section 5 claim — Euler discretization reduces (D1)–(D3) to NN + EGGROLL, Key observation — Derivatives are inverse of RC integrator (physics-closed) (+32 more)

### Community 7 - "Layer C Symbolic + Physics Correspondence"
Cohesion: 0.1
Nodes (32): Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, Composition Theorem — (E_binary,W,N_kink|Vk=∞,D) = XNOR-popcount MAC, Component D — Decoder (comparator array), Invariant 1 — E is a linear injection, Invariant 2 — W preserves E's linearity, Invariant 3 — N sign-commutes with thresholding (monotone), Invariant 4 — D reuses the same transistor as N, Bit-Analog Formulation v1 (E,W,N,D Quadruple) (+24 more)

### Community 8 - "Beyond-CMOS TEXEL + NoProp + Hebbian"
Cohesion: 0.11
Nodes (24): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+16 more)

### Community 9 - "Stateful Interaction Field + Primitive Geometry"
Cohesion: 0.14
Nodes (16): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### Community 10 - "KAN Edge Functions + Kolmogorov-Arnold"
Cohesion: 0.27
Nodes (11): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), KAN Kolmogorov-Arnold Networks (Liu et al.), Why KAN edge-functions and exact invariances are disjoint topics (+3 more)

### Community 11 - "Symbolic Regression + Adam"
Cohesion: 0.4
Nodes (5): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees

### Community 12 - "Matrix Gaussian ES (residual)"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Knowledge Gaps
- **123 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+118 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES (residual)`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `EGGROLL-PPCA Architecture Hub` to `Three-Tier Memory + Charge-Trap Consolidation`, `FPGA Analysis + Alternative Catalog + Class Generalization`, `Layer S Stochastic + T4-T5 + EGGROLL Convergence`, `Subthreshold Nonlinearity + MOSFET Three Regimes`, `Log-Domain Multiplication + EML + KAN`, `Layer D Deterministic Theorems + Theory Chains 1-2`, `Layer C Symbolic + Physics Correspondence`?**
  _High betweenness centrality (0.290) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `EGGROLL-PPCA Architecture Hub` to `Three-Tier Memory + Charge-Trap Consolidation`, `Layer S Stochastic + T4-T5 + EGGROLL Convergence`, `Subthreshold Nonlinearity + MOSFET Three Regimes`, `Layer D Deterministic Theorems + Theory Chains 1-2`, `Layer C Symbolic + Physics Correspondence`, `Beyond-CMOS TEXEL + NoProp + Hebbian`, `Symbolic Regression + Adam`?**
  _High betweenness centrality (0.104) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Subthreshold Nonlinearity + MOSFET Three Regimes` to `Three-Tier Memory + Charge-Trap Consolidation`, `EGGROLL-PPCA Architecture Hub`, `Layer S Stochastic + T4-T5 + EGGROLL Convergence`, `Log-Domain Multiplication + EML + KAN`, `Layer D Deterministic Theorems + Theory Chains 1-2`, `Layer C Symbolic + Physics Correspondence`?**
  _High betweenness centrality (0.095) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _123 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Three-Tier Memory + Charge-Trap Consolidation` be split into smaller, more focused modules?**
  _Cohesion score 0.05 - nodes in this community are weakly interconnected._