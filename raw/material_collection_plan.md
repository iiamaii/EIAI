---
title: 4-Part 자료 수집 계획
author: ws
captured_at: 2026-05-02
contributor: ws
note_type: material_collection_plan
---

# 4-Part 자료 수집 계획

각 파트별로 **Tier 1 (필수)** / **Tier 2 (보조)** / **Tier 3 (심화)** 로 구분. Tier 1 부터 ingest 후 그래프 형성, Tier 2-3는 빈 곳 발견 시 보강.

표기:
- `[arxiv]` — arxiv 검색 가능
- `[journal]` — IEEE/Nature/JMLR 등
- `[book]` — 단행본 (저자 + 출판사)
- `[?]` — 정확한 publication 미상, title/author로 검색 필요

---

## Part 1 — 디지털 ↔ 아날로그 변조 / 복호화

신호 인터페이스. Bit-stream과 analog signal 간 양방향 변환 + 정보보존 정리.

### Tier 1 (필수 — 7편)

**고전 정보 이론**
- Shannon, *A Mathematical Theory of Communication* (Bell System Tech. J., 1948) — sampling, channel capacity. `[journal]`
- Nyquist, *Certain Topics in Telegraph Transmission Theory* (Trans. AIEE, 1928) — sampling theorem 원전. `[journal]`

**ΣΔ 변환** (1-bit oversampled 변조)
- Norsworthy, Schreier, Temes, *Delta-Sigma Data Converters: Theory, Design, and Simulation* (Wiley-IEEE, 1996). `[book]`
- Inose, Yasuda, Murakami, *A telemetering system by code modulation: Δ–Σ modulation* (1962) — ΣΔ 원전. `[journal]`

**ADC/DAC 표준 textbook**
- Razavi, *Principles of Data Conversion System Design* (Wiley-IEEE, 1995). `[book]`
- Pelgrom, *Analog-to-Digital Conversion* (Springer, 3rd ed. 2017). `[book]`

**시간-도메인 인코딩**
- Roza, *Analog-to-Digital Conversion via Duty-Cycle Modulation* (IEEE TCAS-II, 1997) — PWM 변환. `[journal]`

### Tier 2 (보조 — 5편)

- Murmann, *Survey of ADCs published 1997-present* (annual web compilation). 자료 보충용.
- Stojanovic, Horowitz, *Modeling and analysis of high-speed links* (CICC 2003) — high-speed signaling 잡음. `[journal]`
- Gardner, *A Transformation for Digital Simulation of Analog Filters* (TCS, 1986) — 변환 정리.
- Cutler, *Differential Quantization of Communication Signals* (US patent 2,605,361, 1952) — predictive ΣΔ 원전.
- Iniewski, *Data Converters for Wireless Standards* (Springer 2016) — 현대 응용. `[book]`

### Tier 3 (심화)
- Schreier, Temes, *Understanding Delta-Sigma Data Converters* (Wiley-IEEE, 2nd ed. 2017) — 깊이 있는 ΣΔ 이론. `[book]`
- Hauke et al., *Stochastic computing for image processing* — stochastic bitstream 응용. `[?]`

---

## Part 2 — Analog 수학 operator ↔ 물리 operator 대응

함수공간 위 수학 연산이 어느 물리 메커니즘과 1:1로 대응하는가.

### Tier 1 (필수 — 8편)

**Analog VLSI 정전(定典)**
- Mead, *Analog VLSI and Neural Systems* (Addison-Wesley, 1989) — subthreshold 트랜지스터 + neural circuit primitive 시초. `[book]`
- Liu, Kramer, Indiveri, Delbruck, Douglas, *Analog VLSI: Circuits and Principles* (MIT Press, 2002) — neuromorphic 표준 교재. `[book]`

