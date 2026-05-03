# 그래프 보고서 (Graph Report) - ./raw  (2026-05-03)

## 코퍼스 점검 (Corpus Check)
- 28 파일 · 약 36,500 단어
- 노드 156개 · 엣지 210개 · 커뮤니티 9개 · AMBIGUOUS 0

## 이번 update — Part 1·2·3 자료 보강 완료

9개 thematic textbook summary 노트 추가:

| 파트 | 추가 노트 |
|---|---|
| Part 1 | `part1_information_theory_classics.md` (Shannon, Nyquist, Inose ΣΔ) + `part1_data_conversion_textbooks.md` (Razavi, Pelgrom, ΣΔ, Roza) |
| Part 2 | `part2_analog_vlsi_neuromorphic.md` (Mead, Liu, Vittoz) + `part2_translinear_principle.md` (Gilbert, Toumazou) + `part2_volterra_wiener_theory.md` (Rugh, Schetzen, Boyd-Chua) |
| Part 3 | `part3_semiconductor_physics_textbooks.md` (Sze, Tsividis, EKV) + `part3_memristor_pcm.md` (Strukov, Ielmini-Waser, Burr) + `part3_mram.md` (Apalkov STT, Wang VCMA) + `part3_charge_storage_nvm.md` (Pavan flash, Hasler FG, Müller FeRAM, NS-RAM) |

총 ~27개 textbook/classic paper 참조가 9개 통합 노트로 정리.

## Top 10 갓 노드

| Rank | Node | Edges |
|---|---|---|
| 1 | 4-Part Material Collection Plan (ws) | 13 |
| 2 | Part 3 — Semiconductor Devices | 10 |
| 3 | Random Feedback Weights / FA (Lillicrap 2014) | 9 |
| 4 | Part 2 — Volterra/Wiener Theory | 9 |
| 5 | Hinton: Forward-Forward Algorithm | 8 |
| 6 | Mead (1989) Analog VLSI | 8 |
| 7 | Part 3 — Memristor & PCM | 8 |
| 8 | EGGROLL (Sarkar et al.) | 7 |
| 9 | Joshi et al. PCM Inference | 7 |
| 10 | Part 2 — Operator Correspondence | 7 |

## 9개 커뮤니티 — 4-Part 구조와의 직접 매핑

| C# | 노드 수 | 응집도 | 주제 | 대응 Part |
|---|---|---|---|---|
| C0 | 27 | 0.09 | Volterra/Wiener + Hinton FF + EGGROLL + EquProp | **Part 4 핵심 + Part 2 SP-completeness** |
| C1 | 24 | 0.11 | Part 3 devices + Memristor/PCM + Joshi + Part 2 operator | **Part 2/3 cross-hub** |
| C2 | 23 | 0.10 | Feedback Alignment + DFA + Akrout + Forward Gradient + Liao | **Part 4 — bio-plausible 학습 가족** |
| C3 | 19 | 0.13 | 4-Part Plan + Part 1 textbooks + ΣΔ Inose | **Part 1 + Plan hub** |
| C4 | 18 | 0.15 | Mead 1989 + Gilbert + Liu + Translinear | **Part 2 textbook 정전** |
| C5 | 18 | 0.14 | NVM/Flash + Sze textbook + NS-RAM | **Part 3 charge-storage** |
| C6 | 12 | 0.18 | Salimans ES + Hiratani + NES | **Part 4 — ES 가족** |
| C7 | 10 | 0.27 | Burr PCM + STT/VCMA-MRAM + MTJ | **Part 3 — Memory tier 3** |
| C8 | 5 | 0.40 | Bengio Bio-plausible + STDP | **Part 4 외곽 — bio-inspired** |

**관찰**: 9개 커뮤니티가 4-Part 구조를 자연스럽게 반영. Part 1 (1개), Part 2 (2개), Part 3 (2개), Part 4 (3개), 하이브리드 (2개). 가장 큰 C0가 "Volterra + 학습 알고리즘"의 cross-cutting hub로 형성된 것이 의미 있음 — 이론과 알고리즘의 자연스런 통합점.

## 5대 교량 노드 (Top Betweenness)

| Bet | Deg | Node |
|---|---|---|
| 0.593 | 13 | 4-Part Material Collection Plan (ws) |
| 0.425 | 9 | Volterra/Wiener Theory note |
| 0.244 | 9 | Lillicrap FA |
| 0.163 | 6 | Part 4 plan node |
| 0.133 | 8 | Memristor & PCM note |

