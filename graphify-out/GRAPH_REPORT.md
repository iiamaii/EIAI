# Graph Report - ./raw  (2026-04-22)

## Corpus Check
- 30 files · ~35,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 333 nodes · 648 edges · 16 communities detected
- Extraction: 54% EXTRACTED · 13% INFERRED · 0% AMBIGUOUS · INFERRED: 87 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Substrate + Consolidation + Reactive Medium|Substrate + Consolidation + Reactive Medium]]
- [[_COMMUNITY_Analog In-Memory Attention (body-extracted)|Analog In-Memory Attention (body-extracted)]]
- [[_COMMUNITY_Analog Multiplication Family (Gilbert + log-domain + crossbar)|Analog Multiplication Family (Gilbert + log-domain + crossbar)]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|Subthreshold Score + Nonlinearity Realization]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem (body-extracted)|KAN + Kolmogorov-Arnold Theorem (body-extracted)]]
- [[_COMMUNITY_Symbolic Regression + EML Master Formula + Adam|Symbolic Regression + EML Master Formula + Adam]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor (body-extracted)|Beyond-CMOS Neuromorphic Processor (body-extracted)]]
- [[_COMMUNITY_Physical Reinterpretation of DL|Physical Reinterpretation of DL]]
- [[_COMMUNITY_Formulation v1 Canonical + Composition Theorem|Formulation v1 Canonical + Composition Theorem]]
- [[_COMMUNITY_EML + Log-Domain Algebra|EML + Log-Domain Algebra]]
- [[_COMMUNITY_Floating-Bulk RC + LIF Subthreshold + Pair 5|Floating-Bulk RC + LIF Subthreshold + Pair 5]]
- [[_COMMUNITY_Stateful Interaction Field|Stateful Interaction Field]]
- [[_COMMUNITY_Geometric OOD + Manifold LID (body-extracted)|Geometric OOD + Manifold LID (body-extracted)]]
- [[_COMMUNITY_Binarized NN + XNOR Pipeline (body-extracted)|Binarized NN + XNOR Pipeline (body-extracted)]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]

## God Nodes (most connected - your core abstractions)
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 39 edges
2. `Subthreshold Exponential Regime (primitive)` - 24 edges
3. `EGGROLL Algorithm` - 22 edges
4. `Log-Domain / Translinear Computation (primitive)` - 19 edges
5. `EML Operator eml(x,y)=exp(x)-ln(y)` - 18 edges
6. `CMOS MOSFET (Bulk-Silicon)` - 18 edges
7. `Device-Math Correspondence Catalog` - 18 edges
8. `Component N — Selective-passing nonlinearity (transistor I-V)` - 17 edges
9. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 16 edges
10. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 15 edges

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
- **KV-cache compression family (post body-extraction)** —  [EXTRACTED 1.00]
- **Spectral-theoretic polynomial-time invariance pipeline** —  [1.0]
- **KAT -> learnable edges -> basis parameterization -> trainability** —  [1.0]
- **TTT-Discover = entropic objective + PUCT reuse + test-time gradient steps** —  [1.0]
- **VQC training: angle encoding + PQC + parameter shift + hybrid loop** —  [1.0]
- **hyper_neuromorphic_hardware_trio** — cmos_integrated_organic_neuromorphic_imagers_for_high_resolution_dual_modal_imaging_main, a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_main, synaptic_and_neural_behaviours_pdf_memristor, synaptic_and_neural_behaviours_pdf_phase_change_memory, synaptic_and_neural_behaviours_pdf_ns_ram_cell [0.85]
- **hyper_latent_geometry_cluster** — leworldmodel_sigreg_anticollapse, a_geometric_explanation_of_the_likelihood_ood_detection_paradox_manifold_geometry, a_geometric_explanation_of_the_likelihood_ood_detection_paradox_lid_score_rank, stage2_eggroll_ppca_main, neural_networks_as_state_region_dictionaries_jacobian_conditioning [0.8]

