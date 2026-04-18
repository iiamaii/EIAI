# Graph Report - ./raw  (2026-04-18)

## Corpus Check
- Corpus is ~18,082 words - fits in a single context window. You may not need a graph.

## Summary
- 159 nodes · 176 edges · 15 communities detected
- Extraction: 73% EXTRACTED · 26% INFERRED · 1% AMBIGUOUS · INFERRED: 45 edges (avg confidence: 0.77)
- Token cost: 42,000 input · 11,500 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Neural Representation & Geometry|Neural Representation & Geometry]]
- [[_COMMUNITY_EML Operator & Symbolic Foundations|EML Operator & Symbolic Foundations]]
- [[_COMMUNITY_NS-RAM & Neuromorphic Hardware|NS-RAM & Neuromorphic Hardware]]
- [[_COMMUNITY_Bit-Plane & Binarized Computation|Bit-Plane & Binarized Computation]]
- [[_COMMUNITY_Evolution Strategies Core|Evolution Strategies Core]]
- [[_COMMUNITY_Local  Non-Backprop Learning|Local / Non-Backprop Learning]]
- [[_COMMUNITY_Physical Substrates & Slow-Fast Learning|Physical Substrates & Slow-Fast Learning]]
- [[_COMMUNITY_EGGROLL (Markdown Notes)|EGGROLL (Markdown Notes)]]
- [[_COMMUNITY_LLM Memory & In-Memory Attention|LLM Memory & In-Memory Attention]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_KV-Cache Quantization Family|KV-Cache Quantization Family]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]
- [[_COMMUNITY_Rank Convergence Proofs|Rank Convergence Proofs]]
- [[_COMMUNITY_Single-Cell Two-Timescale Rationale|Single-Cell Two-Timescale Rationale]]
- [[_COMMUNITY_Test-Time Discovery & World Models|Test-Time Discovery & World Models]]

## God Nodes (most connected - your core abstractions)
1. `EGGROLL Algorithm` - 13 edges
2. `EML Operator eml(x,y)=exp(x)-ln(y)` - 12 edges
3. `NS-RAM Cell (Neuro-Synaptic RAM)` - 8 edges
4. `Bit-Level Operator Framework for ReLU MLPs (overview)` - 8 edges
5. `NNs as State-Region Dictionaries (overview)` - 7 edges
6. `Semi-Passive Physical Neural Devices (overview)` - 6 edges
7. `Self-Organizing CMOS-Memory Architecture (overview)` - 6 edges
8. `Symbolic Regression via EML Trees` - 5 edges
9. `Learnable Physical Medium (not a programmed computer)` - 5 edges
10. `Bit-Plane Profile Representation` - 5 edges

## Surprising Connections (you probably didn't know these)
- `EGGROLL (Korean Translation)` --semantically_similar_to--> `EGGROLL Algorithm`  [INFERRED] [semantically similar]
  raw/Evolution Strategies at the Hyperscale.md → raw/Evolution Strategies at the Hyperscale.pdf
- `In-Memory Attention Compute (analog crossbars for KV)` --semantically_similar_to--> `Learnable Physical Medium (not a programmed computer)`  [INFERRED] [semantically similar]
  raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf → raw/Semi-Passive Physical Neural Devices.md
- `EGGROLL Connection (perturbation-response-fitness)` --semantically_similar_to--> `Layer-Local Training Without End-to-End Backprop`  [INFERRED] [semantically similar]
  raw/Semi-Passive Physical Neural Devices.md → raw/NOPROP- TRAINING NEURAL NETWORKS WITHOUT FULL BACK-PROPAGATION OR FULL FORWARD-PROPAGATION.pdf
- `Event-Driven Sparse Interaction Model` --semantically_similar_to--> `On-Chip Local Learning Rule for Beyond-CMOS Devices`  [INFERRED] [semantically similar]
  raw/A Physical Reinterpretation of Deep Learning.md → raw/A neuromorphic processor with on-chip learning for beyond-CMOS device integration.pdf
- `Variational Quantum Circuits as Learnable Physical Systems` --semantically_similar_to--> `Learnable Physical Medium (not a programmed computer)`  [INFERRED] [semantically similar]
  raw/A Primer on Quantum Machine Learning.pdf → raw/Semi-Passive Physical Neural Devices.md

