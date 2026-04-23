# 그래프 보고서 (Graph Report) - ./raw  (2026-04-24)

## 코퍼스 점검 (Corpus Check)
- 39 파일 · 약 62,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 485개 · 엣지(edge) 1197개 · 커뮤니티(community) 13개
- 추출 결과: 39% EXTRACTED · 7% INFERRED · **0% AMBIGUOUS** · INFERRED 엣지 87개 (평균 신뢰도 0.8)

## 이번 업데이트 — 이론 배경 노트 5편 추가

Layer C/D/S 증명에 사용된 수학적 도구들을 체계화한 5개 배경 문서:

| 문서 | 주요 내용 | 지원하는 Layer |
|---|---|---|
| `math_theory_01_ode_foundations.md` | Picard-Lindelöf, Lipschitz, Gronwall, LTI 합성곱, Taylor, Volterra 시리즈 | Layer D T1·T3 |
| `math_theory_02_piecewise_systems.md` | Piecewise-Linear, Hyperplane Arrangement, Zaslavsky, Hanin-Rolnick, Switched Volterra | Layer D T3 Part (b) |
| `math_theory_03_stochastic_calculus.md` | Brownian, Itô 적분·Lemma, SDE, Fokker-Planck, OU 과정, Lyapunov 방정식 | Layer S SDE + T4·T5 |
| `math_theory_04_stochastic_approximation.md` | Robbins-Monro, Kushner-Yin ODE 방법, Borkar two-timescale, Khasminskii, NES/REINFORCE | Layer S T4 |
| `math_theory_05_gaussian_concentration.md` | Gaussian annulus, Edgeworth 전개, NTK, Information Geometry | Layer S T5 + EGGROLL 수렴률 |

각 문서는 **정리 진술 + 수학 유도 + 한글 의미 해설 + 우리 formulation에서의 사용 이유 + 참조 문헌 링크** 포함.

## 커뮤니티 허브 (13개, 이론 노트 반영)
- [[_COMMUNITY_Symbolic Regression + EML + Theory Chain 4|기호 회귀 + EML + 이론 사슬 4 (확률 근사)]]
- [[_COMMUNITY_Analog Multiplication + Theory Chain 5|아날로그 곱셈 + 이론 사슬 5 (Gaussian 집중)]]
- [[_COMMUNITY_Analog Primitives + Theory Chain 3|아날로그 원시단위 + 이론 사슬 3 (확률 미적분)]]
- [[_COMMUNITY_Charge-Trap Consolidation + Catalog Pair 2|Charge-Trap 공고화 + 카탈로그 Pair 2]]
- [[_COMMUNITY_Physical Reinterpretation of DL + Bit-Plane|딥러닝 물리적 재해석 + 비트-플레인]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|서브임계 스코어 + 비선형성 실현]]
- [[_COMMUNITY_Formulation Layer CD — Operators + Theorems 1-3 + Theory Chain 1-2|Formulation Layer C/D — 연산자 + 정리 1-3 + 이론 사슬 1-2]]
- [[_COMMUNITY_Analog In-Memory Attention + Gain-Cell|아날로그 인메모리 어텐션 + 게인 셀]]
- [[_COMMUNITY_Stateful Interaction Field + Axiomatization|상태를 가진 상호작용장 + 공리화]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem|KAN + 콜모고로프-아놀드 정리]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor|Beyond-CMOS 뉴로모픽 프로세서]]
- [[_COMMUNITY_Geometric OOD + Manifold LID|기하학적 OOD + 매니폴드 LID]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안 ES]]

