# 그래프 보고서 (Graph Report) - ./raw  (2026-04-23)

## 코퍼스 점검 (Corpus Check)
- 34 파일 · 약 47,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 442개 · 엣지(edge) 1013개 · 커뮤니티(community) 14개 검출
- 추출 결과: 37% EXTRACTED · 9% INFERRED · **0% AMBIGUOUS** · INFERRED 엣지 87개 (평균 신뢰도 0.8)
- **모든 AMBIGUOUS 엣지 해소 완료** — Theorem 3 (Layer D)이 두 남은 엣지를 EXTRACTED로 승격

## 이번 대규모 업데이트 요약

세 개의 Layer 노트를 한꺼번에 추가:
- **Layer C** (Symbolic Foundations) — 기호 정의 완전 집합
- **Layer D** (Deterministic Dynamics + Theorems 1-3) — 결정적 ODE + 증명 3편
- **Layer S** (Stochastic Dynamics + Theorems 4-5) — SDE + 수렴/잡음-내성 정리

**하이퍼엣지 `formulation_complete_chain` [EXTRACTED 0.95]** — 세 Layer의 main + 다섯 정리 + continual-learning 따름정리를 하나로 묶음. **수학적 Formulation이 완전히 정립되었음을 그래프가 선언**.

## 커뮤니티 허브 (Community Hubs)
- [[_COMMUNITY_Charge-Trap Consolidation + Catalog Pairs 256|Charge-Trap 공고화 + 카탈로그 Pair 2/5/6]]
- [[_COMMUNITY_Analog Multiplication (Gilbert + log-domain + crossbar)|아날로그 곱셈 (Gilbert + log-domain + 크로스바)]]
- [[_COMMUNITY_Physical Reinterpretation of DL + Bit-Plane Encoder|딥러닝 물리적 재해석 + 비트-플레인 인코더]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|서브임계 스코어 + 비선형성 실현]]
- [[_COMMUNITY_Symbolic Regression + EML Master + Adam|기호 회귀 + EML 마스터 + Adam]]
- [[_COMMUNITY_Convergence Theory + NTK + Layer-S Theorem 4|수렴 이론 + NTK + Layer-S 정리 4]]
- [[_COMMUNITY_Analog In-Memory Attention + Gain-Cell|아날로그 인메모리 어텐션 + 게인 셀]]
- [[_COMMUNITY_Reactive Medium + Stateful Interaction Field|반응 매질 + 상태를 가진 상호작용장]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem|KAN + 콜모고로프-아놀드 정리]]
- [[_COMMUNITY_Formulation Layer C — Operator Definitions|Formulation Layer C — 연산자 정의]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor (TEXEL)|Beyond-CMOS 뉴로모픽 프로세서 (TEXEL)]]
- [[_COMMUNITY_Geometric OOD + Manifold LID|기하학적 OOD + 매니폴드 LID]]
- [[_COMMUNITY_LIF Neuron + EGG (Evolved Generative GRU)|LIF 뉴런 + EGG]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안 ES]]

## 갓 노드 (God Nodes)
1. `Stage-2 Architecture — EGGROLL-PPCA` - 엣지 50개 (+6)
2. `Subthreshold Exponential Regime (primitive)` - 엣지 29개
3. `EGGROLL Algorithm` - 엣지 26개
4. `Physics Correspondence Table` - 엣지 22개 ← **NEW (Layer C)**
5. `Formulation Layer D — Deterministic Dynamics and Theorems 1-3` - 엣지 22개 ← **NEW**
6. `Log-Domain / Translinear Computation (primitive)` - 엣지 21개
7. `Rank-r Perturbation Structure` - 엣지 20개 (+6)
8. `CMOS MOSFET (Bulk-Silicon)` - 엣지 20개
9. `Three-Tier Memory Hierarchy` - 엣지 20개
10. `Component N — Selective-passing nonlinearity` - 엣지 19개

### 구조적 변화

| 지표 | 이전 | 이후 | Δ |
|---|---|---|---|
| 노드 | 358 | **442** | +84 |
| 엣지 | 729 | **1013** | +284 |
| 커뮤니티 | 17 | **14** | −3 (이론 노드가 기존 fragmented 클러스터를 흡수) |
| AMBIGUOUS | 2 | **0** | −2 ✓ |
| PPCA main 차수 | 44 | **50** | +6 |

### Layer별 진입 위상

- **Layer C (Operator Definitions)** → 자기 고유 커뮤니티 C9 형성 (25 노드). E/W/N/D/S/R 연산자들이 한 클러스터로 결집.
- **Layer D (Theorems 1-3)** → 노드 차수 22로 top-5 진입. Physical Reinterpretation / State-Region / Bit-Level 세 방향으로 다리.
- **Layer S (Theorems 4-5)** → Convergence Theory + NTK 커뮤니티(이전 3-노드 thin)를 34-노드 대형 커뮤니티로 **확장**. 그래프가 Theorem 4를 흡수한 결과.
- `Physics Correspondence Table` → 22 edges (Layer C의 물리 대응표 노드) — 모든 연산자의 소자 대응을 검증하는 허브.

### AMBIGUOUS 0 달성의 의미

Theorem 3 (switched Volterra operator 표현)이
- `Punch-Through ↔ Depth as Iterative Flow`
- `Kink ↔ State-Region Dictionary`
두 AMBIGUOUS 엣지를 **이론적으로 해소**했고, 해당 원본 엣지를 제거했습니다. 이제 그래프 전체에 AMBIGUOUS 엣지가 **단 하나도 없음** — 모든 관계가 EXTRACTED 또는 INFERRED로 근거 있음.

### 남은 주요 질문 (AMBIGUOUS은 아니지만 검증 필요한 INFERRED)

Layer S의 세 개 numerical prediction이 Stage 2 (simulation)에서 검증되어야:
1. **T4 수렴률 예측** — 손실 곡선이 EGGROLL의 O(r⁻¹)을 따르는가?
2. **T5 MSE bound 예측** — 정상상태 가중치 오차가 device σ²/η · Tr(H⁻¹)에 맞는가?
3. **Continual learning 복원시간 예측** — 분포 shift 후 τ_W 시간으로 재조정하는가?

### 다음 작업 후보

1. **Review** — 사용자가 세 Layer 노트를 정독 후 수정 피드백. 이론 완결성은 그래프 상 선언되었지만 실제 proof quality는 human review 필요.
2. **Stage 2 시작** — Stage 3a functional simulation 착수. Layer S의 세 prediction을 NumPy로 검증.
3. **노이즈 모델 구체화** — Layer S 노이즈 §1.2 (1/f) 의 분석 기법(fractional Brownian motion)을 별도 노트로 분리.