## Hyperedges (group relationships)
- **EML Universality / Sheffer-Type Reduction Pattern** — all_elementary_functions_from_a_single_operator_pdf_eml_operator, all_elementary_functions_from_a_single_operator_pdf_edl_operator, all_elementary_functions_from_a_single_operator_pdf_ternary_operator, all_elementary_functions_from_a_single_operator_pdf_nand_gate [EXTRACTED 0.85]
- **EGGROLL Low-Rank Decomposition Pipeline** — evolution_strategies_at_the_hyperscale_pdf_evolution_strategies, evolution_strategies_at_the_hyperscale_pdf_lora, evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation, evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation, evolution_strategies_at_the_hyperscale_pdf_eggroll [EXTRACTED 0.95]
- **NS-RAM Neuro-Synaptic Dual-Use Pattern** — synaptic_and_neural_behaviours_pdf_mosfet, synaptic_and_neural_behaviours_pdf_punch_through, synaptic_and_neural_behaviours_pdf_floating_bulk, synaptic_and_neural_behaviours_pdf_bulk_bias_control_transistor, synaptic_and_neural_behaviours_pdf_ns_ram_cell [EXTRACTED 0.90]
- **Fast/Slow Two-Timescale Learning Substrate (cross-paper motif)** — semi_passive_physical_neural_devices_memorable_operational_split, self_organizing_cmos_memory_architecture_for_representation_learning_time_scale_separation, semi_passive_physical_neural_devices_flash_slow_parameter, self_organizing_cmos_memory_architecture_for_representation_learning_consolidation_mechanism [INFERRED 0.90]
- **Local Learning Without Full Backprop** — semi_passive_physical_neural_devices_three_factor_learning, noprop_training_neural_networks_without_full_back_propagation_or_full_forward_propagation_local_layer_training, hebbian_learning_with_global_direction_local_rule_global_signal, a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_on_chip_local_learning, self_organizing_cmos_memory_architecture_for_representation_learning_feeding_protocol_learning [INFERRED 0.85]
- **Bit-Level Partial-Product / Carry-Save Compute Pipeline** — bit_level_operator_framework_for_relu_mlps_outermul_dimsum_fold, bit_level_operator_framework_for_relu_mlps_packed_bitslice, bit_level_operator_framework_for_relu_mlps_carry_save_tree, binarized_neural_networks_xnor_popcount_mac, a_physical_reinterpretation_of_deep_learning_bit_plane_overlap_model [INFERRED 0.85]

## Communities

### Community 0 - "Neural Representation & Geometry"
Cohesion: 0.09
Nodes (27): Geometric Explanation of Likelihood OOD Detection Paradox, Manifold Geometry / Jacobian Explanation of OOD, 10-Axiom Formalization of Stateful NN, Interaction-State Layer (multi-channel node, edge-state), Shared-Basis Low-Rank Edge Interaction, Stateful Interaction Field Formalism, Learnable Edge Activation Functions (KAN), Practitioner's Guide to Kolmogorov-Arnold Networks (+19 more)

### Community 1 - "EML Operator & Symbolic Foundations"
Cohesion: 0.1
Nodes (20): Binary Tree Grammar S->1|eml(S,S), EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, NAND Gate (Sheffer Stroke) (+12 more)

### Community 2 - "NS-RAM & Neuromorphic Hardware"
Cohesion: 0.11
Nodes (20): EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Artificial Neural Network (ANN), Bulk Bias Control Transistor (2-Transistor Cell), Embedded Flash Memory (Reference), Hot-Carrier (Electron/Hole) Injection, Intel Loihi 2 (Orchard et al. 2021), Long-Term Plasticity (Charge-Trapping) (+12 more)

### Community 3 - "Bit-Plane & Binarized Computation"
Cohesion: 0.11
Nodes (20): Adjoint Credit Field (backprop reinterpreted), Bit-Plane Overlap Model for Multiplication, Event-Driven Sparse Interaction Model, Physical Reinterpretation of Deep Learning (overview), Scattering-Kernel Interaction Model, Signal-Particle-Energy Mapping of NN Elements, Binarized Neural Networks, XNOR + Popcount MAC Kernel (+12 more)

### Community 4 - "Evolution Strategies Core"
Cohesion: 0.12
Nodes (17): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees, Central Limit Theorem (justification), Counter-Based Deterministic RNG (Salmon 2011), EGGROLL Algorithm (+9 more)

