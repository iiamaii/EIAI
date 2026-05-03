---
title: Part 1 — 정보 이론과 표본화 정리 (Shannon, Nyquist, ΣΔ 기원)
author: ws
captured_at: 2026-05-03
contributor: ws
note_type: textbook_classic_summary
part: 1
covers:
  - Nyquist (1928) "Certain Topics in Telegraph Transmission Theory"
  - Shannon (1948) "A Mathematical Theory of Communication"
  - Inose, Yasuda, Murakami (1962) — ΣΔ modulation origin
---

# Part 1 — 정보 이론과 표본화 정리 (Information Theory and Sampling Classics)

Part 1의 수학적 기초를 이루는 세 고전. 디지털↔아날로그 변환의 **이론 한계**를 정의하고, 그 한계 안에서 동작하는 변조 방식의 첫 발자취를 보여준다.

---

## 1. Nyquist (1928) — 표본화 정리(Sampling Theorem)의 기원

### 핵심 진술

대역폭 `B` Hz로 제한된 신호 `x(t)`는 표본화율 `f_s ≥ 2B`로 균등 표본화하면 정보 손실 없이 복원 가능하다.

```
  x(t) = Σ_{n=-∞}^{∞} x(n T_s) · sinc((t − n T_s) / T_s)
```
여기서 `T_s = 1/f_s`, `sinc(x) = sin(πx)/(πx)`.

### 유도 직관

신호 `x(t)`를 임펄스 열 `δ_T(t) = Σ δ(t − nT)`와 곱하면 표본화 결과의 Fourier 변환은 원 신호 스펙트럼 `X(f)`의 주파수-shift된 복제본의 합:
```
  X_s(f) = (1/T) Σ X(f − k/T)
```
주기 `1/T`가 `2B` 이상이어야 복제본이 겹치지 않고 (aliasing 없음), `[-B, B]` 대역만 추출하면 원 신호 복원.

### 한글 의미

**"신호의 가장 빠른 변동(주파수 B)의 두 배로 찍기만 하면 모두 복원된다."** 이게 **모든 ADC의 기본 한계**. ADC가 샘플링하는 주파수는 `2 × signal bandwidth` 이상이어야 한다.

### Part 1·2와의 연결

- **Part 1 (encoder E)**: 𝒰의 정의에 `bandlimited to B` 조건이 들어감 — Nyquist가 그 정당화.
- **Part 2 (operator algebra)**: `f_s = 2B` 조건이 신호 공간을 유한 차원 ℝᴺ과 동치(infinite-dim L² ↔ N-dim ℝᴺ via 표본화)로 만들어 모든 후속 정리의 차원 분석을 가능케 함.

### 참조
- Nyquist, *Certain Topics in Telegraph Transmission Theory*, Trans. AIEE, 47 (1928), pp. 617-644 — IEEE Xplore 또는 Bell Labs archive 무료.

---

## 2. Shannon (1948) — 정보 이론의 수학적 기초

세 가지 핵심 정리(채널 용량, 통신 계수, 표본화 정리 재진술) + 정보의 정량 척도(엔트로피).

### 2.1 엔트로피(Entropy)와 정보의 정의

확률 분포 `p(x)`의 엔트로피:
```
  H(X) = -Σ p(x) log₂ p(x)   (단위: bit)
```

해석: `X`의 결과를 평균적으로 인코딩하는 데 필요한 최소 비트 수. 균등 분포에서 최대, 결정적 분포에서 0.

### 2.2 표본화 정리 (Shannon 1948 재진술)

Nyquist를 일반화: 대역 `B` 신호 `x(t)`는 `2B + ε` 표본/초로 표현 가능.

```
  x(t) = Σ x(nT) sinc(2B(t − nT))
```

### 2.3 채널 용량 정리(Channel Capacity)

대역폭 `B`, 신호 전력 `S`, 백색 잡음 전력 `N`인 채널의 정보 용량:
```
  C = B · log₂(1 + S/N)   bits/second
```

이 식이 **정보를 잡음 위에 보낼 수 있는 한계**. SNR이 높을수록, 대역이 넓을수록 더 많은 비트 전송 가능.

### 2.4 노이즈-내성 코딩 정리

채널 용량 `C` 미만의 속도로 보내는 메시지는 임의로 작은 오류율로 복원 가능 (충분히 긴 코드 사용 시).

### 한글 의미

**"잡음이 있어도 정보를 무손실로 보낼 수 있는 절대 한계가 존재하며, 그 한계는 SNR과 대역폭에 의해 정확히 결정된다."** 이는 ADC 설계의 두 번째 기본 제약 — quantization 잡음에 따른 effective bits = `(SQNR − 1.76) / 6.02`.

### Part 1·2·4와의 연결

- **Part 1**: ADC의 SNR/SQNR 분석 (예: ΣΔ 변환의 noise shaping이 Shannon 한계에 어떻게 접근하는가)
- **Part 4**: 정보 이론적 학습 — Tishby의 information bottleneck, mutual information optimization 등 후속 ML 이론의 기반
- **모든 Part**: SNR 분석의 표준 언어

