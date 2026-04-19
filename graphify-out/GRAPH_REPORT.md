# Graph Report - ./raw  (2026-04-19)

## Corpus Check
- 28 files · ~23,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 213 nodes · 356 edges · 14 communities detected
- Extraction: 79% EXTRACTED · 20% INFERRED · 1% AMBIGUOUS · INFERRED: 70 edges (avg confidence: 0.77)
- Token cost: 4,800 input · 7,200 output

## Community Hubs (Navigation)
- [[_COMMUNITY_ES + Symbolic Regression + Catalog Core|ES + Symbolic Regression + Catalog Core]]
- [[_COMMUNITY_Bit-Level Physics & Reinterpretation + Encoder|Bit-Level Physics & Reinterpretation + Encoder]]
- [[_COMMUNITY_Two-Timescale Bridge + Pulse-Density Encoder|Two-Timescale Bridge + Pulse-Density Encoder]]
- [[_COMMUNITY_Canonical Forward Pass + State-Region Nonlinearity|Canonical Forward Pass + State-Region Nonlinearity]]
- [[_COMMUNITY_LocalNon-Backprop Learning + Stage-2 Options|Local/Non-Backprop Learning + Stage-2 Options]]
- [[_COMMUNITY_Linear Combiner W + In-Memory Attention|Linear Combiner W + In-Memory Attention]]
- [[_COMMUNITY_EML Operator Foundations|EML Operator Foundations]]
- [[_COMMUNITY_Interaction Field & State-Region Formalism|Interaction Field & State-Region Formalism]]
- [[_COMMUNITY_Learnable Physical Parameter (VQC↔KAN)|Learnable Physical Parameter (VQC↔KAN)]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV-Cache Quantization Family]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]
- [[_COMMUNITY_Rank Convergence Proofs|Rank Convergence Proofs]]
- [[_COMMUNITY_Test-Time Discovery & World Models|Test-Time Discovery & World Models]]

## God Nodes (most connected - your core abstractions)
1. `EGGROLL Algorithm` - 16 edges
2. `Device-Math Correspondence Catalog` - 16 edges
3. `EML Operator eml(x,y)=exp(x)-ln(y)` - 12 edges
4. `NNs as State-Region Dictionaries (overview)` - 12 edges
5. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 12 edges
6. `Component E — Encoder (bits → analog, linear injection)` - 12 edges
7. `CMOS MOSFET (Bulk-Silicon)` - 11 edges
8. `Bit-Level Operator Framework for ReLU MLPs (overview)` - 11 edges
9. `Bit-Analog Formulation v1 (E,W,N,D Quadruple)` - 11 edges
10. `Component N — Selective-passing nonlinearity (transistor I-V)` - 11 edges

## Surprising Connections (you probably didn't know these)
- `Operation-First: Transition Speed = Compute Throughput` --semantically_similar_to--> `In-Memory Attention Compute (analog crossbars for KV)`  [INFERRED] [semantically similar]
  raw/Semi-Passive Physical Neural Devices.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- `Mixture of Transition Autoencoders` --semantically_similar_to--> `Learnable Edge Activation Functions (KAN)`  [INFERRED] [semantically similar]
  raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md → raw/A Practitioner's Guide to Kolmogorov–Arnold Networks.pdf
- `Punch-Through Impact Ionization` --semantically_similar_to--> `Depth as Iterative Operator Flow`  [AMBIGUOUS] [semantically similar]
  raw/Synaptic and neural behaviours.pdf → raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md
- `Kink Effect (Boudou & Doyle 1987)` --semantically_similar_to--> `NNs as State-Region Dictionaries (overview)`  [AMBIGUOUS] [semantically similar]
  raw/Synaptic and neural behaviours.pdf → raw/Neural Networks as State-Region Dictionaries and Transition Autoencoder Mixtures.md
- `Learnable Physical Medium (not a programmed computer)` --semantically_similar_to--> `In-Memory Attention Compute (analog crossbars for KV)`  [INFERRED] [semantically similar]
  raw/Semi-Passive Physical Neural Devices.md → raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf

## Hyperedges (group relationships)
- **Bit-Analog Forward-Pass Quadruple (E,W,N,D + formulation)** —  [EXTRACTED 1.00]
- **Canonical Minimal Model (E=A bit-plane, W=crossbar, N=α kink, D=comparator)** —  [EXTRACTED 1.00]
- **Same-Transistor Dual-Read (N analog-read + D binary-read of one MOSFET at kink)** —  [INFERRED 0.90]

