# Graph Report - ./raw  (2026-04-26)

## Corpus Check
- 44 files · ~100,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 641 nodes · 1540 edges · 17 communities detected
- Extraction: 50% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED: 106 edges (avg confidence: 0.79)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Alternative Catalog + Class Generalization Hub|Alternative Catalog + Class Generalization Hub]]
- [[_COMMUNITY_Layer S + EGGROLL Convergence + Stage 3a Sim Validation|Layer S + EGGROLL Convergence + Stage 3a Sim Validation]]
- [[_COMMUNITY_Subthreshold + MOSFET Three-Regime + Analog Primitives|Subthreshold + MOSFET Three-Regime + Analog Primitives]]
- [[_COMMUNITY_Three-Tier Memory + 2026 Neuromorphic Survey|Three-Tier Memory + 2026 Neuromorphic Survey]]
- [[_COMMUNITY_PPCA Physical Functional Simulator (Stage 3a code)|PPCA Physical Functional Simulator (Stage 3a code)]]
- [[_COMMUNITY_Bit-Plane Encoder + Physical Reinterpretation|Bit-Plane Encoder + Physical Reinterpretation]]
- [[_COMMUNITY_Beyond-CMOS TEXEL + Latest Neuromorphic Research|Beyond-CMOS TEXEL + Latest Neuromorphic Research]]
- [[_COMMUNITY_PPCA NumPy Behavioral Twin (Stage 3a sim docs)|PPCA NumPy Behavioral Twin (Stage 3a sim docs)]]
- [[_COMMUNITY_Log-Domain + EML + KAN|Log-Domain + EML + KAN]]
- [[_COMMUNITY_Layer CD Theorems + Theory Chains 1-3 + Catalog|Layer C/D Theorems + Theory Chains 1-3 + Catalog]]
- [[_COMMUNITY_PPCA sim helper code (ppca_sim.py)|PPCA sim helper code (ppca_sim.py)]]
- [[_COMMUNITY_Composition Theorem + Bit-Analog Formulation|Composition Theorem + Bit-Analog Formulation]]
- [[_COMMUNITY_Analog Physical NN Major Cases (2026 survey)|Analog Physical NN Major Cases (2026 survey)]]
- [[_COMMUNITY_CMOS Inverter + alt N candidates|CMOS Inverter + alt N candidates]]
- [[_COMMUNITY_Self-Organizing CMOS-Memory + Reactive Medium|Self-Organizing CMOS-Memory + Reactive Medium]]
- [[_COMMUNITY_KAN Edge Functions + KAT Theorem|KAN Edge Functions + KAT Theorem]]
- [[_COMMUNITY_Matrix Gaussian ES (residual)|Matrix Gaussian ES (residual)]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 61 edges
2. `Theorem 4 — Learning convergence of W(t) to a local minimum W* a.s.` - 30 edges
3. `EGGROLL Algorithm` - 29 edges
4. `Subthreshold Exponential Regime (primitive)` - 29 edges
5. `Theorem 5 — Noise tolerance: E[‖W(∞)−W*‖²] ≤ C_H·Σσ²/η` - 26 edges
6. `Formulation Layer D — Deterministic Dynamics and Theorems 1-3` - 25 edges
7. `Theorem 3 — Signal-Processing Completeness (Switched Volterra Representation)` - 25 edges
8. `FPGA Implementation Analysis (Step 9 Verification Applied)` - 23 edges
9. `Physics Correspondence Table (math ↔ device realization)` - 22 edges
10. `Rank-r Perturbation Structure` - 21 edges

## Surprising Connections (you probably didn't know these)
- `Component W — Linear Combiner (Kirchhoff crossbar MVM)` --semantically_similar_to--> `XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical)` --semantically_similar_to--> `Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/Binarized Neural Networks.pdf
- `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` --semantically_similar_to--> `Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)`  [INFERRED] [semantically similar]
  raw/stage2_eggroll_ppca_architecture.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Stage 2 Option — Layer-local learning (no gradient crosses D)` --semantically_similar_to--> `Each block trained independently with only local backprop — no global forward or backward pass across blocks`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/NOPROP- TRAINING NEURAL NETWORKS WITHOUT FULL BACK-PROPAGATION OR FULL FORWARD-PROPAGATION.pdf
- `Stage 2 Option — Layer-local learning (no gradient crosses D)` --semantically_similar_to--> `GHL update: Δw_ik = η · sign(∂L/∂w_ik) · |u_k · (x_i − y_k w_ik)| — local Oja+SWTA magnitude × global gradient-sign direction`  [INFERRED] [semantically similar]
  raw/bit_analog_formulation_v1.md → raw/HEBBIAN LEARNING WITH GLOBAL DIRECTION.pdf