**Translinear principle (log-domain)**
- Gilbert, *Translinear Circuits: A Proposed Classification* (Electronics Letters, 1975) — translinear 원전. `[journal]`
- Gilbert, *A precise four-quadrant multiplier with subnanosecond response* (IEEE JSSC, 1968) — Gilbert cell 원전. `[journal]`
- Toumazou, Lidgey, Haigh (eds.), *Analogue IC Design: The Current-Mode Approach* (Peter Peregrinus / IET, 1990). `[book]`

**Volterra/Wiener nonlinear operator 이론**
- Rugh, *Nonlinear System Theory: The Volterra/Wiener Approach* (Johns Hopkins, 1981) — 저자 웹 PDF 무료. `[book]`
- Schetzen, *The Volterra and Wiener Theories of Nonlinear Systems* (Wiley, 1980). `[book]`

**서브임계 / 약 inversion 회로**
- Vittoz, *Weak Inversion for Ultimate Low-Power Logic* (Low-Power Electronics Design, 2004 — also earlier ISSC tutorials). `[?]`

### Tier 2 (보조 — 6편)

- Mead, *Neuromorphic Electronic Systems* (Proc. IEEE, 1990) — 1.5 mA mood paper.
- Mead, *Adaptive Retina* (1989 ISCAS) + *Silicon Retina* (Mead & Mahowald, 1988).
- Diorio, Hasler, Minch, Mead, *A Single-Transistor Silicon Synapse* (IEEE TED, 1996) — floating-gate analog memory.
- Hasler, *Continuous-Time Feedback in Floating-Gate MOS Circuits* (TCAS-II 2001) — 적응 회로.
- Boyd, Chua, *Fading Memory and the Problem of Approximating Nonlinear Operators with Volterra Series* (IEEE TCS, 1985) — Volterra 수렴 조건.
- Sandini, Indiveri, Liu — 뉴로모픽 시스템 사례 모음.

### Tier 3 (심화)
- Gilbert, *Translinear Circuits: An Historical Overview* (Analog Integrated Circuits and Signal Processing, 1996) — primer.
- Murray, Smith, *Asynchronous Arithmetic for VLSI Neural Systems* (Electronics Letters 1987) — 비동기 회로.

---

## Part 3 — 반도체 소자 (Part 2 operator의 instances)

각 물리 mechanism을 구현하는 specific device family.

### Tier 1 (필수 — 12편)

**소자 물리 정전**
- Sze, Ng, *Physics of Semiconductor Devices* (Wiley, 4th ed. 2021) — bandgap, MOS, BJT 등 표준. `[book]`
- Tsividis, *Operation and Modeling of the MOS Transistor* (Oxford, 3rd ed. 2010) — 모든 동작 영역. `[book]`

**메모리스터 / ReRAM**
- Strukov, Snider, Stewart, Williams, *The missing memristor found* (Nature, 2008). `[journal]` — 멤리스터 실증.
- Ielmini, Waser (eds.), *Resistive Switching* (Wiley-VCH, 2016) — 종합서. `[book]`

**상변화 메모리 (PCM)**
- Burr et al., *Phase change memory technology* (J. Vac. Sci. Tech. B, 2010). `[journal]`
- Burr, Shelby, Sebastian et al., *Neuromorphic computing using non-volatile memory* (Adv. Phys. X, 2017). `[arxiv?]`

**MRAM (STT/VCMA)**
- Apalkov, Dieny, Slaughter, *Magnetoresistive Random Access Memory* (Proc. IEEE, 2016). `[journal]`
- Wang, Khalili Amiri, *Voltage-controlled magnetic anisotropy in magnetic tunnel junctions* (Spin, 2012). `[journal]`

**Floating-gate / Flash**
- Pavan et al., *Flash Memory Cells — An Overview* (Proc. IEEE, 1997). `[journal]`
- Hasler, Diorio, Minch, *Adaptive circuits using pFET floating-gate devices* (1999 Conf.). `[?]`

**FeRAM / 강유전**
- Müller et al., *Ferroelectric hafnium oxide based materials and devices* (J. Appl. Phys., 2015). `[journal]`

**서브임계 + 부유 벌크 (NS-RAM)**
- 우리가 이전에 보유했던 *Synaptic and neural behaviours* paper — 다시 추가 필요.

