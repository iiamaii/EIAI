# Graph Report - ./raw  (2026-05-02)

## Corpus Check
- Corpus is ~6,541 words - fits in a single context window. You may not need a graph.

## Summary
- 79 nodes · 89 edges · 8 communities detected
- Extraction: 75% EXTRACTED · 25% INFERRED · 0% AMBIGUOUS · INFERRED: 22 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Evolution Strategies (NES + Salimans + EGGROLL)|Evolution Strategies (NES + Salimans + EGGROLL)]]
- [[_COMMUNITY_Forward-only  Forward Gradient|Forward-only / Forward Gradient]]
- [[_COMMUNITY_Feedback Alignment (Lillicrap + Akrout + Liao)|Feedback Alignment (Lillicrap + Akrout + Liao)]]
- [[_COMMUNITY_Direct Feedback Alignment + DRTP|Direct Feedback Alignment + DRTP]]
- [[_COMMUNITY_PCM Neural Network Training|PCM Neural Network Training]]
- [[_COMMUNITY_Bio-plausible Learning (EquProp, Bengio)|Bio-plausible Learning (EquProp, Bengio)]]
- [[_COMMUNITY_4-Part Collection Plan + Forward-Pass Algorithms|4-Part Collection Plan + Forward-Pass Algorithms]]
- [[_COMMUNITY_Neuromorphic 2022-2024 Surveys|Neuromorphic 2022-2024 Surveys]]

## God Nodes (most connected - your core abstractions)
1. `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` - 7 edges
2. `Evolution Strategies as Scalable RL (Salimans et al. 2017)` - 6 edges
3. `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` - 6 edges
4. `Part 3 — Semiconductor Devices (instances of Part 2 operators)` - 6 edges
5. `Part 4 — Neural Operator + Backprop-Free Optimization` - 6 edges
6. `Direct Feedback Alignment (Nokland 2016)` - 5 edges
7. `Deep Learning without Weight Transport (Akrout et al. 2019)` - 5 edges
8. `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)` - 5 edges
9. `Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework` - 5 edges
10. `Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks` - 5 edges

## Surprising Connections (you probably didn't know these)
- `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)` --semantically_similar_to--> `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`  [INFERRED] [semantically similar]
  raw/arxiv_2202_08587.md → raw/arxiv_1411_0247.md
- `Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks` --semantically_similar_to--> `Evolution Strategies as Scalable RL (Salimans et al. 2017)`  [INFERRED] [semantically similar]
  raw/arxiv_2310_00965.md → raw/arxiv_1703_03864.md
- `Natural Evolution Strategies (Wierstra et al. 2011)` --semantically_similar_to--> `Evolution Strategies as Scalable RL (Salimans et al. 2017)`  [INFERRED] [semantically similar]
  raw/arxiv_1106_4487.md → raw/arxiv_1703_03864.md
- `Direct Feedback Alignment (Nokland 2016)` --cites_or_extends--> `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`  [INFERRED]
  raw/arxiv_1609_01596.md → raw/arxiv_1411_0247.md
- `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` --semantically_similar_to--> `Deep Learning without Weight Transport (Akrout et al. 2019)`  [INFERRED] [semantically similar]
  raw/arxiv_1411_0247.md → raw/arxiv_1904_05391.md

## Hyperedges (group relationships)
- **Feedback Alignment family of bio-plausible learning algorithms** —  [EXTRACTED 0.95]
- **Evolution Strategies family of black-box optimizers** —  [EXTRACTED 0.95]
- **Pure Forward-Only Learning Family (Sigprop + Forward-Forward + Forward Gradient)** —  [EXTRACTED 0.90]
- **PCM Neural Network Hardware Pair (Inference + L2L Adaptation)** —  [EXTRACTED 1.00]
- **Neuromorphic 2022-2024 Survey Pair (Christensen Roadmap + Frenkel-Bol-Indiveri)** —  [EXTRACTED 1.00]
- **4-Part Collection Plan Hyperstructure** —  [EXTRACTED 1.00]

## Communities

### Community 0 - "Evolution Strategies (NES + Salimans + EGGROLL)"
Cohesion: 0.18
Nodes (12): Principled black-box optimization, Natural Evolution Strategies (Wierstra et al. 2011), Natural gradient on parameterized search distribution, Natural Evolution Strategies (NES) algorithm, Common random numbers communication (scalar exchange), Evolution Strategies for reinforcement learning, Evolution Strategies as Scalable RL (Salimans et al. 2017), Massively parallel scaling to 1000+ workers (+4 more)

### Community 1 - "Forward-only / Forward Gradient"
Cohesion: 0.18
Nodes (11): Forward gradient (directional derivative estimator), Forward-mode automatic differentiation, Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022), Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework, Sigprop: Global Supervised Learning via Forward Path Only, Sigprop: Compatibility with Hardware and Biological Learning (no weight transport, no feedback), Sigprop: Trains Spiking and Continuous-Time Networks with Hebbian Updates, Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop (+3 more)

### Community 2 - "Feedback Alignment (Lillicrap + Akrout + Liao)"
Cohesion: 0.22
Nodes (10): Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014), Random fixed feedback weights for credit assignment, Batch Normalization / Batch Manhattan stabilization, Feedback weight magnitudes irrelevant; only signs matter, How Important is Weight Symmetry in Backpropagation? (Liao et al. 2015), Sign-symmetric (sign-concordant) feedback weights, Near-backprop ImageNet performance without weight transport, Modified Kolen-Pollack feedback learning (+2 more)