## Hyperedges (group relationships)
- **Stage 3a EGGROLL-PPCA validation suite (simulator + 5 docs + 3 Layer-S predictions)** —  [EXTRACTED]
- **Neuromorphic 2026 survey chunks (3 survey docs + linked device/architecture nodes)** —  [EXTRACTED]

## Communities

### Community 0 - "Alternative Catalog + Class Generalization Hub"
Cohesion: 0.04
Nodes (78): Alt S: Photon-Counting Score, Alt S: Pulse-Width Integrator Score, Alt S: Delay-Line Race Logic Score, Alt W: Charge-based Gain Cell, Alt W: STT-MRAM crossbar, Alt W: PCM crossbar, Alt W: Photonic MZI Mesh, Alt Power: Biopotential (+70 more)

### Community 1 - "Layer S + EGGROLL Convergence + Stage 3a Sim Validation"
Cohesion: 0.07
Nodes (73): Convergence to Linearity Theorem, Edgeworth Expansion (Bhattacharya & Ranga Rao), Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018), EGGROLL Rank Convergence O(r^-1), Formulation-complete check: T1+T2+T3+T4+T5+corollary, Corollary — Continual learning via three-tier memory under distribution shift, ES score-function identity: averaged S3 drift = ∇_W log E[S] (+65 more)

### Community 2 - "Subthreshold + MOSFET Three-Regime + Analog Primitives"
Cohesion: 0.09
Nodes (68): One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Component N — Selective-passing nonlinearity (transistor I-V), Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical), Nonlinearity Option β — Subthreshold exponential (weak inversion), Nonlinearity Option γ — Saturation square-law (≈ squared-ReLU/GELU), Identity: transistor = 1-unit state-region dictionary, Pair 7: Kink Effect ↔ ReLU Polytope Boundary, Test: piecewise-affine fit of stacked-transistor I-O (+60 more)

### Community 3 - "Three-Tier Memory + 2026 Neuromorphic Survey"
Cohesion: 0.07
Nodes (66): Alt Update: CBRAM (Conductive Bridge), Alt Update: FeRAM Polarization Flip, Alt Update: VCMA-MRAM Voltage Write, Slot 5: Slow Memory Update, Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA (+58 more)

### Community 4 - "PPCA Physical Functional Simulator (Stage 3a code)"
Cohesion: 0.08
Nodes (30): AnalogEncoder, clip(), Consolidator, eval_dataset(), main(), make_task(), matvec(), mean_curve() (+22 more)

### Community 5 - "Bit-Plane Encoder + Physical Reinterpretation"
Cohesion: 0.06
Nodes (42): Adjoint Credit Field (backprop reinterpreted), 10-Axiom Formalization of Stateful NN, Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Interaction-State Layer (multi-channel node, edge-state), Physical Reinterpretation of Deep Learning (overview), NN as Structured Reactive Medium, Scattering-Kernel Interaction Model (+34 more)

### Community 6 - "Beyond-CMOS TEXEL + Latest Neuromorphic Research"
Cohesion: 0.06
Nodes (41): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+33 more)

### Community 7 - "PPCA NumPy Behavioral Twin (Stage 3a sim docs)"
Cohesion: 0.06
Nodes (40): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad, EGGROLL (Korean Translation), Evolution Strategies (ES) (+32 more)

### Community 8 - "Log-Domain + EML + KAN"
Cohesion: 0.09
Nodes (37): Binary Tree Grammar S->1|eml(S,S), EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+29 more)

### Community 9 - "Layer C/D Theorems + Theory Chains 1-3 + Catalog"
Cohesion: 0.12
Nodes (35): Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native, Cleanest signed scalar multiplication z=x·y; dot-products of small vectors via parallel cells, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Catalog Absorption — 8-pair mapping ⇒ 4-slot schema + pending learning rule (+27 more)

### Community 10 - "PPCA sim helper code (ppca_sim.py)"
Cohesion: 0.17
Nodes (26): add_scaled(), apply_delta(), clip(), default_experiments(), effective_noise(), ensure_dir(), frob_mse(), lambda_min_cov() (+18 more)

