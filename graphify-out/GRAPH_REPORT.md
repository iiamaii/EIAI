# Graph Report - ./raw  (2026-05-03)

## Corpus Check
- 28 files · ~36,500 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 156 nodes · 210 edges · 9 communities detected
- Extraction: 75% EXTRACTED · 25% INFERRED · 0% AMBIGUOUS · INFERRED: 52 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_ES + EML + Backprop-free Algorithms (Part 4 hub)|ES + EML + Backprop-free Algorithms (Part 4 hub)]]
- [[_COMMUNITY_Translinear + Volterra + PCM Devices (Part 23 cross)|Translinear + Volterra + PCM Devices (Part 2/3 cross)]]
- [[_COMMUNITY_Forward-only  DFA  Feedback Alignment|Forward-only / DFA / Feedback Alignment]]
- [[_COMMUNITY_Part 1 Modulation + 4-Part Collection Plan|Part 1 Modulation + 4-Part Collection Plan]]
- [[_COMMUNITY_MeadLiuVittoz Analog VLSI (Part 2 textbooks)|Mead/Liu/Vittoz Analog VLSI (Part 2 textbooks)]]
- [[_COMMUNITY_Charge-storage NVM + MRAM (Part 3 devices)|Charge-storage NVM + MRAM (Part 3 devices)]]
- [[_COMMUNITY_Bio-plausible Learning + Neuromorphic Surveys|Bio-plausible Learning + Neuromorphic Surveys]]
- [[_COMMUNITY_Semiconductor Physics (SzeTsividisEKV)|Semiconductor Physics (Sze/Tsividis/EKV)]]
- [[_COMMUNITY_Hiratani Node Perturbation + Stage 2 Tier 1|Hiratani Node Perturbation + Stage 2 Tier 1]]

## God Nodes (most connected - your core abstractions)
1. `4-Part Material Collection Plan (ws)` - 13 edges
2. `Part 3 — Semiconductor Devices (instances of Part 2 operators)` - 10 edges
3. `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` - 9 edges
4. `Part 2 — Volterra/Wiener Nonlinear System Theory (Rugh, Schetzen, Boyd-Chua)` - 9 edges
5. `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` - 8 edges
6. `Mead (1989) Analog VLSI and Neural Systems` - 8 edges
7. `Part 3 — Memristor & PCM (Strukov, Ielmini-Waser, Burr)` - 8 edges
8. `EGGROLL: Evolution Strategies at the Hyperscale (Sarkar et al.)` - 7 edges
9. `Joshi et al.: Accurate DNN Inference Using Computational Phase-Change Memory` - 7 edges
10. `Part 2 — Analog Math Operator vs Physical Operator Correspondence` - 7 edges

## Surprising Connections (you probably didn't know these)
- `Towards Biologically Plausible Deep Learning (Bengio et al. 2015)` --semantically_similar_to--> `Equilibrium Propagation (Scellier & Bengio 2016)`  [INFERRED] [semantically similar]
  raw/arxiv_1502_04156.md → raw/arxiv_1602_05179.md
- `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)` --semantically_similar_to--> `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop`  [INFERRED] [semantically similar]
  raw/arxiv_2202_08587.md → raw/arxiv_2212_13345.md
- `Natural Evolution Strategies (Wierstra et al. 2011)` --semantically_similar_to--> `Evolution Strategies as Scalable RL (Salimans et al. 2017)`  [INFERRED] [semantically similar]
  raw/arxiv_1106_4487.md → raw/arxiv_1703_03864.md
- `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` --semantically_similar_to--> `Deep Learning without Weight Transport (Akrout et al. 2019)`  [INFERRED] [semantically similar]
  raw/arxiv_1411_0247.md → raw/arxiv_1904_05391.md
- `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` --semantically_similar_to--> `How Important is Weight Symmetry in Backpropagation? (Liao et al. 2015)`  [INFERRED] [semantically similar]
  raw/arxiv_1411_0247.md → raw/arxiv_1510_05067.md

## Hyperedges (group relationships)
- **Part 1 Modulation/Decoding textbook cluster** —  [EXTRACTED 1.00]
- **Part 2 Operator-Correspondence textbook cluster** —  [EXTRACTED 1.00]
- **Part 3 Device Physics textbook cluster** —  [EXTRACTED 1.00]

