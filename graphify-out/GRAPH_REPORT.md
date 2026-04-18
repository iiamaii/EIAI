# Graph Report - ./raw  (2026-04-18)

## Corpus Check
- Corpus is ~5,993 words - fits in a single context window. You may not need a graph.

## Summary
- 70 nodes · 68 edges · 11 communities detected
- Extraction: 93% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED: 5 edges (avg confidence: 0.73)
- Token cost: 95,000 input · 8,500 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Evolution Strategies & Baselines|Evolution Strategies & Baselines]]
- [[_COMMUNITY_EML Operator & Symbolic Foundations|EML Operator & Symbolic Foundations]]
- [[_COMMUNITY_Neuromorphic Hardware & Plasticity|Neuromorphic Hardware & Plasticity]]
- [[_COMMUNITY_NS-RAM Cell Architecture|NS-RAM Cell Architecture]]
- [[_COMMUNITY_EGGROLL (Markdown Notes)|EGGROLL (Markdown Notes)]]
- [[_COMMUNITY_Symbolic Regression Training|Symbolic Regression Training]]
- [[_COMMUNITY_MOSFET Device Physics|MOSFET Device Physics]]
- [[_COMMUNITY_Convergence Theory & NTK|Convergence Theory & NTK]]
- [[_COMMUNITY_Low-Rank Tree Structures|Low-Rank Tree Structures]]
- [[_COMMUNITY_Matrix Gaussian ES|Matrix Gaussian ES]]
- [[_COMMUNITY_Rank Convergence Proofs|Rank Convergence Proofs]]

## God Nodes (most connected - your core abstractions)
1. `EGGROLL Algorithm` - 13 edges
2. `EML Operator eml(x,y)=exp(x)-ln(y)` - 12 edges
3. `NS-RAM Cell (Neuro-Synaptic RAM)` - 8 edges
4. `Symbolic Regression via EML Trees` - 5 edges
5. `EGGROLL (Korean Translation)` - 4 edges
6. `Artificial Neural Network (ANN)` - 4 edges
7. `Electronic Synapse (Plasticity)` - 4 edges
8. `Long-Term Plasticity (Charge-Trapping)` - 4 edges
9. `Gaussian Approximate Score Function` - 3 edges
10. `EGG (Evolved Generative GRU, int8 RNN)` - 3 edges

## Surprising Connections (you probably didn't know these)
- `EGGROLL (Korean Translation)` --semantically_similar_to--> `EGGROLL Algorithm`  [INFERRED] [semantically similar]
  raw/Evolution Strategies at the Hyperscale.md → raw/Evolution Strategies at the Hyperscale.pdf
- `Symbolic Regression via EML Trees` --semantically_similar_to--> `EGGROLL Algorithm`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/Evolution Strategies at the Hyperscale.pdf
- `NS-RAM Cell (Neuro-Synaptic RAM)` --semantically_similar_to--> `EGG (Evolved Generative GRU, int8 RNN)`  [INFERRED] [semantically similar]
  raw/Synaptic and neural behaviours.pdf → raw/Evolution Strategies at the Hyperscale.pdf
- `Binary Tree Grammar S->1|eml(S,S)` --semantically_similar_to--> `Rank-r Perturbation Structure`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/Evolution Strategies at the Hyperscale.pdf
- `NAND Gate (Sheffer Stroke)` --semantically_similar_to--> `CMOS MOSFET (Bulk-Silicon)`  [INFERRED] [semantically similar]
  raw/All elementary functions from a single operator.pdf → raw/Synaptic and neural behaviours.pdf

## Hyperedges (group relationships)
- **EGGROLL Low-Rank Decomposition Pipeline** — evolution_strategies_at_the_hyperscale_pdf_evolution_strategies, evolution_strategies_at_the_hyperscale_pdf_lora, evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation, evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation, evolution_strategies_at_the_hyperscale_pdf_eggroll [EXTRACTED 0.95]
- **NS-RAM Neuro-Synaptic Dual-Use Pattern** — synaptic_and_neural_behaviours_pdf_mosfet, synaptic_and_neural_behaviours_pdf_punch_through, synaptic_and_neural_behaviours_pdf_floating_bulk, synaptic_and_neural_behaviours_pdf_bulk_bias_control_transistor, synaptic_and_neural_behaviours_pdf_ns_ram_cell [EXTRACTED 0.90]
- **EML Universality / Sheffer-Type Reduction Pattern** — all_elementary_functions_from_a_single_operator_pdf_eml_operator, all_elementary_functions_from_a_single_operator_pdf_edl_operator, all_elementary_functions_from_a_single_operator_pdf_ternary_operator, all_elementary_functions_from_a_single_operator_pdf_nand_gate [EXTRACTED 0.85]

## Communities

### Community 0 - "Evolution Strategies & Baselines"
Cohesion: 0.17
Nodes (12): Central Limit Theorem (justification), Counter-Based Deterministic RNG (Salmon 2011), EGGROLL Algorithm, Evolution Strategies (ES), Gaussian Approximate Score Function, GRPO (Shao et al. 2024), LoRA (Hu et al. 2022), MeZO (Malladi et al. 2023) (+4 more)

