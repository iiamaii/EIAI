# 그래프 보고서 (Graph Report) - ./raw  (2026-04-23)

## 코퍼스 점검 (Corpus Check)
- 31 파일 · 약 38,000 단어
- 판정: 코퍼스가 그래프 구조로 가치를 얻을 만한 규모입니다.

## 요약 (Summary)
- 노드 358개 · 엣지(edge) 729개 · 커뮤니티(community) 17개 검출
- 추출 결과: 48% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED 엣지 87개 (평균 신뢰도 0.8)

## 커뮤니티 허브 (Community Hubs, 내비게이션)
- [[_COMMUNITY_Charge-Trap Consolidation + Tier-23 Memory Bridge|Charge-Trap 공고화(Consolidation) + Tier-2/3 메모리 교량]]
- [[_COMMUNITY_Analog Multiplication + Beyond-CMOS Hardware|아날로그 곱셈(Analog Multiplication) + Beyond-CMOS 하드웨어]]
- [[_COMMUNITY_Symbolic Regression + EML Master + Catalog Core|기호 회귀(Symbolic Regression) + EML 마스터 + 카탈로그 중심]]
- [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization|서브임계(Subthreshold) 스코어 + 비선형성 실현]]
- [[_COMMUNITY_Physical Reinterpretation of DL + Bit-Plane|딥러닝 물리적 재해석(Physical Reinterpretation) + 비트 플레인(Bit-Plane)]]
- [[_COMMUNITY_LLM Memory + Conditional Lookup|LLM 메모리 + 조건부 룩업(Conditional Lookup)]]
- [[_COMMUNITY_KAN + Kolmogorov-Arnold Theorem|KAN + 콜모고로프-아놀드(Kolmogorov-Arnold) 정리]]
- [[_COMMUNITY_Beyond-CMOS Neuromorphic Processor (TEXEL)|Beyond-CMOS 뉴로모픽(Neuromorphic) 프로세서 (TEXEL)]]
- [[_COMMUNITY_EML + Log-Domain Arithmetic Family|EML + 로그-도메인(Log-Domain) 산술 가족]]
- [[_COMMUNITY_Self-Organizing CMOS-Memory + Reactive Medium|자기조직 CMOS-메모리(Self-Organizing CMOS-Memory) + 반응 매질(Reactive Medium)]]
- [[_COMMUNITY_Stateful Interaction Field & Axiomatization|상태를 가진 상호작용장(Stateful Interaction Field) 및 공리화(Axiomatization)]]
- [[_COMMUNITY_Geometric OOD + Manifold LID|기하학적 OOD + 매니폴드(Manifold) LID]]
- [[_COMMUNITY_Analog In-Memory Attention + Gain-Cell (body-extracted)|아날로그 인메모리 어텐션(Analog In-Memory Attention) + 게인 셀(Gain-Cell)]]
- [[_COMMUNITY_Binarized NN + XNOR Pipeline|이진 신경망(Binarized NN) + XNOR 파이프라인]]
- [[_COMMUNITY_LIF Neuron + Electronic Synapse|LIF 뉴런 + 전자 시냅스(Electronic Synapse)]]
- [[_COMMUNITY_Convergence Theory & NTK|수렴 이론(Convergence Theory)과 NTK]]
- [[_COMMUNITY_Matrix Gaussian ES|행렬 가우시안(Matrix Gaussian) ES]]

## 갓 노드 (God Nodes, 가장 많이 연결된 노드 — 핵심 추상(abstraction))
1. `Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)` - 엣지 44개 (+5)
2. `Subthreshold Exponential Regime (primitive)` - 엣지 24개
3. `EGGROLL Algorithm` - 엣지 22개
4. `Log-Domain / Translinear Computation (primitive)` - 엣지 19개
5. `EML Operator eml(x,y)=exp(x)-ln(y)` - 엣지 18개
6. `CMOS MOSFET (Bulk-Silicon)` - 엣지 18개
7. `Device-Math Correspondence Catalog` - 엣지 18개
8. **`Three-Tier Memory Hierarchy + Sensor Readout (PPCA Extension)` - 엣지 18개** ← **신규 진입**
9. `Component N — Selective-passing nonlinearity (transistor I-V)` - 엣지 17개
10. `Gilbert Cell Four-Quadrant Multiplier (primitive)` - 엣지 17개

