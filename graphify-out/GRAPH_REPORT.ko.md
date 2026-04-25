# 그래프 보고서 (Graph Report) - ./raw  (2026-04-25)

## 코퍼스 점검 (Corpus Check)
- 41 파일 · 약 71,500 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 542개 · 엣지(edge) 1310개 · 커뮤니티(community) 15개
- 추출 결과: 0% AMBIGUOUS 유지

## 이번 업데이트 — 단계별 이론 전개 (Class Generalization)

대안 카탈로그가 보여준 "PPCA = 한 instance"의 함의를 수학적 일반화로 격상한 9단계 전개:

| Step | 내용 | 결과물 |
|---|---|---|
| 0 | 모티베이션: instance → class | 일반화 필요성 |
| 1 | 7개 admissible operator class 정의 (𝒞_E, 𝒞_W, 𝒞_N, 𝒞_D, 𝒞_S, 𝒞_R, 𝒞_Σ) | 멤버십 조건 |
| 2 | Generalized Layer C (parametric) | ℳ_PPCA 정의 |
| 3 | Theorem 1' (Generalized Well-Posedness) | Picard-Lindelöf의 class-수준 적용 |
| 4 | Theorem 2' (Generalized Realizability) | 카탈로그 자체가 증명 |
| 5 | Theorem 3' (Generalized SP Completeness) | Switched Volterra가 모든 𝒞_N 멤버에 적용 |
| 6 | Theorem 4' (Generalized Convergence) | REINFORCE 일반화로 모든 𝒞_S에 적용 |
| 7 | Theorem 5' (Generalized Noise Bound) | σ_eff²(𝒮)로 application별 정량 예측 |
| 8 | Specialization Map: Application → Spec(A) ∈ ℳ_PPCA | 4 application bundle의 수학적 위치 |
| 9 | Verification Protocol (5단계 체크리스트) | 새 슬롯 후보의 형식 검증 절차 |

### 핵심 결과

- **PPCA가 single instance에서 instance-family ℳ_PPCA로 격상**
- 각 정리(T1'-T5')가 class membership 조건만 검증되면 자동 적용
- 새 device/circuit 후보 추가가 5단계 protocol로 환원
- σ_eff²가 application-dependent이므로 정량 예측이 application별로 다름

### REINFORCE 일반화의 의미

기존 Layer S는 Gaussian S에 의존했지만 Step 6에서 **REINFORCE identity (Williams 1992)**의 일반 형태를 사용:
```
∇_W E[S(W; ξ)] = E[S · ∇_W log p(ξ; W)]
```
이로써 photon-counting score (Poisson), race logic (delay-coded), PWM duty-cycle 모두 같은 수렴 정리에 포함됨.

## 갓 노드 (Top 10)

| Rank | Node | Edges |
|---|---|---|
| 1 | EGGROLL-PPCA Architecture | 56 (+3) |
| 2 | Subthreshold Exponential Regime | 30 |
| 3 | EGGROLL Algorithm | 27 |
| 4 | Theorem 4 (Convergence) | 26 (+1) |
| 5 | Formulation Layer D | 25 |
| 6 | Theorem 3 (Switched Volterra) | 25 (+1) |
| 7 | Theorem 5 (Noise Tolerance) | 23 (+1) |
| 8 | Physics Correspondence Table | 22 |
| 9 | Pair 7 (Kink ↔ ReLU Polytope) | 21 |
| 10 | Log-Domain / Translinear | 21 |

PPCA가 53→56으로 +3 — class 일반화 노드들이 PPCA를 ℳ_PPCA의 한 specialization으로 명시적으로 위치시킴.

T3, T4, T5가 모두 +1씩 — generalized 버전이 각 정리를 강화.

### 새 커뮤니티 — C3 "Class Generalization + Catalog + ℳ_PPCA"

13개의 theory_dev 노드가 카탈로그 노드와 한 클러스터 형성. 이 커뮤니티가 "PPCA design space의 수학적 형식화"를 한 점으로 묶음.

### 구조적 변화

| 지표 | 이전 | 이후 | Δ |
|---|---|---|---|
| 노드 | 517 | **542** | +25 |
| 엣지 | 1243 | **1310** | +67 |
| 커뮤니티 | 17 | **15** | −2 (theory_dev가 catalog와 흡수) |
| AMBIGUOUS | 0 | **0** | 유지 |
| PPCA main 차수 | 53 | **56** | +3 |

### 새 master hyperedge

`theory_dev_class_gen_master_unification` [EXTRACTED 0.95] — main + ℳ_PPCA + alternative_candidate_catalog_main + stage2_eggroll_ppca_main + Layer C/D/S main을 한 묶음으로. **"Canonical PPCA = ℳ_PPCA의 한 specialization"**을 그래프가 공리 수준으로 진술.

### 다음 작업

이론 일반화가 완료되었으므로:
1. **Stage 3a functional simulation** — 4개 application bundle 각각에 대해 generalized T5' bound를 NumPy로 검증
2. **Verification Protocol 적용** — 새 device 후보(예: VCMA-MRAM, photon counter)에 대해 9단계 protocol 실제로 돌리기
3. **σ_eff² 매트릭스 작성** — 각 (slot, candidate) 쌍의 노이즈 기여 정량값 표