### Community 3 - "Direct Feedback Alignment + DRTP"
Cohesion: 0.22
Nodes (10): Feedback Alignment algorithm, Direct Feedback Alignment (DFA) algorithm, Direct random projection from output to each hidden layer, Layer-independent training without error backprop, Direct Feedback Alignment (Nokland 2016), Direct Random Target Projection (DRTP) algorithm, Solves update locking; suitable for edge devices, Direct Random Target Projection / DRTP (Frenkel et al. 2019) (+2 more)

### Community 4 - "PCM Neural Network Training"
Cohesion: 0.22
Nodes (10): Joshi et al.: Accurate DNN Inference Using Computational Phase-Change Memory, PCM Inference: Batch-Norm-Based Drift Compensation for Retention, PCM Inference: 71.6% ImageNet Top-1 / 93.7% CIFAR-10 on PCM Hardware, PCM Inference: ResNet Training Methodology with No Accuracy Loss after Weight Transfer, Ortner et al.: Learning-to-Learn with PCM-Based In-Memory Computing, PCM L2L: Demonstrated on CNN Image Classification and SNN Robotic Arm Control, PCM L2L: Rapid Edge Adaptation with Few Parameter Updates, PCM L2L: Meta-Training in Software, Deployment on PCM NMHW (+2 more)

### Community 5 - "Bio-plausible Learning (EquProp, Bengio)"
Cohesion: 0.22
Nodes (9): Removes weight transport requirement (biological plausibility), Biologically plausible deep learning framework, Towards Biologically Plausible Deep Learning (Bengio et al. 2015), STDP-as-gradient-descent learning rule, Variational EM via neural dynamics, Equilibrium Propagation algorithm, Equilibrium Propagation (Scellier & Bengio 2016), Single neural computation for inference and error backprop (+1 more)

### Community 6 - "4-Part Collection Plan + Forward-Pass Algorithms"
Cohesion: 0.22
Nodes (9): Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks, Node Perturbation: Alignment with Directional Derivative, Node Perturbation: Input Decorrelation per Layer Boosts Convergence, Node Perturbation: On-Chip Learning in Noisy Neuromorphic Systems, 4-Part Material Collection Plan (ws), Part 1 — Digital/Analog Modulation and Decoding, Part 1 Tier 1 Priority List (7 items: Shannon, Nyquist, Norsworthy, Inose, Razavi, Pelgrom, Roza), Part 4 — Neural Operator + Backprop-Free Optimization (+1 more)

### Community 7 - "Neuromorphic 2022-2024 Surveys"
Cohesion: 0.29
Nodes (8): Christensen et al.: 2022 Roadmap on Neuromorphic Computing and Engineering, Roadmap: Algorithms, Applications, and Edge Deployment Perspectives, Roadmap: Survey of Materials, Devices and Circuits for Neuromorphic Computing, Frenkel, Bol, Indiveri: Bottom-Up vs Top-Down Neuromorphic Design, Frenkel-Indiveri: Tradeoffs Between Bottom-Up Biological and Top-Down ML Approaches, Frenkel-Indiveri: Analog/Mixed-Signal/Digital Circuit Design Style Comparison, Part 2 — Analog Math Operator vs Physical Operator Correspondence, Part 2 Tier 1 Priority List (8 items: Mead, Liu et al., Gilbert, Toumazou, Rugh, Schetzen, Vittoz)

## Knowledge Gaps
- **46 isolated node(s):** `Natural gradient on parameterized search distribution`, `Principled black-box optimization`, `Random fixed feedback weights for credit assignment`, `STDP-as-gradient-descent learning rule`, `Variational EM via neural dynamics` (+41 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Part 4 — Neural Operator + Backprop-Free Optimization` connect `4-Part Collection Plan + Forward-Pass Algorithms` to `Evolution Strategies (NES + Salimans + EGGROLL)`, `Forward-only / Forward Gradient`?**
  _High betweenness centrality (0.633) - this node is a cross-community bridge._
- **Why does `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` connect `Forward-only / Forward Gradient` to `4-Part Collection Plan + Forward-Pass Algorithms`?**
  _High betweenness centrality (0.534) - this node is a cross-community bridge._
- **Why does `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` connect `Feedback Alignment (Lillicrap + Akrout + Liao)` to `Forward-only / Forward Gradient`, `Direct Feedback Alignment + DRTP`, `Bio-plausible Learning (EquProp, Bengio)`?**
  _High betweenness centrality (0.526) - this node is a cross-community bridge._
- **Are the 4 inferred relationships involving `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` (e.g. with `Direct Feedback Alignment (Nokland 2016)` and `Deep Learning without Weight Transport (Akrout et al. 2019)`) actually correct?**
  _`Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` has 4 INFERRED edges - model-reasoned connections that need verification._
- **Are the 3 inferred relationships involving `Evolution Strategies as Scalable RL (Salimans et al. 2017)` (e.g. with `Natural Evolution Strategies (Wierstra et al. 2011)` and `Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks`) actually correct?**
  _`Evolution Strategies as Scalable RL (Salimans et al. 2017)` has 3 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` (e.g. with `Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework` and `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)`) actually correct?**
  _`Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Natural gradient on parameterized search distribution`, `Principled black-box optimization`, `Random fixed feedback weights for credit assignment` to the rest of the system?**
  _46 weakly-connected nodes found - possible documentation gaps or missing edges._