## 갓 노드 (God Nodes)
1. `Stage-2 Architecture — EGGROLL-PPCA` - 엣지 50개
2. `Subthreshold Exponential Regime (primitive)` - 엣지 30개 (+1)
3. `EGGROLL Algorithm` - 엣지 27개 (+1)
4. `Formulation Layer D — Deterministic Dynamics and Theorems 1-3` - 엣지 25개 (+3)
5. **`Theorem 4 — Learning convergence a.s.`** - 엣지 25개 ← **이론 4가 승격시킴**
6. **`Theorem 3 — Signal-Processing Completeness (Switched Volterra)`** - 엣지 24개 ← **이론 1, 2가 승격**
7. `Physics Correspondence Table` - 엣지 22개
8. **`Theorem 5 — Noise tolerance bound`** - 엣지 22개 ← **이론 3, 5가 승격**
9. `Pair 7: Kink Effect ↔ ReLU Polytope Boundary` - 엣지 21개 (+6)
10. `Log-Domain / Translinear Computation (primitive)` - 엣지 21개

**주목**: Theorem 3, 4, 5가 모두 상위 10위에 입장. 배경 이론 사슬이 각 정리의 수학적 뼈대를 직접 지탱하게 되었음. Pair 7이 +6 상승 — Hanin-Rolnick 경계가 kink↔ReLU polytope identity를 수학적으로 뒷받침.

### 구조적 지표

| 지표 | 이전 | 이후 | Δ |
|---|---|---|---|
| 노드 | 442 | **485** | +43 |
| 엣지 | 1013 | **1197** | +184 |
| 커뮤니티 | 14 | **13** | −1 (이론이 Formulation Layer 커뮤니티 흡수) |
| AMBIGUOUS | 0 | **0** | 유지 |
| 이론이 tier-1 정리들을 지원하는 엣지 | 0 | **~50** | 신규 |

### 이론 사슬 × Layer 매트릭스

```
Layer C  ← 이론 1 (ODE foundations): Lipschitz 조건 제공 for T1
Layer D  ← 이론 1 (Picard, Gronwall, LTI, Taylor, Volterra): T1 & T3 증명 도구
Layer D  ← 이론 2 (Zaslavsky, Hanin-Rolnick, switched Volterra): T3 Part (b)
Layer S  ← 이론 3 (Brownian, Itô, Fokker-Planck, OU, Lyapunov eqn): SDE 골격 + T5
Layer S  ← 이론 4 (Robbins-Monro, Borkar, Khasminskii, NES): T4 전체
Layer S  ← 이론 5 (Gaussian annulus, Edgeworth, NTK): T5 + EGGROLL rank convergence
```

각 이론 노트는 해당 Layer 정리 증명에 **없으면 안 되는** 도구만을 다룸. 과잉 일반화 없이 필요한 만큼만.

### 문헌 참조 (한글 독해 가능한 자료 우선)

각 이론 노트에 정전(定典) 수준 참조가 포함됨:
- **ODE**: Coddington & Levinson, Rugh (Volterra 정전, 저자 웹사이트 PDF 공개)
- **Piecewise**: Zaslavsky Mem. AMS, Stanley 강의노트(PDF 공개), Hanin-Rolnick [arXiv:1906.00904]
- **Stochastic**: Karatzas & Shreve, Øksendal, Risken (Fokker-Planck 정전)
- **Stochastic Approximation**: Kushner-Yin, Borkar 2008 (two-timescale 정전)
- **Gaussian Concentration**: Vershynin HDP (무료 PDF), NTK [arXiv:1806.07572]

### 다음 작업 후보

1. **Review 단계** — 다섯 이론 노트의 수학적 정확성을 정독. 각 증명 스케치가 실제로 맞는지, 참조 문헌이 정확한지, 한글 해설이 오해를 부르지 않는지.
2. **Stage 3a 착수** — 이제 이론이 완성되었으므로 NumPy functional simulation 시작. Layer S §7의 세 numerical prediction을 실험적으로 검증.
3. **Formulation v2** — 만약 이론 검토에서 gap이 발견되면 Layer C/D/S의 해당 부분을 업데이트하고 `formulation_layer_*_v2.md`를 추가.

사용자의 정밀한 검토 기다립니다.