## Communities

### Community 0 - "ES + Symbolic Regression + Catalog Core"
Cohesion: 0.06
Nodes (36): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum, Test: 2-transistor EGGROLL vs FP logistic regression (+28 more)

### Community 1 - "Bit-Level Physics & Reinterpretation + Encoder"
Cohesion: 0.11
Nodes (29): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel, Composition Identity — (E_bitplane,W,N_kink,D) = ReLU MLP / carry-save tree (+21 more)

### Community 2 - "Two-Timescale Bridge + Pulse-Density Encoder"
Cohesion: 0.11
Nodes (27): Encoder Option B — Pulse-density (unary, Hamming weight), Hybrid CMOS + Organic Neuromorphic Device Stack, Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B (+19 more)

### Community 3 - "Canonical Forward Pass + State-Region Nonlinearity"
Cohesion: 0.2
Nodes (22): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator), Component D — Decoder (comparator array), Component N — Selective-passing nonlinearity (transistor I-V), Nonlinearity Option α — Two-piece kink / ReLU polytope (canonical), Nonlinearity Option β — Subthreshold exponential (weak inversion), Nonlinearity Option γ — Saturation square-law (≈ squared-ReLU/GELU) (+14 more)

### Community 4 - "Local/Non-Backprop Learning + Stage-2 Options"
Cohesion: 0.13
Nodes (21): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, Event-Driven Sparse Interaction Model, Open Problem — Stage 2 Learning Rule (D is discontinuous), Stage 2 Option — Layer-local learning (no gradient crosses D), Stage 2 Option — Score-function / ES gradient (black-box perturbation), Stage 2 Option — Surrogate / straight-through gradient (enrichment target), FPGA/ASIC Systolic Target (+13 more)

### Community 5 - "Linear Combiner W + In-Memory Attention"
Cohesion: 0.19
Nodes (21): In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Catalog Absorption — 8-pair mapping ⇒ 4-slot schema + pending learning rule, Component W — Linear Combiner (Kirchhoff crossbar MVM), Constraint — G must be updated locally per crossbar cell, Lookup-Based Conditional Memory as New Sparsity Axis, Conditional Memory via Scalable Lookup, Grouping B: Analog continuum → low-rank math (+13 more)

### Community 6 - "EML Operator Foundations"
Cohesion: 0.12
Nodes (16): Binary Tree Grammar S->1|eml(S,S), EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke) (+8 more)

### Community 7 - "Interaction Field & State-Region Formalism"
Cohesion: 0.14
Nodes (16): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### Community 8 - "Learnable Physical Parameter (VQC↔KAN)"
Cohesion: 0.22
Nodes (13): NN as Structured Reactive Medium, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning, Variational Quantum Circuits as Learnable Physical Systems, Identity: VQC angle = KAN periodic edge activation, Rationale: physics-unitarity ↔ constraint-unitarity duality, Pair 8: VQC Angle θ ↔ KAN Learnable Rotation (+5 more)

### Community 9 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 10 - "KV-Cache Quantization Family"
Cohesion: 1.0
Nodes (3): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### Community 11 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

### Community 12 - "Rank Convergence Proofs"
Cohesion: 1.0
Nodes (2): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

### Community 13 - "Test-Time Discovery & World Models"
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
- **81 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+76 more)
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
- **Why does `Device-Math Correspondence Catalog` connect `Linear Combiner W + In-Memory Attention` to `ES + Symbolic Regression + Catalog Core`, `Bit-Level Physics & Reinterpretation + Encoder`, `Two-Timescale Bridge + Pulse-Density Encoder`, `Canonical Forward Pass + State-Region Nonlinearity`, `Learnable Physical Parameter (VQC↔KAN)`?**
  _High betweenness centrality (0.269) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `ES + Symbolic Regression + Catalog Core` to `Local/Non-Backprop Learning + Stage-2 Options`, `EML Operator Foundations`?**
  _High betweenness centrality (0.139) - this node is a cross-community bridge._
- **Why does `CMOS MOSFET (Bulk-Silicon)` connect `Canonical Forward Pass + State-Region Nonlinearity` to `ES + Symbolic Regression + Catalog Core`, `Linear Combiner W + In-Memory Attention`, `EML Operator Foundations`?**
  _High betweenness centrality (0.118) - this node is a cross-community bridge._