## 이번 확장의 의미

PPCA는 **학습**은 해도 **기억을 보존하지 못하는** 구조였습니다. 이번 Three-Tier Memory 확장이 다음을 추가:

### Tier 계층
- **Tier 1** — Floating-bulk δG (τ_fast ≈ 100 ns): 섭동 상태
- **Tier 2** — Charge-trap G (τ_slow ≈ 10 μs–hours): 살아있는 가중치
- **Tier 3** — Flash/MRAM G_archive (τ_permanent ≈ years): **영구 아카이브** — 신규

### Phase 7 — Snapshot/Restore
기존 6-단계 operational cycle에 비동기(asynchronous) 7번째 단계 추가. Tier-2 → Tier-3 스냅샷은 세 가지 트리거 중 하나로 이벤트 구동:
1. 학습 포화 (fitness 분산이 임계 이하로 떨어지면)
2. 스케줄 (시간 단위 안전망)
3. 외부 트리거 (저장 명령, 전원 차단 인터럽트)

### Sensor Readout Path — 센서 관측 가능성
Row-column address scan + non-destructive probe current로 외부 시스템이 G를 **센서처럼** 읽을 수 있음. 아날로그 출력으로 내보내면 "ADC 없음" 원칙 유지.

### 3-Role Device Simultaneity
같은 실리콘이 네 역할을 동시에:
- **Learner** (빠름): 순전파 + 공고화
- **Live memory** (느림): Tier-2 G
- **Sensor** (임의 시간): row-column scan
- **Persistent archive** (영구): Tier-3

"반수동 적응 메모리 디바이스" 정의가 문자 그대로 성립.

### Semi-Passive Physical Neural Devices와의 직접 연결
가장 중요한 엣지: `three_tier_memory_tier3_permanent_archive` --`extends [EXTRACTED 1.0]`--> `semi_passive_physical_neural_devices_flash_slow_parameter`. 이 노트는 새 발명이 아니라 기존 Semi-Passive 논문의 "flash를 slow parameter로" 제안을 **3-tier 구조로 체계화**한 것.

### 새 하이퍼엣지 2개
- `three_tier_memory_hierarchy` [EXTRACTED 1.0] — Tier 1/2/3 + PPCA main을 한 가족으로
- `three_role_device_simultaneous` [INFERRED 0.9] — learner/live-memory/sensor/archive 동시성

### 3개의 새 실패 모드 (명시적 문서화)
1. **Snapshot-during-learning race** — 공고화 write 중 스냅샷. 해결: double-buffered 래치
2. **Restore divergence** — 복원 후 perturbation 재초기화로 궤적 이탈. 해결: σ도 Tier-3에 저장
3. **Readout-induced forgetting** — 잦은 probe가 셀 교란. 해결: 전체 스캔은 ≤ τ_slow 주기당 한 번

### MVC(Stage 5) 설계 결정 노출
Tier-3를 MVC에 포함할지 vs 연기할지 명시적 노드로 등장. **defer** 추천 — MVC는 Tier 1+2 + sensor readout까지만, Tier 3는 Stage 6로 연기. Sensor readout 자체는 MVC에서도 필수.

## 지표 변화

| 지표 | 이전 | 이후 | Δ |
|---|---|---|---|
| 노드 | 333 | **358** | +25 |
| 엣지 | 648 | **729** | +81 |
| 커뮤니티 | 16 | **17** | +1 |
| AMBIGUOUS | 2 | **2** | 변화 없음 (Neural ODE가 열쇠) |
| PPCA main 차수 | 39 | **44** | +5 |

## 남은 과제

AMBIGUOUS 2개는 여전히 Neural ODE/Hanin-Rolnick 논문 추가를 기다립니다. 하지만 이번 확장으로 **"반수동 메모리"**라는 목표의 정의는 그래프에서 비로소 완성되었습니다 — 학습 + 보존 + 관측 + 영구화의 네 축이 모두 명시적 노드로 존재.
