# Graph Report - ./raw  (2026-04-19)

## Corpus Check
- 27 files · ~20,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 187 nodes · 254 edges · 16 communities detected
- Extraction: 74% EXTRACTED · 24% INFERRED · 2% AMBIGUOUS · INFERRED: 61 edges (avg confidence: 0.76)
- Token cost: 5,200 input · 7,600 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Representation Geometry + Catalog Backbone|Representation Geometry + Catalog Backbone]]
- [[_COMMUNITY_Two-Timescale Bridge (device↔slowfast math)|Two-Timescale Bridge (device↔slow/fast math)]]
- [[_COMMUNITY_Bit-Plane & Binarized Computation|Bit-Plane & Binarized Computation]]
- [[_COMMUNITY_Local  Non-Backprop Learning|Local / Non-Backprop Learning]]
- [[_COMMUNITY_EGGROLL + Symbolic Regression|EGGROLL + Symbolic Regression]]
- [[_COMMUNITY_Interaction Field & State-Region Formalism|Interaction Field & State-Region Formalism]]
- [[_COMMUNITY_EML Operator Foundations|EML Operator Foundations]]
- [[_COMMUNITY_NS-RAM & Neuromorphic Hardware|NS-RAM & Neuromorphic Hardware]]
- [[_COMMUNITY_Learnable Physical Parameter (VQC↔KAN bridge)|Learnable Physical Parameter (VQC↔KAN bridge)]]
- [[_COMMUNITY_Analog Continuum → Low-Rank Bridge|Analog Continuum → Low-Rank Bridge]]
- [[_COMMUNITY_In-Memory Attention + Crossbar-Logit Bridge|In-Memory Attention + Crossbar-Logit Bridge]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV-Cache Quantization Family]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]
- [[_COMMUNITY_Rank Convergence Proofs|Rank Convergence Proofs]]
- [[_COMMUNITY_Test-Time Discovery & World Models|Test-Time Discovery & World Models]]

## God Nodes (most connected - your core abstractions)
1. `EGGROLL Algorithm` - 15 edges
2. `Device-Math Correspondence Catalog` - 13 edges
3. `EML Operator eml(x,y)=exp(x)-ln(y)` - 12 edges
4. `NNs as State-Region Dictionaries (overview)` - 10 edges
5. `NS-RAM Cell (Neuro-Synaptic RAM)` - 9 edges
6. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 9 edges
7. `Bit-Level Operator Framework for ReLU MLPs (overview)` - 8 edges
8. `Fast Activation x(t) / Slow Weight w(t) Time-Scale Separation` - 8 edges
9. `Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight` - 8 edges
10. `Pair 6: Single-Cell Two-Timescale ↔ Fast/Slow LR` - 8 edges

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
- **Two-Timescale Physics → Slow/Fast Math** —  [EXTRACTED 1.00]
- **Analog Continuum → Low-Rank Math** —  [EXTRACTED 1.00]
- **Piecewise Physics → Piecewise-Linear Math** —  [EXTRACTED 1.00]

## Communities

### Community 0 - "Representation Geometry + Catalog Backbone"
Cohesion: 0.12
Nodes (24): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, Grouping B: Analog continuum → low-rank math, Grouping C: Piecewise physics → piecewise-linear math, Grouping A: Two-timescale physics → slow/fast math, Device-Math Correspondence Catalog, Identity: shared low-pass filter τ_fast⁻¹≈T_fast⁻¹, Pair 1: Punch-Through ↔ ES Fast-Weight Momentum (+16 more)

### Community 1 - "Two-Timescale Bridge (device↔slow/fast math)"
Cohesion: 0.13
Nodes (24): Pair 2: Charge-Trapping ↔ Consolidation/Slow-Weight, Predicted identity: η_slow = ∫ P(τ)/τ dτ, Rationale: trap-depth heterogeneity ↔ multi-timescale EMA, Pair 5: Floating-Bulk Drift ↔ Running-Stats Norm, Predicted identity: α = Δt/(C_B·R_leak), Rationale: normalization is free in silicon via V_B, Predicted identity: η_fast/η_slow = τ_slow/τ_fast, Rationale: makes existing hyperedge quantitative (+16 more)

### Community 2 - "Bit-Plane & Binarized Computation"
Cohesion: 0.11
Nodes (20): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel (+12 more)

