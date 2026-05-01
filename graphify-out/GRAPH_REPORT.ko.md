# 그래프 보고서 (Graph Report) - ./raw  (2026-05-02)

## 코퍼스 점검 (Corpus Check)
- 코퍼스 규모 약 6,541 단어 — 단일 컨텍스트 윈도우(context window)에 들어갑니다. 그래프가 꼭 필요하지 않을 수 있습니다.

## 요약 (Summary)
- 노드 79개 · 엣지(edge) 89개 · 커뮤니티(community) 8개 검출
- 추출 결과: 75% EXTRACTED · 25% INFERRED · 0% AMBIGUOUS · INFERRED 엣지 22개 (평균 신뢰도 0.83)
- 토큰(token) 비용: 입력 0 · 출력 0

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Evolution Strategies (NES + Salimans + EGGROLL)|진화 전략(Evolution Strategies, NES + Salimans + EGGROLL)]]
- [[_COMMUNITY_Forward-only  Forward Gradient|순전파 전용(Forward-only) / 순전파 기울기(Forward Gradient)]]
- [[_COMMUNITY_Feedback Alignment (Lillicrap + Akrout + Liao)|피드백 정렬(Feedback Alignment, Lillicrap + Akrout + Liao)]]
- [[_COMMUNITY_Direct Feedback Alignment + DRTP|직접 피드백 정렬(Direct Feedback Alignment) + DRTP]]
- [[_COMMUNITY_PCM Neural Network Training|상변화 메모리(PCM) 신경망 학습]]
- [[_COMMUNITY_Bio-plausible Learning (EquProp, Bengio)|생물학적 타당 학습(Bio-plausible Learning, EquProp, Bengio)]]
- [[_COMMUNITY_4-Part Collection Plan + Forward-Pass Algorithms|4-Part 수집 계획 + 순전파(Forward-Pass) 알고리즘]]
- [[_COMMUNITY_Neuromorphic 2022-2024 Surveys|뉴로모픽(Neuromorphic) 2022-2024 서베이]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` - 엣지 7개
2. `Evolution Strategies as Scalable RL (Salimans et al. 2017)` - 엣지 6개
3. `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop` - 엣지 6개
4. `Part 3 — Semiconductor Devices (instances of Part 2 operators)` - 엣지 6개
5. `Part 4 — Neural Operator + Backprop-Free Optimization` - 엣지 6개
6. `Direct Feedback Alignment (Nokland 2016)` - 엣지 5개
7. `Deep Learning without Weight Transport (Akrout et al. 2019)` - 엣지 5개
8. `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)` - 엣지 5개
9. `Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework` - 엣지 5개
10. `Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks` - 엣지 5개

## 놀라운 연결들 (Surprising Connections, 미처 몰랐을 관계)
- `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)` --semantically_similar_to--> `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`  [INFERRED] [의미적 유사성(semantically similar)]
  raw/arxiv_2202_08587.md → raw/arxiv_1411_0247.md
- `Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks` --semantically_similar_to--> `Evolution Strategies as Scalable RL (Salimans et al. 2017)`  [INFERRED] [의미적 유사성]
  raw/arxiv_2310_00965.md → raw/arxiv_1703_03864.md
- `Natural Evolution Strategies (Wierstra et al. 2011)` --semantically_similar_to--> `Evolution Strategies as Scalable RL (Salimans et al. 2017)`  [INFERRED] [의미적 유사성]
  raw/arxiv_1106_4487.md → raw/arxiv_1703_03864.md
- `Direct Feedback Alignment (Nokland 2016)` --cites_or_extends--> `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`  [INFERRED]
  raw/arxiv_1609_01596.md → raw/arxiv_1411_0247.md
- `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)` --semantically_similar_to--> `Deep Learning without Weight Transport (Akrout et al. 2019)`  [INFERRED] [의미적 유사성]
  raw/arxiv_1411_0247.md → raw/arxiv_1904_05391.md

## 하이퍼엣지 (Hyperedges, 그룹 관계)
- **Feedback Alignment family of bio-plausible learning algorithms** —  [EXTRACTED 0.95]
- **Evolution Strategies family of black-box optimizers** —  [EXTRACTED 0.95]
- **Pure Forward-Only Learning Family (Sigprop + Forward-Forward + Forward Gradient)** —  [EXTRACTED 0.90]
- **PCM Neural Network Hardware Pair (Inference + L2L Adaptation)** —  [EXTRACTED 1.00]
- **Neuromorphic 2022-2024 Survey Pair (Christensen Roadmap + Frenkel-Bol-Indiveri)** —  [EXTRACTED 1.00]
- **4-Part Collection Plan Hyperstructure** —  [EXTRACTED 1.00]

## 커뮤니티들 (Communities)

### 커뮤니티 0 - "진화 전략(Evolution Strategies, NES + Salimans + EGGROLL)"
응집도(Cohesion): 0.18
노드 (12개): Principled black-box optimization, Natural Evolution Strategies (Wierstra et al. 2011), Natural gradient on parameterized search distribution, Natural Evolution Strategies (NES) algorithm, Common random numbers communication (scalar exchange), Evolution Strategies for reinforcement learning, Evolution Strategies as Scalable RL (Salimans et al. 2017), Massively parallel scaling to 1000+ workers (+4 more)

### 커뮤니티 1 - "순전파 전용(Forward-only) / 순전파 기울기(Forward Gradient)"
응집도: 0.18
노드 (11개): Forward gradient (directional derivative estimator), Forward-mode automatic differentiation, Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022), Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework, Sigprop: Global Supervised Learning via Forward Path Only, Sigprop: Compatibility with Hardware and Biological Learning (no weight transport, no feedback), Sigprop: Trains Spiking and Continuous-Time Networks with Hebbian Updates, Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop (+3 more)

### 커뮤니티 2 - "피드백 정렬(Feedback Alignment, Lillicrap + Akrout + Liao)"
응집도: 0.22
노드 (10개): Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014), Random fixed feedback weights for credit assignment, Batch Normalization / Batch Manhattan stabilization, Feedback weight magnitudes irrelevant; only signs matter, How Important is Weight Symmetry in Backpropagation? (Liao et al. 2015), Sign-symmetric (sign-concordant) feedback weights, Near-backprop ImageNet performance without weight transport, Modified Kolen-Pollack feedback learning (+2 more)

### 커뮤니티 3 - "직접 피드백 정렬(Direct Feedback Alignment) + DRTP"
응집도: 0.22
노드 (10개): Feedback Alignment algorithm, Direct Feedback Alignment (DFA) algorithm, Direct random projection from output to each hidden layer, Layer-independent training without error backprop, Direct Feedback Alignment (Nokland 2016), Direct Random Target Projection (DRTP) algorithm, Solves update locking; suitable for edge devices, Direct Random Target Projection / DRTP (Frenkel et al. 2019) (+2 more)

### 커뮤니티 4 - "상변화 메모리(PCM) 신경망 학습"
응집도: 0.22
노드 (10개): Joshi et al.: Accurate DNN Inference Using Computational Phase-Change Memory, PCM Inference: Batch-Norm-Based Drift Compensation for Retention, PCM Inference: 71.6% ImageNet Top-1 / 93.7% CIFAR-10 on PCM Hardware, PCM Inference: ResNet Training Methodology with No Accuracy Loss after Weight Transfer, Ortner et al.: Learning-to-Learn with PCM-Based In-Memory Computing, PCM L2L: Demonstrated on CNN Image Classification and SNN Robotic Arm Control, PCM L2L: Rapid Edge Adaptation with Few Parameter Updates, PCM L2L: Meta-Training in Software, Deployment on PCM NMHW (+2 more)

### 커뮤니티 5 - "생물학적 타당 학습(Bio-plausible Learning, EquProp, Bengio)"
응집도: 0.22
노드 (9개): Removes weight transport requirement (biological plausibility), Biologically plausible deep learning framework, Towards Biologically Plausible Deep Learning (Bengio et al. 2015), STDP-as-gradient-descent learning rule, Variational EM via neural dynamics, Equilibrium Propagation algorithm, Equilibrium Propagation (Scellier & Bengio 2016), Single neural computation for inference and error backprop (+1 more)

### 커뮤니티 6 - "4-Part 수집 계획 + 순전파(Forward-Pass) 알고리즘"
응집도: 0.22
노드 (9개): Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks, Node Perturbation: Alignment with Directional Derivative, Node Perturbation: Input Decorrelation per Layer Boosts Convergence, Node Perturbation: On-Chip Learning in Noisy Neuromorphic Systems, 4-Part Material Collection Plan (ws), Part 1 — Digital/Analog Modulation and Decoding, Part 1 Tier 1 Priority List (7 items: Shannon, Nyquist, Norsworthy, Inose, Razavi, Pelgrom, Roza), Part 4 — Neural Operator + Backprop-Free Optimization (+1 more)

### 커뮤니티 7 - "뉴로모픽(Neuromorphic) 2022-2024 서베이"
응집도: 0.29
노드 (8개): Christensen et al.: 2022 Roadmap on Neuromorphic Computing and Engineering, Roadmap: Algorithms, Applications, and Edge Deployment Perspectives, Roadmap: Survey of Materials, Devices and Circuits for Neuromorphic Computing, Frenkel, Bol, Indiveri: Bottom-Up vs Top-Down Neuromorphic Design, Frenkel-Indiveri: Tradeoffs Between Bottom-Up Biological and Top-Down ML Approaches, Frenkel-Indiveri: Analog/Mixed-Signal/Digital Circuit Design Style Comparison, Part 2 — Analog Math Operator vs Physical Operator Correspondence, Part 2 Tier 1 Priority List (8 items: Mead, Liu et al., Gilbert, Toumazou, Rugh, Schetzen, Vittoz)

## 지식 공백 (Knowledge Gaps)
- **고립 노드 46개:** `Natural gradient on parameterized search distribution`, `Principled black-box optimization`, `Random fixed feedback weights for credit assignment`, `STDP-as-gradient-descent learning rule`, `Variational EM via neural dynamics` (+41 more)
  연결이 1개 이하 — 누락된 엣지이거나 문서화되지 않은 컴포넌트(component)일 수 있습니다.

## 추천 질문 (Suggested Questions)
_이 그래프가 고유하게 답할 수 있는 질문들:_

- **왜 `Part 4 — Neural Operator + Backprop-Free Optimization`이 `4-Part Collection Plan + Forward-Pass Algorithms`를 `Evolution Strategies (NES + Salimans + EGGROLL)`, `Forward-only / Forward Gradient`와 이어주는가?**
  _높은 매개 중심성(betweenness centrality) 0.633 — 이 노드는 커뮤니티 간 교량(bridge) 역할._
- **왜 `Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop`이 `Forward-only / Forward Gradient`를 `4-Part Collection Plan + Forward-Pass Algorithms`와 이어주는가?**
  _높은 매개 중심성 0.534 — 커뮤니티 간 교량 노드._
- **왜 `Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`가 `Feedback Alignment (Lillicrap + Akrout + Liao)`를 `Forward-only / Forward Gradient`, `Direct Feedback Alignment + DRTP`, `Bio-plausible Learning (EquProp, Bengio)`과 이어주는가?**
  _높은 매개 중심성 0.526 — 커뮤니티 간 교량 노드._
- **`Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`와 관련된 4개의 추론(INFERRED) 관계 (예: `Direct Feedback Alignment (Nokland 2016)`, `Deep Learning without Weight Transport (Akrout et al. 2019)`와의 연결)가 실제로 맞는가?**
  _`Random Feedback Weights / Feedback Alignment (Lillicrap et al. 2014)`에는 INFERRED 엣지가 4개 있음 — 모델이 추론한 연결이라 검증이 필요._
- **`Evolution Strategies as Scalable RL (Salimans et al. 2017)`와 관련된 3개의 추론(INFERRED) 관계 (예: `Natural Evolution Strategies (Wierstra et al. 2011)`, `Dalm/Hiratani-style: Node Perturbation Can Effectively Train Multi-Layer Networks`와의 연결)가 실제로 맞는가?**
  _`Evolution Strategies as Scalable RL (Salimans et al. 2017)`에는 INFERRED 엣지가 3개 있음 — 모델이 추론한 연결이라 검증이 필요._
- **`Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop`과 관련된 2개의 추론(INFERRED) 관계 (예: `Kohan: Signal Propagation (sigprop) — Forward-Pass Learning Framework`, `Gradients without Backpropagation / Forward Gradient (Baydin et al. 2022)`와의 연결)가 실제로 맞는가?**
  _`Hinton: The Forward-Forward Algorithm — Two Forward Passes Replace Backprop`에는 INFERRED 엣지가 2개 있음 — 모델이 추론한 연결이라 검증이 필요._
- **`Natural gradient on parameterized search distribution`, `Principled black-box optimization`, `Random fixed feedback weights for credit assignment`는 시스템의 나머지와 어떻게 연결되는가?**
  _약연결(weakly-connected) 노드 46개 검출 — 문서화 공백이거나 누락된 엣지일 가능성._
