# Graph Report - ./raw  (2026-04-22)

## Corpus Check
- 30 files · ~29,500 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 258 nodes · 559 edges · 13 communities detected
- Extraction: 59% EXTRACTED · 19% INFERRED · 1% AMBIGUOUS · INFERRED: 104 edges (avg confidence: 0.8)
- Token cost: 6,200 input · 8,400 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)|Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)]]
- [[_COMMUNITY_Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)|Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)]]
- [[_COMMUNITY_Consolidation & Two-Timescale Hub (charge-trap + PPCA Phase 6 + Pair 256)|Consolidation & Two-Timescale Hub (charge-trap + PPCA Phase 6 + Pair 2/5/6)]]
- [[_COMMUNITY_Bit-Level Physics & Encoder|Bit-Level Physics & Encoder]]
- [[_COMMUNITY_EGGROLL + Symbolic Regression + PPCA Outer Loop|EGGROLL + Symbolic Regression + PPCA Outer Loop]]
- [[_COMMUNITY_Physical Substrate & Interaction Field|Physical Substrate & Interaction Field]]
- [[_COMMUNITY_EML + Log-Domain Arithmetic Family|EML + Log-Domain Arithmetic Family]]
- [[_COMMUNITY_LocalNon-Backprop Learning + PPCA Rejections|Local/Non-Backprop Learning + PPCA Rejections]]
- [[_COMMUNITY_Punch-Through ES Fast-Weight + LIF|Punch-Through ES Fast-Weight + LIF]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV-Cache Quantization Family]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]
- [[_COMMUNITY_Test-Time Discovery & World Models|Test-Time Discovery & World Models]]

## God Nodes (most connected - your core abstractions)
1. `Subthreshold Exponential Regime (primitive)` - 23 edges
2. `EGGROLL Algorithm` - 21 edges
3. `Log-Domain / Translinear Computation (primitive)` - 20 edges
4. `CMOS MOSFET (Bulk-Silicon)` - 18 edges
5. `Device-Math Correspondence Catalog` - 18 edges
6. `EML Operator eml(x,y)=exp(x)-ln(y)` - 17 edges
7. `Component N — Selective-passing nonlinearity (transistor I-V)` - 17 edges
8. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 16 edges
9. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 15 edges
10. `Component E — Encoder (bits → analog, linear injection)` - 15 edges

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
- **stage2_closure_hyperedge** —  [0.95]
- **eggroll_ppca_operational_cycle** —  [1.0]

## Communities

### Community 0 - "Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)"
Cohesion: 0.12
Nodes (35): Binary Tree Grammar S->1|eml(S,S), In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Strip of max(m,n) Gilbert cells evaluates outer product a_i·b_j one row/column at a time, Role in EGGROLL-PPCA: translinear current multipliers realize S·a_i·b_j per transistor-quad, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Catalog Absorption — 8-pair mapping ⇒ 4-slot schema + pending learning rule, Component W — Linear Combiner (Kirchhoff crossbar MVM) (+27 more)

### Community 1 - "Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)"
Cohesion: 0.15
Nodes (34): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Gaussian-score-native: exp(−r²/2σ²) realized by one subthreshold transistor with biased V_GS, Fills N_β placeholder from formulation v1: subthreshold regime of the same MOSFET realizing N_α, Sigmoid-native: I_D/(I_D+I_ref) = 1/(1+exp(−V_GS/n·V_T)) with only a current mirror, Softmax-native: K subthreshold transistors at a normalizing node yield exp(V_k)/Σexp(V_j), Subthreshold Exponential Regime (primitive), Subthreshold I–V: I_D = I_0·exp(V_GS/n·V_T)·(1−exp(−V_DS/V_T)), n≈1.3–1.5 (+26 more)

### Community 2 - "Consolidation & Two-Timescale Hub (charge-trap + PPCA Phase 6 + Pair 2/5/6)"
Cohesion: 0.11
Nodes (32): Encoder Option B — Pulse-density (unary, Hamming weight), Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast (+24 more)

### Community 3 - "Bit-Level Physics & Encoder"
Cohesion: 0.11
Nodes (30): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+22 more)

### Community 4 - "EGGROLL + Symbolic Regression + PPCA Outer Loop"
Cohesion: 0.1
Nodes (27): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Score-function / ES gradient (black-box perturbation), Stage 2 Option — Surrogate / straight-through gradient (enrichment target) (+19 more)

### Community 5 - "Physical Substrate & Interaction Field"
Cohesion: 0.1
Nodes (26): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), NN as Structured Reactive Medium, Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning (+18 more)

### Community 6 - "EML + Log-Domain Arithmetic Family"
Cohesion: 0.11
Nodes (26): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+18 more)

### Community 7 - "Local/Non-Backprop Learning + PPCA Rejections"
Cohesion: 0.13
Nodes (24): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, Event-Driven Sparse Interaction Model, Stage 2 Option — Layer-local learning (no gradient crosses D), FPGA/ASIC Systolic Target, Hybrid CMOS + Organic Neuromorphic Device Stack, CMOS-Integrated Organic Neuromorphic Imagers, Local Hebbian Rule Modulated by Global Direction Signal (+16 more)

### Community 8 - "Punch-Through ES Fast-Weight + LIF"
Cohesion: 0.15
Nodes (14): LIF neuron leakage is subthreshold-native; Gaussian score computation is subthreshold-natural, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum, Test: 2-transistor EGGROLL vs FP logistic regression, Artificial Neural Network (ANN), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024) (+6 more)

### Community 9 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 10 - "KV-Cache Quantization Family"
Cohesion: 1.0
Nodes (3): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### Community 11 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

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
- **77 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+72 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
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
- **Why does `Device-Math Correspondence Catalog` connect `Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)` to `Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)`, `Consolidation & Two-Timescale Hub (charge-trap + PPCA Phase 6 + Pair 2/5/6)`, `Bit-Level Physics & Encoder`, `EGGROLL + Symbolic Regression + PPCA Outer Loop`, `Physical Substrate & Interaction Field`, `EML + Log-Domain Arithmetic Family`, `Punch-Through ES Fast-Weight + LIF`?**
  _High betweenness centrality (0.150) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `EGGROLL + Symbolic Regression + PPCA Outer Loop` to `Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)`, `Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)`, `Consolidation & Two-Timescale Hub (charge-trap + PPCA Phase 6 + Pair 2/5/6)`, `Punch-Through ES Fast-Weight + LIF`?**
  _High betweenness centrality (0.129) - this node is a cross-community bridge._
- **Why does `Subthreshold Exponential Regime (primitive)` connect `Nonlinearity & Score Super-Hub (subthreshold + state-region + PPCA canonical)` to `Analog Arithmetic Super-Hub (W + Gilbert + crossbar + log-domain)`, `Punch-Through ES Fast-Weight + LIF`, `EGGROLL + Symbolic Regression + PPCA Outer Loop`, `EML + Log-Domain Arithmetic Family`?**
  _High betweenness centrality (0.122) - this node is a cross-community bridge._