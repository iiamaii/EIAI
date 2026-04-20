# Graph Report - ./raw  (2026-04-20)

## Corpus Check
- 29 files · ~26,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 235 nodes · 440 edges · 13 communities detected
- Extraction: 75% EXTRACTED · 24% INFERRED · 1% AMBIGUOUS · INFERRED: 104 edges (avg confidence: 0.8)
- Token cost: 4,200 input · 6,400 output

## Community Hubs (Navigation)
- [[_COMMUNITY_ES + Symbolic Regression + Gaussian-Score Device Realization|ES + Symbolic Regression + Gaussian-Score Device Realization]]
- [[_COMMUNITY_Analog Multiplication Family (crossbar + Gilbert + log-domain)|Analog Multiplication Family (crossbar + Gilbert + log-domain)]]
- [[_COMMUNITY_Interaction Field & Learnable Physical Substrate|Interaction Field & Learnable Physical Substrate]]
- [[_COMMUNITY_Bit-Level Physics & Reinterpretation + Encoder|Bit-Level Physics & Reinterpretation + Encoder]]
- [[_COMMUNITY_Subthreshold Nonlinearity + State-Region Bridge|Subthreshold Nonlinearity + State-Region Bridge]]
- [[_COMMUNITY_LocalNon-Backprop Learning + Stage-2 Options|Local/Non-Backprop Learning + Stage-2 Options]]
- [[_COMMUNITY_Two-Timescale Bridge + Pulse-Density Encoder|Two-Timescale Bridge + Pulse-Density Encoder]]
- [[_COMMUNITY_EML Operator + Symbolic Foundations (log-domain algebra)|EML Operator + Symbolic Foundations (log-domain algebra)]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV-Cache Quantization Family]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]
- [[_COMMUNITY_Rank Convergence Proofs|Rank Convergence Proofs]]
- [[_COMMUNITY_Test-Time Discovery & World Models|Test-Time Discovery & World Models]]

## God Nodes (most connected - your core abstractions)
1. `Subthreshold Exponential Regime (primitive)` - 21 edges
2. `EGGROLL Algorithm` - 18 edges
3. `Log-Domain / Translinear Computation (primitive)` - 18 edges
4. `EML Operator eml(x,y)=exp(x)-ln(y)` - 17 edges
5. `CMOS MOSFET (Bulk-Silicon)` - 16 edges
6. `Device-Math Correspondence Catalog` - 16 edges
7. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 14 edges
8. `Component N — Selective-passing nonlinearity (transistor I-V)` - 14 edges
9. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 14 edges
10. `Component E — Encoder (bits → analog, linear injection)` - 13 edges