## Communities

### Community 0 - "ES + EML + Backprop-free Algorithms (Part 4 hub)"
Cohesion: 0.09
Nodes (27): Equilibrium Propagation algorithm, Equilibrium Propagation (Scellier & Bengio 2016), Single neural computation for inference and error backprop, Two-phase fixed-point nudging at output, Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework, Sigprop: Global Supervised Learning via Forward Path Only, Sigprop: Compatibility with Hardware and Biological Learning (no weight transport, no feedback), Sigprop: Trains Spiking and Continuous-Time Networks with Hebbian Updates (+19 more)

### Community 1 - "Translinear + Volterra + PCM Devices (Part 2/3 cross)"
Cohesion: 0.11
Nodes (24): Joshi et al.: Accurate DNN Inference Using Computational Phase-Change Memory, PCM Inference: Batch-Norm-Based Drift Compensation for Retention, PCM Inference: 71.6% ImageNet Top-1 / 93.7% CIFAR-10 on PCM Hardware, PCM Inference: ResNet Training Methodology with No Accuracy Loss after Weight Transfer, Christensen et al.: 2022 Roadmap on Neuromorphic Computing and Engineering, Roadmap: Algorithms, Applications, and Edge Deployment Perspectives, Roadmap: Survey of Materials, Devices and Circuits for Neuromorphic Computing, Frenkel, Bol, Indiveri: Bottom-Up vs Top-Down Neuromorphic Design (+16 more)

### Community 2 - "Forward-only / DFA / Feedback Alignment"
Cohesion: 0.1
Nodes (23): Feedback Alignment algorithm, Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014), Random fixed feedback weights for credit assignment, Batch Normalization / Batch Manhattan stabilization, Feedback weight magnitudes irrelevant; only signs matter, How Important is Weight Symmetry in Backpropagation? (Liao et al. 2015), Sign-symmetric (sign-concordant) feedback weights, Direct Feedback Alignment (DFA) algorithm (+15 more)

### Community 3 - "Part 1 Modulation + 4-Part Collection Plan"
Cohesion: 0.13
Nodes (19): ADC Taxonomy (Flash/Pipelined/SAR/ΣΔ/Integrating), ENOB / FoM dynamic performance metrics, Inose, Yasuda, Murakami (1962) ΣΔ Modulation Origin, 4-Part Material Collection Plan (ws), Part 1 — Digital/Analog Modulation and Decoding, Part 1 Tier 1 Priority List (7 items: Shannon, Nyquist, Norsworthy, Inose, Razavi, Pelgrom, Roza), Noise Shaping (1-z⁻¹ high-pass), Norsworthy/Schreier/Temes (1996) Delta-Sigma Data Converters (+11 more)

### Community 4 - "Mead/Liu/Vittoz Analog VLSI (Part 2 textbooks)"
Cohesion: 0.15
Nodes (18): AER (Address Event Representation), Current Conveyor (CCII) building block, EML operator = exp(x) − ln(y) (log-domain algebra), Gilbert (1968) Four-Quadrant Multiplier (Gilbert cell), Gilbert (1975) Translinear Principle Classification, Gm-C Filter (current-mode), kT/C thermal noise (Vittoz/Pelgrom), LIF Neuron Circuit (~10 transistors) (+10 more)

### Community 5 - "Charge-storage NVM + MRAM (Part 3 devices)"
Cohesion: 0.14
Nodes (18): EKV (Enz-Krummenacher-Vittoz) unified MOS model, FeFET multi-level V_T(P) gate dielectric polarization, Floating-gate cell (NAND/NOR Flash, CHE/F-N programming), Hasler, Diorio, Minch, Mead (1996) Single-Transistor Silicon Synapse, Mead Floating-gate Adaptive Synapse (Ch. 12), MOSFET three regimes (subthreshold/triode/saturation), Müller et al. (2015) Ferroelectric HfO₂ FeRAM/FeFET, NS-RAM 2T cell (floating-bulk + charge-trap, short+long plasticity) (+10 more)