### Community 3 - "Local / Non-Backprop Learning"
Cohesion: 0.13
Nodes (20): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, FPGA/ASIC Systolic Target, Hybrid CMOS + Organic Neuromorphic Device Stack, CMOS-Integrated Organic Neuromorphic Imagers, Local Hebbian Rule Modulated by Global Direction Signal, Hebbian Learning with Global Direction, Layer-Local Training Without End-to-End Backprop (+12 more)

### Community 4 - "EGGROLL + Symbolic Regression"
Cohesion: 0.11
Nodes (18): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, EGGROLL (Korean Translation), Evolution Strategies (ES), LoRA (Low-Rank Adaptation) (+10 more)

### Community 5 - "Interaction Field & State-Region Formalism"
Cohesion: 0.14
Nodes (16): 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Mixture of Transition Autoencoders, Piecewise Linear Region Atlas, Rank-1 Operator Primitive (v_i u_i^T), Residual Transition Autoencoder Block (+8 more)

### Community 6 - "EML Operator Foundations"
Cohesion: 0.15
Nodes (13): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke), Rationale: Complex Domain Required Internally (+5 more)

### Community 7 - "NS-RAM & Neuromorphic Hardware"
Cohesion: 0.18
Nodes (12): EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN), Intel Loihi 2 (Orchard et al. 2021), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024), NS-RAM Cell (Neuro-Synaptic RAM), Rationale: CMOS Compatibility/No Alien Materials (+4 more)

### Community 8 - "Learnable Physical Parameter (VQC↔KAN bridge)"
Cohesion: 0.27
Nodes (11): NN as Structured Reactive Medium, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks, Primer on Quantum Machine Learning, Variational Quantum Circuits as Learnable Physical Systems, Identity: VQC angle = KAN periodic edge activation, Rationale: physics-unitarity ↔ constraint-unitarity duality, Pair 8: VQC Angle θ ↔ KAN Learnable Rotation (+3 more)

### Community 9 - "Analog Continuum → Low-Rank Bridge"
Cohesion: 0.27
Nodes (10): Binary Tree Grammar S->1|eml(S,S), Identity: usable rank r bounded by cell resolution b, Pair 3: Memristor/PCM Levels ↔ Low-Rank Rank r, Test: b=4 vs b=8 memristor EGGROLL convergence knee, Low-Rank Perturbation E=AB^T/sqrt(r), Rationale: Arithmetic Intensity Improvement, Rank-r Perturbation Structure, Rationale: Low-rank Structure for High Arithmetic Intensity (+2 more)

### Community 10 - "In-Memory Attention + Crossbar-Logit Bridge"
Cohesion: 0.33
Nodes (7): In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Lookup-Based Conditional Memory as New Sparsity Axis, Conditional Memory via Scalable Lookup, Pair 4: Analog Crossbar MVM ↔ Pre-Softmax Logits, Identity: one crossbar MVM cycle = QK^T/√d_k, Implication: softmax must be off-chip or approximated

### Community 11 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 12 - "KV-Cache Quantization Family"
Cohesion: 1.0
Nodes (3): PolarQuant: Quantizing KV Caches via Polar Transform, QJL: JL-based KV Cache Quantization, TurboQuant

### Community 13 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

### Community 14 - "Rank Convergence Proofs"
Cohesion: 1.0
Nodes (2): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

### Community 15 - "Test-Time Discovery & World Models"
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
- **86 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+81 more)
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
- **Why does `Device-Math Correspondence Catalog` connect `Representation Geometry + Catalog Backbone` to `Two-Timescale Bridge (device↔slow/fast math)`, `NS-RAM & Neuromorphic Hardware`, `Learnable Physical Parameter (VQC↔KAN bridge)`, `Analog Continuum → Low-Rank Bridge`, `In-Memory Attention + Crossbar-Logit Bridge`?**
  _High betweenness centrality (0.333) - this node is a cross-community bridge._
- **Why does `NNs as State-Region Dictionaries (overview)` connect `Representation Geometry + Catalog Backbone` to `In-Memory Attention + Crossbar-Logit Bridge`, `Interaction Field & State-Region Formalism`?**
  _High betweenness centrality (0.148) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `EGGROLL + Symbolic Regression` to `Representation Geometry + Catalog Backbone`, `Analog Continuum → Low-Rank Bridge`, `NS-RAM & Neuromorphic Hardware`?**
  _High betweenness centrality (0.148) - this node is a cross-community bridge._