### Community 1 - "EML Operator & Symbolic Foundations"
Cohesion: 0.17
Nodes (12): EDL Operator edl(x,y)=exp(x)/ln(y), EML Operator eml(x,y)=exp(x)-ln(y), Euler's Formula e^(i*phi)=cos+i*sin, Exp-Log Representation (Liouville 1835), KAN Kolmogorov-Arnold Networks (Liu et al.), Lean 4 Theorem Prover, Rationale: Complex Domain Required Internally, Rationale: Single Primitive Aesthetic/Pedagogy Value (+4 more)

### Community 2 - "Neuromorphic Hardware & Plasticity"
Cohesion: 0.18
Nodes (11): Artificial Neural Network (ANN), Embedded Flash Memory (Reference), Hot-Carrier (Electron/Hole) Injection, Intel Loihi 2 (Orchard et al. 2021), Long-Term Plasticity (Charge-Trapping), Electronic Neuron (Leaky-Integrate-and-Fire), IBM NorthPole (Cassidy et al. 2024), Rationale: Charge-Trapping Explains Long-Term Retention (+3 more)

### Community 3 - "NS-RAM Cell Architecture"
Cohesion: 0.22
Nodes (9): EGG (Evolved Generative GRU, int8 RNN), Rationale: Nonlinear RNN Choice for EGG, Bulk Bias Control Transistor (2-Transistor Cell), Memristor (Alternative Platform), NS-RAM Cell (Neuro-Synaptic RAM), Phase-Change Memory (PCM), Rationale: 2-Transistor for Tunability and Repeatability, Rationale: CMOS Compatibility/No Alien Materials (+1 more)

### Community 4 - "EGGROLL (Markdown Notes)"
Cohesion: 0.33
Nodes (6): EGGROLL (Korean Translation), Evolution Strategies (ES), LoRA (Low-Rank Adaptation), Low-Rank Perturbation E=AB^T/sqrt(r), Rationale: Arithmetic Intensity Improvement, Score Function Gradient Estimation

### Community 5 - "Symbolic Regression Training"
Cohesion: 0.4
Nodes (5): Adam Optimizer, EML Master Formula (Parameterized Tree), PyTorch (Paszke et al. 2019), Rationale: Interpretability via Snap to Closed-form, Symbolic Regression via EML Trees

### Community 6 - "MOSFET Device Physics"
Cohesion: 0.4
Nodes (5): NAND Gate (Sheffer Stroke), Floating-Bulk Configuration, Kink Effect (Boudou & Doyle 1987), CMOS MOSFET (Bulk-Silicon), Punch-Through Impact Ionization

### Community 7 - "Convergence Theory & NTK"
Cohesion: 0.67
Nodes (3): Convergence to Linearity Theorem, Gaussian Annulus Theorem, Neural Tangent Kernel (Jacot et al. 2018)

### Community 8 - "Low-Rank Tree Structures"
Cohesion: 0.67
Nodes (3): Binary Tree Grammar S->1|eml(S,S), Rank-r Perturbation Structure, Rationale: Low-rank Structure for High Arithmetic Intensity

### Community 9 - "Matrix Gaussian ES"
Cohesion: 1.0
Nodes (2): Gaussian ES, Matrix Gaussian Distribution

### Community 10 - "Rank Convergence Proofs"
Cohesion: 1.0
Nodes (2): Edgeworth Expansion (Bhattacharya & Ranga Rao), EGGROLL Rank Convergence O(r^-1)

## Knowledge Gaps
- **48 isolated node(s):** `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution`, `Score Function Gradient Estimation`, `Rationale: Arithmetic Intensity Improvement` (+43 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Matrix Gaussian ES`** (2 nodes): `Gaussian ES`, `Matrix Gaussian Distribution`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Rank Convergence Proofs`** (2 nodes): `Edgeworth Expansion (Bhattacharya & Ranga Rao)`, `EGGROLL Rank Convergence O(r^-1)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `EGGROLL Algorithm` connect `Evolution Strategies & Baselines` to `Low-Rank Tree Structures`, `NS-RAM Cell Architecture`, `EGGROLL (Markdown Notes)`, `Symbolic Regression Training`?**
  _High betweenness centrality (0.490) - this node is a cross-community bridge._
- **Why does `NS-RAM Cell (Neuro-Synaptic RAM)` connect `NS-RAM Cell Architecture` to `Neuromorphic Hardware & Plasticity`, `MOSFET Device Physics`?**
  _High betweenness centrality (0.418) - this node is a cross-community bridge._
- **Why does `EML Operator eml(x,y)=exp(x)-ln(y)` connect `EML Operator & Symbolic Foundations` to `Low-Rank Tree Structures`, `MOSFET Device Physics`?**
  _High betweenness centrality (0.276) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `EGGROLL Algorithm` (e.g. with `EGGROLL (Korean Translation)` and `Symbolic Regression via EML Trees`) actually correct?**
  _`EGGROLL Algorithm` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `LoRA (Low-Rank Adaptation)`, `Gaussian ES`, `Matrix Gaussian Distribution` to the rest of the system?**
  _48 weakly-connected nodes found - possible documentation gaps or missing edges._