### Tier 2 (보조 — 8편)

- Salahuddin, Datta, *Use of negative capacitance to provide voltage amplification...* (Nano Lett. 2008) — NC-FET.
- Yu, *Neuro-inspired computing with emerging non-volatile memory* (Proc. IEEE, 2018). 종합 survey.
- Sebastian et al., *Memory devices and applications for in-memory computing* (Nature Nano., 2020). `[journal]`
- Christensen et al., *2022 roadmap on neuromorphic computing and engineering* (Neuromorphic Comp. Eng., 2022). 종합 roadmap.
- Indiveri, *Memristive Devices for Neuromorphic Engineering*. 회로-소자 연결.
- Boybat et al., *Neuromorphic computing with multi-memristive synapses* (Nature Comm., 2018) — multi-cell consolidation.
- Onen et al., *Nanosecond protonic programmable resistors for analog deep learning* (Science, 2022) — 초고속 NVM.
- Verma et al., *In-memory computing: Advances and prospects* (IEEE SSCM, 2019).

### Tier 3 (심화)
- Lin et al., *Three-dimensional memristor circuits as complex neural networks* (Nature Electronics, 2020).
- Ambrogio et al., *Equivalent-accuracy accelerated neural-network training using analogue memory* (Nature, 2018) — IBM PCM training 사례.
- Recent Lightmatter, Mythic AI 백서 (광/아날로그 가속기 산업 사례).

---

## Part 4 — Neural operator + Backprop-free optimization

학습 가능 시스템 + 비역전파 최적화.

### Tier 1 (필수 — 12편)

**Score-function / Evolution Strategies (forward-only)**
- Williams, *Simple Statistical Gradient-Following Algorithms for Connectionist Reinforcement Learning* (Mach. Learn., 1992) — REINFORCE 원전. `[journal]`
- Wierstra, Schaul, Peters, Schmidhuber, *Natural Evolution Strategies* (JMLR 2014). `[arxiv]`
- Salimans, Ho, Chen, Sutskever, *Evolution Strategies as a Scalable Alternative to Reinforcement Learning* (arXiv:1703.03864, 2017). `[arxiv]`
- 우리가 이전 had: *Evolution Strategies at the Hyperscale* (EGGROLL) — 다시 ingest.

**Local-only / feedback-alignment 가족**
- Lillicrap, Cownden, Tweed, Akerman, *Random feedback weights support learning in deep neural networks* (Nature Communications, 2016). `[arxiv]`
- Nøkland, *Direct Feedback Alignment Provides Learning in Deep Neural Networks* (NeurIPS 2016). `[arxiv]`
- Hinton, *The Forward-Forward Algorithm: Some Preliminary Investigations* (arXiv:2212.13345, 2022). `[arxiv]`

**Equilibrium / Predictive Coding (생물학적 plausibility)**
- Scellier, Bengio, *Equilibrium Propagation: Bridging the Gap Between Energy-Based Models and Backpropagation* (Front. Comput. Neurosci., 2017). `[arxiv]`
- Whittington, Bogacz, *An Approximation of the Error Backpropagation Algorithm in a Predictive Coding Network with Local Hebbian Synaptic Plasticity* (Neural Computation, 2017). `[journal]`

**Forward-mode auto-diff**
- Baydin, Pearlmutter, et al., *Gradients without Backpropagation* (arXiv:2202.08587, 2022). `[arxiv]`

**Stochastic approximation 이론적 기반**
- Borkar, *Stochastic Approximation: A Dynamical Systems Viewpoint* (Cambridge, 2008). `[book]`
- Robbins, Monro, *A Stochastic Approximation Method* (Ann. Math. Stat., 1951). `[journal]`

### Tier 2 (보조 — 8편)