### Community 5 - "Local / Non-Backprop Learning"
Cohesion: 0.18
Nodes (15): Neuromorphic Processor with On-Chip Learning, On-Chip Local Learning Rule for Beyond-CMOS Devices, FPGA/ASIC Systolic Target, CMOS-Integrated Organic Neuromorphic Imagers, Local Hebbian Rule Modulated by Global Direction Signal, Hebbian Learning with Global Direction, Layer-Local Training Without End-to-End Backprop, NoProp: Training NNs Without Full Back/Forward-Propagation (+7 more)

### Community 6 - "Physical Substrates & Slow-Fast Learning"
Cohesion: 0.17
Nodes (15): NN as Structured Reactive Medium, Primer on Quantum Machine Learning, Variational Quantum Circuits as Learnable Physical Systems, Hybrid CMOS + Organic Neuromorphic Device Stack, CMOS-Centered + RAM-like Memory Hybrid Architecture, Consolidation / Metaplasticity Mechanism, Self-Organizing CMOS-Memory Architecture (overview), Rationale: disambiguating 'device' between memory device and transistor primitive (+7 more)

### Community 7 - "EGGROLL (Markdown Notes)"
Cohesion: 0.33
Nodes (6): EGGROLL (Korean Translation), Evolution Strategies (ES), LoRA (Low-Rank Adaptation), Low-Rank Perturbation E=AB^T/sqrt(r), Rationale: Arithmetic Intensity Improvement, Score Function Gradient Estimation

### Community 8 - "LLM Memory & In-Memory Attention"
Cohesion: 0.4
Nodes (5): In-Memory Attention Compute (analog crossbars for KV), Analog In-Memory Computing Attention, Lookup-Based Conditional Memory as New Sparsity Axis, Conditional Memory via Scalable Lookup, Operation-First: Transition Speed = Compute Throughput

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

### Community 13 - "Single-Cell Two-Timescale Rationale"
Cohesion: 1.0
Nodes (2): Rationale: Fabrication simplicity demands single-cell two-timescale physics, Single Adaptive Cell with Two Timescales

### Community 14 - "Test-Time Discovery & World Models"
Cohesion: 1.0
Nodes (2): Learning to Discover at Test Time, LeWorldModel (paper)

## Ambiguous Edges - Review These
- `LeWorldModel (paper)` → `Learning to Discover at Test Time`  [AMBIGUOUS]
  raw/Learning to Discover at Test Time.pdf · relation: semantically_similar_to
- `Learnable Edge Activation Functions (KAN)` → `Learning with Exact Invariances in Polynomial Time`  [AMBIGUOUS]
  raw/Learning with Exact Invariances in Polynomial Time.pdf · relation: semantically_similar_to

## Knowledge Gaps
- **79 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+74 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Rank Convergence Proofs`** (2 nodes): `Edgeworth Expansion (Bhattacharya & Ranga Rao)`, `EGGROLL Rank Convergence O(r^-1)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Single-Cell Two-Timescale Rationale`** (2 nodes): `Rationale: Fabrication simplicity demands single-cell two-timescale physics`, `Single Adaptive Cell with Two Timescales`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Test-Time Discovery & World Models`** (2 nodes): `Learning to Discover at Test Time`, `LeWorldModel (paper)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `LeWorldModel (paper)` and `Learning to Discover at Test Time`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **What is the exact relationship between `Learnable Edge Activation Functions (KAN)` and `Learning with Exact Invariances in Polynomial Time`?**
  _Edge tagged AMBIGUOUS (relation: semantically_similar_to) - confidence is low._
- **Why does `NN as Structured Reactive Medium` connect `Physical Substrates & Slow-Fast Learning` to `Neural Representation & Geometry`, `Bit-Plane & Binarized Computation`?**
  _High betweenness centrality (0.106) - this node is a cross-community bridge._
- **Why does `Stateful Interaction Field Formalism` connect `Neural Representation & Geometry` to `Physical Substrates & Slow-Fast Learning`?**
  _High betweenness centrality (0.099) - this node is a cross-community bridge._
- **Why does `EGGROLL Algorithm` connect `Evolution Strategies Core` to `EML Operator & Symbolic Foundations`, `NS-RAM & Neuromorphic Hardware`, `EGGROLL (Markdown Notes)`?**
  _High betweenness centrality (0.093) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _79 weakly-connected nodes found - possible documentation gaps or missing edges._