## Surprising Connections (you probably didn't know these)
- `Operation-First: Transition Speed = Compute Throughput` --semantically_similar_to--> `In-Memory Attention Compute (analog crossbars for KV)`  [INFERRED] [semantically similar]
  raw/Semi-Passive Physical Neural Devices.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `EML Operator eml(x,y)=exp(x)-ln(y)` --semantically_similar_to--> `Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `Exp-Log Representation (Liouville 1835)` --semantically_similar_to--> `Subthreshold Exponential Regime (primitive)`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/analog_primitive_gaps.md
- `Punch-Through Impact Ionization` --semantically_similar_to--> `Depth as Iterative Operator Flow`  [AMBIGUOUS] [semantically similar]
  raw/Synaptic and neural behaviours.pdf → raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md

## Hyperedges (group relationships)
- **Analog multiplication family: log-domain, Gilbert cell, crossbar MVM, bit-plane overlap as four implementations of one primitive** —  [INFERRED 0.85]
- **MOSFET three-regime N-option family: one device instantiates N_α (kink), N_β (subthreshold exp), N_γ (saturation) depending on bias** —  [EXTRACTED 1.00]
- **Exponential-law family: exp() is the unifying physics across log-domain, subthreshold, EML, Gaussian score, exp/log pair** —  [INFERRED 0.90]

## Communities

### Community 0 - "ES + Symbolic Regression + Gaussian-Score Device Realization"
Cohesion: 0.06
Nodes (39): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror (+31 more)

### Community 1 - "Analog Multiplication Family (crossbar + Gilbert + log-domain)"
Cohesion: 0.12
Nodes (31): Binary Tree Grammar S->1|eml(S,S), In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Topology: two cross-coupled differential pairs sharing a common tail-current source, Four-quadrant signed multiplication: I_out = (I_tail/V_T^2)·V_x·V_y for small signals, Gilbert Cell Four-Quadrant Multiplier (primitive), Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Precision regime complements crossbar: higher dynamic range, lower parallelism, signed-native (+23 more)

### Community 2 - "Interaction Field & Learnable Physical Substrate"
Cohesion: 0.09
Nodes (29): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), NN as Structured Reactive Medium, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning (+21 more)

### Community 3 - "Bit-Level Physics & Reinterpretation + Encoder"
Cohesion: 0.11
Nodes (29): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+21 more)

### Community 4 - "Subthreshold Nonlinearity + State-Region Bridge"
Cohesion: 0.18
Nodes (28): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5, One MOSFET, three regimes: V_GS<V_T→N_β subthreshold; V_T<V_GS low V_DS→N_γ saturation; V_GS>V_T high V_DS→N_α kink/punch-through, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator) (+20 more)

### Community 5 - "Local/Non-Backprop Learning + Stage-2 Options"
Cohesion: 0.11
Nodes (26): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, Event-Driven Sparse Interaction Model, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Layer-local learning (no gradient crosses D), Stage 2 Option — Score-function / ES gradient (black-box perturbation), Stage 2 Option — Surrogate / straight-through gradient (enrichment target), FPGA/ASIC Systolic Target (+18 more)

### Community 6 - "Two-Timescale Bridge + Pulse-Density Encoder"
Cohesion: 0.15
Nodes (21): Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast (+13 more)

### Community 7 - "EML Operator + Symbolic Foundations (log-domain algebra)"
Cohesion: 0.15
Nodes (20): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+12 more)

### Community 8 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 9 - "KV-Cache Quantization Family"
Cohesion: 1.0
Nodes (3): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### Community 10 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

### Community 11 - "Rank Convergence Proofs"
Cohesion: 1.0
Nodes (2): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

### Community 12 - "Test-Time Discovery & World Models"
Cohesion: 1.0
Nodes (2): Learning to Discover at Test Time, LeWorldModel (paper)

## Ambiguous Edges - Review These
- `Punch-Through Impact Ionization` → `Depth as Iterative Operator Flow`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `Kink Effect (Boudou & Doyle 1987)` → `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS]
  raw/device_math_mapping.md · relation: semantically_similar_to
- `LeWorldModel (paper)` → `Learning to Discover at Test Time`  [AMBIGUOUS]
  raw/Learning to Discover at Test Time.pdf · relation: semantically_similar_to
- `Learnable Edge Activation Functions (KAN)` → `Learning with Exact Invariances in Polynomial Time`  [AMBIGUOUS]
  raw/Learning with Exact Invariances in Polynomial Time.pdf · relation: semantically_similar_to

## Knowledge Gaps
- **82 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+77 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Rank Convergence Proofs`** (2 nodes): `Edgeworth Expansion (Bhattacharya & Ranga Rao)`, `EGGROLL Rank Convergence O(r^-1)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Test-Time Discovery & World Models`** (2 nodes): `Learning to Discover at Test Time`, `LeWorldModel (paper)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Punch-Through Impact Ionization` and `Depth as Iterative Operator Flow`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **What is the exact relationship between `Kink Effect (Boudou & Doyle 1987)` and `NNs as State-Region Dictionaries (overview)`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **What is the exact relationship between `LeWorldModel (paper)` and `Learning to Discover at Test Time`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **What is the exact relationship between `Learnable Edge Activation Functions (KAN)` and `Learning with Exact Invariances in Polynomial Time`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **Why does `Device-Math Correspondence Catalog` connect `Analog Multiplication Family (crossbar + Gilbert + log-domain)` to `ES + Symbolic Regression + Gaussian-Score Device Realization`, `Interaction Field & Learnable Physical Substrate`, `Bit-Level Physics & Reinterpretation + Encoder`, `Subthreshold Nonlinearity + State-Region Bridge`, `Two-Timescale Bridge + Pulse-Density Encoder`?**
  _High betweenness centrality (0.179) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Subthreshold Nonlinearity + State-Region Bridge` to `ES + Symbolic Regression + Gaussian-Score Device Realization`, `EML Operator + Symbolic Foundations (log-domain algebra)`?**
  _High betweenness centrality (0.158) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `ES + Symbolic Regression + Gaussian-Score Device Realization` to `Analog Multiplication Family (crossbar + Gilbert + log-domain)`, `Subthreshold Nonlinearity + State-Region Bridge`, `Local/Non-Backprop Learning + Stage-2 Options`?**
  _High betweenness centrality (0.143) - this node is a cross-community bridge._