### Community 11 - "Composition Theorem + Bit-Analog Formulation"
Cohesion: 0.12
Nodes (26): Composition Theorem — (E_binary,W,N_kink|Vk=∞,D) = XNOR-popcount MAC, Component D — Decoder (comparator array), Invariant 1 — E is a linear injection, Invariant 2 — W preserves E's linearity, Invariant 3 — N sign-commutes with thresholding (monotone), Invariant 4 — D reuses the same transistor as N, Bit-Analog Formulation v1 (E,W,N,D Quadruple), State-Transition Quadruple (E,W,N,D) Schema (+18 more)

### Community 12 - "Analog Physical NN Major Cases (2026 survey)"
Cohesion: 0.1
Nodes (21): Alt E: Current-Mode Direct, Alt E: Delta-Sigma 1-bit stream, Alt E: Phase-Shift Encoding, Alt E: Pulse-Width Modulation, Slot 4: Input Signal Encoding (E), Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention, Up to ×10^2 latency and ×10^4 energy reduction vs GPU for attention (+13 more)

### Community 13 - "CMOS Inverter + alt N candidates"
Cohesion: 0.12
Nodes (17): Alt N: CMOS Inverter (Sign + Schmitt), Alt N: LIF Neuron, Alt N: OpAmp Hard-tanh, Alt N: Schottky Diode Knee, Slot 2: Non-Linear Activation (N), LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG (+9 more)

### Community 14 - "Self-Organizing CMOS-Memory + Reactive Medium"
Cohesion: 0.2
Nodes (11): CMOS-Centered + RAM-like Memory Hybrid Architecture, Feeding Protocol as Part of Learning Law, Self-Organizing CMOS-Memory Architecture (overview), Rationale: disambiguating 'device' between memory device and transistor primitive, Trainable Analog Circuit with Gate-Bias Parameters, Analog VLSI / Neuromorphic Engineering Lineage, EGGROLL Connection (perturbation-response-fitness), Semi-Passive Physical Neural Devices (overview) (+3 more)

### Community 15 - "KAN Edge Functions + KAT Theorem"
Cohesion: 0.27
Nodes (11): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), KAN Kolmogorov-Arnold Networks (Liu et al.), Why KAN edge-functions and exact invariances are disjoint topics (+3 more)

### Community 16 - "Matrix Gaussian ES (residual)"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Knowledge Gaps
- **140 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+135 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES (residual)`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `Alternative Catalog + Class Generalization Hub` to `Layer S + EGGROLL Convergence + Stage 3a Sim Validation`, `Subthreshold + MOSFET Three-Regime + Analog Primitives`, `Three-Tier Memory + 2026 Neuromorphic Survey`, `Bit-Plane Encoder + Physical Reinterpretation`, `PPCA NumPy Behavioral Twin (Stage 3a sim docs)`, `Log-Domain + EML + KAN`, `Layer C/D Theorems + Theory Chains 1-3 + Catalog`, `Composition Theorem + Bit-Analog Formulation`, `Analog Physical NN Major Cases (2026 survey)`, `CMOS Inverter + alt N candidates`?**
  _High betweenness centrality (0.232) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `PPCA NumPy Behavioral Twin (Stage 3a sim docs)` to `Alternative Catalog + Class Generalization Hub`, `Layer S + EGGROLL Convergence + Stage 3a Sim Validation`, `Three-Tier Memory + 2026 Neuromorphic Survey`, `Beyond-CMOS TEXEL + Latest Neuromorphic Research`, `Log-Domain + EML + KAN`, `Layer C/D Theorems + Theory Chains 1-3 + Catalog`, `CMOS Inverter + alt N candidates`?**
  _High betweenness centrality (0.077) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Log-Domain + EML + KAN` to `Layer S + EGGROLL Convergence + Stage 3a Sim Validation`, `Subthreshold + MOSFET Three-Regime + Analog Primitives`, `Three-Tier Memory + 2026 Neuromorphic Survey`, `PPCA NumPy Behavioral Twin (Stage 3a sim docs)`, `Composition Theorem + Bit-Analog Formulation`, `CMOS Inverter + alt N candidates`?**
  _High betweenness centrality (0.064) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `Theorem 4 — Learning convergence of W(t) to a local minimum W* a.s.` (e.g. with `Executive summary - basic feasibility passes; T5 proxy underexplains low-noise floor (estimator/baseline/rank bias missing)` and `Final verdict (KR): EGGROLL-PPCA passes behavioral feasibility; next gates are calibrated noise budget + tile-decorrelated physical prototype`) actually correct?**
  _`Theorem 4 — Learning convergence of W(t) to a local minimum W* a.s.` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _140 weakly-connected nodes found - possible documentation gaps or missing edges._