- 우리가 이전 had: NoProp, Hebbian with Global Direction — 다시 ingest.
- Movellan, *Contrastive Hebbian Learning in the Continuous Hopfield Model* (1991).
- Bengio, Lee, Bornschein, Mesnard, Lin, *Towards Biologically Plausible Deep Learning* (arXiv:1502.04156, 2015). `[arxiv]`
- Liao, Leibo, Poggio, *How Important is Weight Symmetry in Backpropagation?* (AAAI 2016). `[arxiv]`
- Frenkel, Lefebvre, Bol, *Learning without feedback: Direct random target projection as a feedback-alignment algorithm with layerwise feedforward training* (Frontiers Neurosci., 2021). `[arxiv]`
- Kohan et al., *Signal Propagation: A Framework for Learning and Inference in a Forward Pass* (IEEE TNNLS 2023). `[arxiv]`
- Liao et al., *Direct Feedback Alignment with Sparse Connections for Local Learning* (Frontiers Neurosci., 2019). `[arxiv]`
- Akrout et al., *Deep Learning without Weight Transport* (NeurIPS 2019). `[arxiv]`

### Tier 3 (심화)
- Sun, Tang, Yan, Burr, Sebastian — neural network training on analog memory papers (industry).
- Spall, *Multivariate stochastic approximation using a simultaneous perturbation gradient approximation* (IEEE TAC, 1992) — SPSA, ES와 가족.
- Khasminskii, *Stochastic Stability of Differential Equations* (Springer, 2nd ed. 2012) — Lyapunov 정전.
- Kushner, Yin, *Stochastic Approximation and Recursive Algorithms and Applications* (Springer, 2nd ed. 2003).

---

## 수집 우선순위 추천

**1차 wave** (Tier 1 만, 39편 ≈ 30~40 PDFs):
- Part 1 Tier 1 (7) + Part 2 Tier 1 (8) + Part 3 Tier 1 (12) + Part 4 Tier 1 (12)
- 이걸로 4-파트 골격 작성 가능

**2차 wave** (필요 시):
- Tier 2 추가 (총 27편) — 빈 곳 발견 시 보강

**3차** (research depth 필요 시):
- Tier 3 추가

## 수집 방법

| 종류 | 방법 |
|---|---|
| arXiv 논문 | `/graphify add https://arxiv.org/abs/...` 로 자동 fetch (abstract + metadata md로 저장) |
| Open-access journal | 위와 동일 (URL이 PDF 링크) |
| 페이월 journal | 사용자 수동 다운로드 → `raw/` 직접 저장 |
| 단행본 | 챕터별 PDF 발췌 또는 자체 정리 노트 |
| 무료 공개 PDF | 저자 웹사이트 또는 textbook 사이트에서 다운로드 |

graphify의 `/graphify add` 기능은 arXiv URL → 자동 abstract/metadata 추출. 단행본은 직접 정리 노트 (`book_summary_<author>.md`) 작성이 효율적.

## Tier 1 39편 분배 요약

| Part | Tier 1 편수 | 핵심 |
|---|---|---|
| 1 (변조/복호화) | 7 | Shannon, Nyquist, ΣΔ 정전, Razavi/Pelgrom textbook, Roza PWM |
| 2 (operator 대응) | 8 | Mead 1989, Liu et al. 2002, Gilbert translinear, Rugh Volterra |
| 3 (반도체 소자) | 12 | Sze, Tsividis, Strukov memristor, Burr PCM, Apalkov MRAM, NS-RAM |
| 4 (Neural operator + 학습) | 12 | Williams REINFORCE, Wierstra NES, Salimans ES, Hinton Forward-Forward, Scellier-Bengio EquProp, Borkar |

## 다음 단계

1. **이 계획서 검토** — 빠진 핵심 자료 또는 불필요한 자료 지정
2. **arXiv URL 우선 ingest** — `/graphify add` 가능한 것부터 (대부분 Part 4 Tier 1)
3. **단행본 self-summary 노트 작성** — Mead 1989, Liu 2002, Sze, Rugh — 챕터별 핵심 추출
4. **첫 wave 종료 후 4-파트 outline 작성**

검토 후 첫 wave를 시작하겠습니다.