## Communities

### Community 0 - "Substrate + Consolidation + Reactive Medium"
Cohesion: 0.08
Nodes (41): NN as Structured Reactive Medium, Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative, Pair 6: Single-Cell Two-Timescale ↔ Fast/Slow LR (+33 more)

### Community 1 - "Analog In-Memory Attention (body-extracted)"
Cohesion: 0.07
Nodes (33): Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling, Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention, Up to ×10^2 latency and ×10^4 energy reduction vs GPU for attention, Charge-based gain cell: capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC), Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM), Analog in-memory computing attention mechanism for fast and energy-efficient LLMs, Sliding-window causal attention keeps fixed M KV entries, bounding array size; layer stacking recovers global receptive field, Context-aware gating: hidden state is Query, retrieved memory is K/V; sigmoid gate α suppresses collision noise (+25 more)

### Community 2 - "Analog Multiplication Family (Gilbert + log-domain + crossbar)"
Cohesion: 0.13
Nodes (32): Binary Tree Grammar S->1|eml(S,S), Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native, Cleanest signed scalar multiplication z=x·y; dot-products of small vectors via parallel cells, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad (+24 more)

### Community 3 - "Subthreshold Score + Nonlinearity Realization"
Cohesion: 0.18
Nodes (29): Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Component N — Selective-passing nonlinearity (transistor I-V) (+21 more)

### Community 4 - "KAN + Kolmogorov-Arnold Theorem (body-extracted)"
Cohesion: 0.14
Nodes (25): B-spline basis parameterization per edge, Claimed advantages: interpretability, parameter efficiency, sample/convergence gains, Kolmogorov-Arnold representation theorem (KAT), Learnable univariate activations on edges (vs fixed MLP node activations), A Practitioner's Guide to Kolmogorov-Arnold Networks, Trainability via smooth differentiable basis (modernizes pathological KAT), Angle-rotation data encoding and theta of rotation gates, Barren plateaus and NP-hard VQC training (+17 more)

### Community 5 - "Symbolic Regression + EML Master Formula + Adam"
Cohesion: 0.09
Nodes (24): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum, Test: 2-transistor EGGROLL vs FP logistic regression (+16 more)

### Community 6 - "Beyond-CMOS Neuromorphic Processor (body-extracted)"
Cohesion: 0.11
Nodes (24): BEOL differential interface for two- and three-terminal memristors, Bistable binary plastic synapse with analog internal weight, TEXEL: Mixed-Signal Neuromorphic Processor for Beyond-CMOS Integration, BiCaLL on-chip local learning rule (STDP + Hebbian/SRDP), Subthreshold analog + event-driven asynchronous architecture, Charge recombination-trapping dynamics as tunable memory mechanism, Dual-modal operation: static frame + dynamic synaptic, Hybrid CMOS + organic BHJ device stack (+16 more)

### Community 7 - "Physical Reinterpretation of DL"
Cohesion: 0.13
Nodes (22): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Component E — Encoder (bits → analog, linear injection), Encoder Option A — Bit-plane weighted charge (canonical) (+14 more)

### Community 8 - "Formulation v1 Canonical + Composition Theorem"
Cohesion: 0.16
Nodes (22): Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree, Composition Theorem — (E_binary,W,N_kink|Vk=∞,D) = XNOR-popcount MAC, Component D — Decoder (comparator array), Invariant 1 — E is a linear injection, Invariant 2 — W preserves E's linearity, Invariant 3 — N sign-commutes with thresholding (monotone), Invariant 4 — D reuses the same transistor as N (+14 more)

### Community 9 - "EML + Log-Domain Algebra"
Cohesion: 0.16
Nodes (20): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally, Rationale: Single Primitive Aesthetic/Pedagogy Value (+12 more)

### Community 10 - "Floating-Bulk RC + LIF Subthreshold + Pair 5"
Cohesion: 0.12
Nodes (17): LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN), Bulk Bias Control Transistor (2-Transistor Cell) (+9 more)