### Community 6 - "Bio-plausible Learning + Neuromorphic Surveys"
Cohesion: 0.18
Nodes (12): Principled black-box optimization, Natural Evolution Strategies (Wierstra et al. 2011), Natural gradient on parameterized search distribution, Natural Evolution Strategies (NES) algorithm, Common random numbers communication (scalar exchange), Evolution Strategies for reinforcement learning, Evolution Strategies as Scalable RL (Salimans et al. 2017), Massively parallel scaling to 1000+ workers (+4 more)

### Community 7 - "Semiconductor Physics (Sze/Tsividis/EKV)"
Cohesion: 0.27
Nodes (10): Apalkov, Dieny, Slaughter (2016) STT-MRAM (Proc. IEEE), Burr et al. (2010, 2017) PCM technology & neuromorphic NVM, MRAM BEOL 3D integration (logic-on-MRAM), MTJ structure & TMR ratio, Part 3 — MRAM (STT, VCMA, MTJ), PCM drift R(t)=R_0(t/t_0)^ν compensation, PCM SET/RESET (chalcogenide GST amorphous↔crystalline), STT critical current density J_c (+2 more)

### Community 8 - "Hiratani Node Perturbation + Stage 2 Tier 1"
Cohesion: 0.4
Nodes (5): Removes weight transport requirement (biological plausibility), Biologically plausible deep learning framework, Towards Biologically Plausible Deep Learning (Bengio et al. 2015), STDP-as-gradient-descent learning rule, Variational EM via neural dynamics

## Knowledge Gaps
- **77 isolated node(s):** `Natural gradient on parameterized search distribution`, `Principled black-box optimization`, `Random fixed feedback weights for credit assignment`, `STDP-as-gradient-descent learning rule`, `Variational EM via neural dynamics` (+72 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `4-Part Material Collection Plan (ws)` connect `Part 1 Modulation + 4-Part Collection Plan` to `ES + EML + Backprop-free Algorithms (Part 4 hub)`, `Translinear + Volterra + PCM Devices (Part 2/3 cross)`, `Mead/Liu/Vittoz Analog VLSI (Part 2 textbooks)`, `Charge-storage NVM + MRAM (Part 3 devices)`, `Semiconductor Physics (Sze/Tsividis/EKV)`?**
  _High betweenness centrality (0.593) - this node is a cross-community bridge._
- **Why does `Part 2 — Volterra/Wiener Nonlinear System Theory (Rugh, Schetzen, Boyd-Chua)` connect `ES + EML + Backprop-free Algorithms (Part 4 hub)` to `Translinear + Volterra + PCM Devices (Part 2/3 cross)`, `Forward-only / DFA / Feedback Alignment`, `Part 1 Modulation + 4-Part Collection Plan`?**
  _High betweenness centrality (0.425) - this node is a cross-community bridge._
- **Why does `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` connect `Forward-only / DFA / Feedback Alignment` to `Hiratani Node Perturbation + Stage 2 Tier 1`, `ES + EML + Backprop-free Algorithms (Part 4 hub)`?**
  _High betweenness centrality (0.244) - this node is a cross-community bridge._
- **Are the 9 inferred relationships involving `4-Part Material Collection Plan (ws)` (e.g. with `Part 1 — Information Theory & Sampling Classics (Shannon, Nyquist, Inose)` and `Part 1 — Data Conversion Textbooks (Razavi, Pelgrom, Norsworthy, Roza)`) actually correct?**
  _`4-Part Material Collection Plan (ws)` has 9 INFERRED edges - model-reasoned connections that need verification._
- **Are the 6 inferred relationships involving `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` (e.g. with `Direct Feedback Alignment (Nokland 2016)` and `Deep Learning without Weight Transport (Akrout et al. 2019)`) actually correct?**
  _`Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` has 6 INFERRED edges - model-reasoned connections that need verification._
- **Are the 5 inferred relationships involving `Part 2 — Volterra/Wiener Nonlinear System Theory (Rugh, Schetzen, Boyd-Chua)` (e.g. with `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` and `Equilibrium Propagation (Scellier & Bengio 2016)`) actually correct?**
  _`Part 2 — Volterra/Wiener Nonlinear System Theory (Rugh, Schetzen, Boyd-Chua)` has 5 INFERRED edges - model-reasoned connections that need verification._
- **Are the 4 inferred relationships involving `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` (e.g. with `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)` and `Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework`) actually correct?**
  _`Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` has 4 INFERRED edges - model-reasoned connections that need verification._