**해석**:
- **Plan 노드**가 압도적 betweenness — 4 part 모두를 잇는 골격, 의도된 구조임.
- **Volterra/Wiener**가 두 번째 — Part 2 (operator)와 Part 4 (학습)을 잇는 수학적 다리. SP-completeness 정리가 두 영역을 연결.
- **Lillicrap FA**가 알고리즘 가족(C2)과 다른 backprop-free 가족 사이의 다리.
- **Memristor/PCM**이 Part 2/3 cross-hub 안에서 device family를 통합.

## 2 — 그래프 구조 분석 (사용자 요청 항목)

### 8개 알고리즘 가족이 그래프에 나타나는 패턴

```
  Backprop-free 가족 분류:
  
  Evolution Strategies (C6)         ─ NES, Salimans ES, Hiratani NP, EGGROLL
  Forward-only / FF (C0 일부)        ─ Hinton FF, Sigprop, Forward Gradient
  Feedback Alignment (C2)           ─ Lillicrap, DFA, DRTP, Akrout, Liao
  Bio-plausible (C8 + C0 일부)      ─ EquProp, Bengio, STDP
```

→ **그래프가 알고리즘 가족을 정확히 분리**. 같은 Part 4 안에서도 4개 sub-family가 다른 community.

### Part별 textbook→arxiv 연결의 직접 가시화

`Mead Analog VLSI (1989)` → 그래프 상에서 다음과 직접 연결:
- Gilbert translinear (C4 내부 → Part 2 통합)
- Subthreshold MOSFET (C4 → C5 device 가족)
- Floating-gate adaptive synapse (C5 charge-storage)
- Frenkel-Indiveri survey (C0 cross-link, neuromorphic 시초)

→ 60년 textbook이 2024 survey와 직접 path로 연결됨. 구조적으로 입증된 사상의 계승.

### Volterra/Wiener의 hub 위상의 이유

`Volterra/Wiener Theory` 노트가 다음과 동시에 연결:
- EGGROLL (학습이 Volterra kernel 변경)
- EquProp (energy minimization → fixed-point 해석이 Volterra와 호환)
- Forward-Forward (forward-only는 polynomial composition)
- Mead Analog VLSI (operator algebra의 회로 구현)
- Translinear (구체 회로가 Volterra polynomial 합성)

→ **Part 2 (operator algebra)와 Part 4 (학습)의 수학적 다리**. 이 노드 없으면 두 영역이 분리됨.

### 수학적 응집도 차이

| Community | Cohesion | 해석 |
|---|---|---|
| C8 Bio-plausible | 0.40 | 작은 크기 + tight (Bengio + STDP만) |
| C7 PCM/MRAM | 0.27 | Memory tier 3 family — narrow 주제 |
| C6 ES | 0.18 | NES + Salimans + Hiratani 일관 |
| C4 Mead/Gilbert | 0.15 | Part 2 textbook 가족 |
| C3 Plan + Part 1 | 0.13 | Plan 노드가 cross-link 많아 응집도 ↓ |
| C2 FA | 0.10 | 가족 내 변형 다양 |
| C1 Device cross | 0.11 | 가장 cross-cutting |
| C0 Volterra + ES + FF | 0.09 | **가장 다양한 cross-link, 골격 hub** |

→ **응집도가 낮은 community = 골격 역할**. C0가 가장 흥미로운 영역 (이론·알고리즘 교차지점).

## 권장 다음 작업 (이번 두 작업 완료 후)

1. **Part 4 통합 outline 작성** — backprop-free 4 가족 (ES, FA, Forward-only, Bio-plausible)이 어떻게 PPCA-class 시스템에서 통합 또는 선택되는지 정리
2. **Volterra hub 심화 분석** — Part 2 operator를 Part 4 학습에 어떻게 연결하는 정리들 (예: switched-Volterra ↔ ES rank-1 perturbation)
3. **Tier-1 textbook 36개 → 더 깊은 self-summary** — 현재 ~3 페이지/textbook을 ~7 페이지로 확장

또는 부족한 부분 보강:
4. **Part 1 textbook 직접 PDF 다운로드** — Shannon, Nyquist, Inose 원전 (IEEE Xplore 무료 영역)
5. **Mead 1989 챕터별 PDF** — 저자 CalTech 사이트 일부 무료