### Community 11 - "Stateful Interaction Field"
Cohesion: 0.14
Nodes (16): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### Community 12 - "Geometric OOD + Manifold LID (body-extracted)"
Cohesion: 0.22
Nodes (16): LID-via-score-rank estimator (Jacobian/score quantity), Dual-criterion OOD detector: high likelihood AND high LID, Geometric Explanation of the Likelihood OOD Detection Paradox, Manifold hypothesis and the density-vs-mass distinction, Discovery vs standard-RL-inference distinction, Continuous-reward discovery domains: math, GPU kernels, algorithms, biology, Entropic objective J_beta favoring max-reward actions, Learning to Discover at Test Time (TTT-Discover) (+8 more)

### Community 13 - "Binarized NN + XNOR Pipeline (body-extracted)"
Cohesion: 0.29
Nodes (7): Binary matmul GPU kernel: 7× speedup on MNIST BNN without accuracy loss, Binarized Neural Networks (Hubara, Courbariaux, Soudry, El-Yaniv, Bengio 2016), Real-valued weight accumulators kept during training; clipped to [-1,1]; binarized only for forward/gradient compute, Shift-based BatchNorm and shift-based AdaMax: multiplies replaced by power-of-2 bit-shifts (AP2), Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x), Straight-through estimator (STE): gr = gq · 1_{|r|≤1}; gradient of sign() treated as gradient of hard-tanh, XNOR + popcount replaces floating-point MAC: {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))

### Community 14 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 15 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

## Ambiguous Edges - Review These
- `Punch-Through Impact Ionization` → `Depth as Iterative Operator Flow`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `Kink Effect (Boudou & Doyle 1987)` → `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to

## Knowledge Gaps
- **117 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+112 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Punch-Through Impact Ionization` and `Depth as Iterative Operator Flow`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **What is the exact relationship between `Kink Effect (Boudou & Doyle 1987)` and `NNs as State-Region Dictionaries (overview)`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **Why does `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` connect `Formulation v1 Canonical + Composition Theorem` to `Substrate + Consolidation + Reactive Medium`, `Analog In-Memory Attention (body-extracted)`, `Analog Multiplication Family (Gilbert + log-domain + crossbar)`, `Subthreshold Score + Nonlinearity Realization`, `Symbolic Regression + EML Master Formula + Adam`, `Physical Reinterpretation of DL`, `EML + Log-Domain Algebra`, `Floating-Bulk RC + LIF Subthreshold + Pair 5`, `Geometric OOD + Manifold LID (body-extracted)`?**
  _High betweenness centrality (0.322) - this node is a cross-community bridge._
- **Why does `Device-Math Correspondence Catalog` connect `Analog Multiplication Family (Gilbert + log-domain + crossbar)` to `Substrate + Consolidation + Reactive Medium`, `Subthreshold Score + Nonlinearity Realization`, `KAN + Kolmogorov-Arnold Theorem (body-extracted)`, `Symbolic Regression + EML Master Formula + Adam`, `Formulation v1 Canonical + Composition Theorem`, `EML + Log-Domain Algebra`, `Floating-Bulk RC + LIF Subthreshold + Pair 5`?**
  _High betweenness centrality (0.161) - this node is a cross-community bridge._
- **Are the 6 inferred relationships involving `Subthreshold Exponential Regime (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `Exp-Log Representation (Liouville 1835)`) actually correct?**
  _`Subthreshold Exponential Regime (primitive)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 5 INFERRED edges - model-reasoned connections that need verification._
- **Are the 9 inferred relationships involving `Log-Domain / Translinear Computation (primitive)` (e.g. with `EML Operator eml(x,y)=exp(x)-ln(y)` and `EDL Operator edl(x,y)=exp(x)/ln(y)`) actually correct?**
  _`Log-Domain / Translinear Computation (primitive)` has 9 INFERRED edges - model-reasoned connections that need verification._