### 참조
- Shannon, *A Mathematical Theory of Communication*, Bell System Tech. J., 27 (1948), pp. 379-423, 623-656 — 무료 PDF 다수 (저자 사망 후 고전).

---

## 3. ΣΔ 변조의 기원 — Inose, Yasuda, Murakami (1962)

### 배경

1962년 Bell Labs의 Cutler가 differential PCM을 제안한 이후, 1962년 Inose 그룹이 ΣΔ (Sigma-Delta) 변조를 처음 발표. 핵심 아이디어: **1-bit 양자화기**를 negative feedback loop 안에 넣어 양자화 잡음을 고주파로 밀어내기 (noise shaping).

### 1차 ΣΔ 구조

```
  x(t) ──[+]──→ ∫ ──→ 1-bit 양자화기 ──→ y(t)
          ↑                              │
          └──── (-y(t)) ←───────────────┘
```

수학:
```
  Y(z) = X(z) + (1 − z⁻¹) · Q(z)
```
- 신호 X는 그대로 통과 (passband transfer function = 1)
- 양자화 잡음 Q는 `(1 − z⁻¹)` 고역 통과 (high-pass) 필터로 통과
- 결과: 신호 대역 안의 잡음 전력이 dramatically 감소 (SNR 향상)

### Oversampling 이득

표본화율이 Nyquist의 `OSR` 배 (`f_s = 2B · OSR`)이면 1차 ΣΔ의 SQNR 향상:
```
  SQNR_dB = 6.02·N + 1.76 − 5.17 + 30·log₁₀(OSR)
                                        ↑
                                  대역당 잡음 줄이는 양
```
N=1 (1-bit), OSR=64에서 → SQNR ≈ 50 dB (~8-bit 등가).

### 차수 증가 (Higher-order ΣΔ)

L차 ΣΔ의 SQNR:
```
  SQNR_dB ≈ 6.02·N + 1.76 + (20L+10)·log₁₀(OSR) − 10·log₁₀(π^(2L) / (2L+1))
```
실용적으로 L=2-4가 안정성과 noise shaping의 균형점.

### 한글 의미

**"양자화 잡음을 신호 대역 밖으로 push하는 feedback 루프"** — 1-bit DAC 만으로 16-24비트 등가 정밀도 가능. 현대 audio ADC, 산업용 정밀 측정 ADC의 표준 구조.

### Part 1·3와의 연결

- **Part 1 (encoder E)**: 우리 formulation의 "Encoder Option B — pulse-density (unary)" 가 본질적으로 ΣΔ 1-bit 스트림. 평균값 = analog value.
- **Part 3 (devices)**: Switched-cap integrator (Op-amp + 커패시터 + 스위치)와 1-bit 비교기 (CMOS comparator) 만으로 구현 가능 → 모든 슬롯이 표준 CMOS 호환.
- **Part 4**: stochastic computing의 곱셈 = AND gate (베르누이 비트스트림 곱은 평균에서 곱셈)이 ΣΔ 출력에 직접 적용 가능.

### 참조
- Inose, Yasuda, Murakami, *A telemetering system by code modulation: Δ–Σ modulation*, IRE Transactions on Space Electronics and Telemetry, SET-8 (1962), pp. 204-209.
- Norsworthy, Schreier, Temes (eds.), *Delta-Sigma Data Converters: Theory, Design, and Simulation*, Wiley-IEEE Press (1996) — 종합서.

---

## 세 고전의 통합 — Part 1의 "수학적 헌법(constitution)"

```
  Nyquist 1928       표본화 가능 조건 → 신호공간 유한차원화
       ↓
  Shannon 1948       정보 한계 정의 → SQNR 상한
       ↓
  Inose 1962         그 한계에 접근하는 첫 실용 회로 → ΣΔ
```

이 셋이 **Part 1 모든 인코더 후보의 평가 기준**:
- 각 후보의 표본화율 (Nyquist 충족 여부)
- 각 후보의 효과적 비트 (Shannon SQNR)
- 각 후보의 잡음 형성(noise shaping) 능력 (ΣΔ-파생 여부)

### 우리 formulation에서의 역할

Layer C 정의 1.1 (`𝒰 = bandlimited to B, finite L²`)은 **Nyquist의 직접 상속**.
Layer S Theorem 5의 `σ_th² = k_B T / C`는 **Shannon의 SNR 분석의 device-physics 인스턴스**.
Encoder Option B (pulse-density)는 **ΣΔ의 단순화된 형태** — 우리 PPCA-class formulation 안에서 ΣΔ 변조를 직접 사용 가능.

### Part 1 Tier 1에서 남은 4편 (다음 노트)

- Razavi, *Principles of Data Conversion System Design* — ADC/DAC 회로 표준 textbook
- Pelgrom, *Analog-to-Digital Conversion* — converter 종합 reference
- Norsworthy/Schreier/Temes ΣΔ Converters — 위에서 인용, 깊이 있는 ΣΔ 이론
- Roza, *PWM-based ADC* — 시간-도메인 인코딩 변형

→ `part1_data_conversion_textbooks.md`에서 정리.
