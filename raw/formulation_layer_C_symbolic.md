---
title: Formulation Layer C — Symbolic Foundations
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: formulation_layer_c
builds_on: [raw/bit_analog_formulation_v1.md, raw/stage2_eggroll_ppca_architecture.md, raw/three_tier_memory_hierarchy.md]
---

# Formulation Layer C — Symbolic Foundations

Purpose: pin down every signal space, every state variable, every operator, and every time constant that the semi-passive adaptive memory device formulation will use. Nothing is left undefined at this layer — subsequent layers (D deterministic dynamics, S stochastic dynamics) reference only the symbols defined here. Each symbol is accompanied by its physical device correspondence so the formulation remains physics-closed by construction.

---

## Design Constraint — Physics Closure

A symbol belongs in this formulation only if it has a concrete semiconductor-device or analog-signal-processing realization. Symbols admitted:

- Continuous-time signal ∈ ℝ^d → voltage/current waveform on a wire
- Matrix of conductances → memristor / charge-trap / floating-gate array
- Scalar current → output of a transistor stage
- Impulse (point measure) → rising-edge event on a comparator or clock
- Ensemble expectation → time-average over long window

Symbols forbidden: discrete-alphabet symbols, stored programs, lookup tables, random-access arrays, conditionals on symbolic predicates. If a construction needs such a symbol, the formulation is incomplete and must be restructured.

---

## Section 1 — Signal Spaces

### Definition 1.1 (Input signal space)
```
  𝒰 := { u : ℝ₊ → ℝ^d  |  u continuous,  ess-supp(Û) ⊂ [−B, B],  ‖u‖_{L²} < ∞ }
```
continuous-time, bandlimited to B (cutoff frequency), finite energy. `u(t)` represents the physical input voltage vector on `d` device input pins.

### Definition 1.2 (Internal state signal space)
```
  𝒳 := C¹(ℝ₊; ℝ^m)
```
continuously differentiable time-functions valued in ℝ^m. `x(t)_i` is the voltage on internal node `i`, bounded by silicon rails [V_SS, V_DD]. Differentiability corresponds to RC-filtered analog signals (no idealized step transitions).

### Definition 1.3 (Output signal space)
```
  𝒴_analog := C(ℝ₊; ℝ^p)            continuous analog output
  𝒴_digital := Maps(ℝ₊; {0,1}^p)   comparator-quantized digital output
```
The decoder `D` produces either form; the sensor readout `R` always produces analog.

### Definition 1.4 (Fitness signal space)
```
  𝒮 := C(ℝ₊; ℝ₊)
```
non-negative continuous scalar signal — one transistor drain current.

---

## Section 2 — State Spaces

### Definition 2.1 (Slow weight manifold — Tier 2)
```
  𝒲 := { W ∈ ℝ^{n×m}  |  |W_{ij}| ≤ W_max  for all (i,j) }
```
the set of physically realizable conductance matrices. Bound `W_max` reflects the maximum on-state conductance of a charge-trap cell. 𝒲 is a compact product of closed intervals — topologically a box.

### Definition 2.2 (Perturbation subspace — Tier 1)
```
  𝒫_r := { δW ∈ ℝ^{n×m}  |  rank(δW) ≤ r }
```
rank-r matrices. In practice `δW = a·b^⊤` with `a ∈ ℝ^n, b ∈ ℝ^m` (r=1 canonical). `𝒫_r` is a non-linear algebraic variety, not a vector subspace, but its rank-1 slice is parameterized linearly by (a, b).

### Definition 2.3 (Archive state — Tier 3)
```
  𝒲̄ := 𝒲 × ℕ        (weight + snapshot-generation counter)
```
an element `W̄(t_k) ∈ 𝒲̄` holds the saved weight and its generation index. Unlike `W(t)` and `δW(t)`, the archive state updates only at discrete snapshot times {t_k}.

### Definition 2.4 (Auxiliary state — perturbation parameterization)
```
  𝒜 := ℝ^n,  ℬ := ℝ^m
```
the two vectors that parameterize `δW = a·b^⊤`. `a(t)` and `b(t)` are independently drawn from `𝒩(0, σ²·I)` at each perturbation event.

---

## Section 3 — Operator Algebra

### Definition 3.1 (Encoder)
```
  E : 𝒰 → 𝒳 ⊗ something             
  E[u](t) := ∫₀^t h_E(t − s) · u(s) ds    where h_E is a low-pass kernel
```
physically: capacitor sampling of input pins through anti-alias RC filter. For bit-plane Option A, `h_E` is the impulse response of the charge-injection network; for pulse-density Option B, `h_E` is a leaky integrator; for binarized Option C, `h_E` is followed by pointwise sign().

### Definition 3.2 (Linear combiner)
```
  W : ℝ^m × t → ℝ^n
  (W(t)·v)_i := Σ_j W(t)_{ij} · v_j
```
Kirchhoff current summation on a conductance crossbar. Note that `W(t)` is time-varying — its evolution is specified in Layer D. At any fixed t, `W(t)` is just a matrix multiplication on the input voltage vector.

### Definition 3.3 (Nonlinearity)
```
  N : ℝ^n → ℝ^n,  applied pointwise
  [N(z)]_i = f(z_i)
```
memoryless pointwise transfer function. Three canonical choices (Formulation v1 Options α, β, γ):
```
  f_kink(z) = α(z − V_T)₊ + β(z − V_k)·1_{z > V_k}       two-piece piecewise-linear
  f_sub(z)  = I_S · (exp(z / n V_T) − 1)                   subthreshold exponential
  f_sat(z)  = ½ μ C_ox (W/L) (z − V_T)² · 1_{z > V_T}      saturation square-law
```
All three are Lipschitz continuous on bounded sets and monotone non-decreasing above their respective thresholds. (Kink is piecewise smooth with a single break; sub is C^∞; sat is C¹.)

### Definition 3.4 (Decoder)
```
  D : ℝ^n → {0,1}^p
  [D(z)]_j = 1_{z_j > θ_j}
```
comparator array with per-channel threshold θ_j. Physically identical to N (same transistor), read in binary-output mode instead of analog-output mode. This is the "shared-silicon dual-read" identity (Formulation v1 Invariant 4).

### Definition 3.5 (Fitness readout)
```
  S : ℝ^n × ℝ^n → ℝ₊
  S(z, y*) := exp(−‖z − y*‖² / 2σ²)
```
Gaussian score — realized by a single subthreshold transistor biased at `V_GS = −‖z−y*‖²/(2σ²·nV_T)`. The subtraction and squaring are analog (differential amplifier + squarer pair).

### Definition 3.6 (Sensor readout — from Tier 2)
```
  R_{ij} : 𝒲 → ℝ
  R_{ij}(W) := V_sense · G_read(W_{ij})
```
row-column addressed non-destructive probe. `G_read` is the measured conductance via a small (nA-range) probe current that does not disturb stored charge. Output is a single analog voltage at the sense-amp pad.

### Definition 3.7 (Archive snapshot/restore)
```
  Σ : 𝒲 × ℕ → 𝒲̄       Σ(W, k) := (W, k+1)              snapshot
  Π : 𝒲̄ → 𝒲          Π(W̄, k) := W̄                     restore
```
triggered at discrete event times {t_k}. Implemented as a flash/MRAM programming cycle initiated by the snapshot-trigger logic described in `three_tier_memory_hierarchy`.

### Definition 3.8 (Perturbation event generator)
```
  ξ : ℝ₊ → 𝒜 × ℬ       ξ(t) := (a_k, b_k)  at t ∈ {event times}
                                                 = 0 otherwise
```
a marked point process whose arrival times form the outer-loop rhythm of EGGROLL. Marks `(a_k, b_k)` are drawn iid from `𝒩(0, σ²·I_n) × 𝒩(0, σ²·I_m)`. Physically: counter-based RNG (node `evolution_strategies_at_the_hyperscale_pdf_counter_based_rng`) generates deterministic pseudo-random vectors; the "randomness" is epistemic, not thermal.

### Definition 3.9 (Integration operator)
```
  I_τ : (ℝ₊ → ℝ) → (ℝ₊ → ℝ)
  (I_τ[f])(t) := (1/τ) ∫₀^t e^{−(t−s)/τ} f(s) ds
```
leaky integrator with time constant τ. This is **not** a symbolic primitive — it is the impulse response of an RC low-pass filter. Every time derivative `ẋ = ...` in Layer D will be read as "x = I_{τ_x}[right-hand side]" under the rewriting `ẋ = (−x + f)/τ_x ⟺ x = I_{τ_x}[f]`.

This definition is the key physics-closure guarantee: **integration is not a computer operation, it is a capacitor holding charge**.

---

## Section 4 — Time Constants

### Definition 4.1 (Four timescales, strict ordering)
```
  τ_x      ~ ns-μs       activation RC filter
  τ_δ      ~ 100 ns      floating-bulk perturbation decay
  τ_W      ~ 10 μs-hours charge-trap consolidation
  τ_archive ~ minutes-hours flash/MRAM snapshot cadence
```
Constraint:
```
  τ_x ≲ τ_δ ≪ τ_W ≪ τ_archive
```
The first `≲` allows overlap (activation and perturbation are both "fast"). The last two `≪` are strict: two-timescale stochastic approximation requires a factor of at least ~100 between τ_δ and τ_W.

### Definition 4.2 (Derived ratio)
```
  K_batch := τ_W / τ_δ ≈ 50-100
```
the number of perturbation events per consolidation memory decay time — the natural batch size. Claim (to be upgraded to theorem in Layer D): `K_batch` is the batch-size hyperparameter in EGGROLL's analysis.

---

## Section 5 — The Complete System (pre-dynamics)

At this layer, the device state is the product:
```
  ℳ := 𝒳 × 𝒲 × 𝒫_r × 𝒲̄
```
and at each time t, the device computes:
```
  y(t) = D(x(t))               digital output
  s(t) = R(W(t))               sensor readout
  ŷ(t) = x(t)                  analog output (for multi-layer stacking)
```

The evolution of `(x, W, δW, W̄)` over t is left to Layer D (deterministic) and Layer S (stochastic). Here we only declared the phase space.

---

## Section 6 — Physics Correspondence Table (must have no "?")

| Symbol (math) | Physical realization (device) | Graph node reference |
|---|---|---|
| u(t) ∈ ℝ^d | Input-pin voltage vector | — |
| x(t) ∈ ℝ^m | Internal node voltages | `a_physical_reinterpretation_of_deep_learning_signal_particle_energy_mapping` |
| W(t) ∈ 𝒲 | Base crossbar conductance, charge-trap | `synaptic_and_neural_behaviours_pdf_long_term_plasticity`, `device_math_mapping_pair_2_charge_trap_consolidation` |
| δW(t) ∈ 𝒫_r | Perturbation crossbar, floating-bulk | `synaptic_and_neural_behaviours_pdf_floating_bulk`, `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation` |
| W̄ ∈ 𝒲̄ | Flash/MRAM archive | `three_tier_memory_tier3_permanent_archive` |
| E | Capacitor sampling + anti-alias | `bit_analog_formulation_v1_encoder_e` |
| W·v | Kirchhoff crossbar MVM | `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_in_memory_kv` |
| N | Transistor I–V (kink/sub/sat) | `device_math_mapping_pair_7_kink_relu_polytope`, `analog_primitive_gaps_subthreshold_exp`, `bit_analog_formulation_v1_nonlinearity_n` |
| D | Comparator array | `bit_analog_formulation_v1_decoder_d` |
| S | Subthreshold transistor at biased V_GS | `analog_primitive_gaps_gaussian_score_realization`, `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation` |
| R | Row-column addressed sense amp | `three_tier_memory_sensor_readout_path` |
| Σ, Π | Flash program/read cycle | `three_tier_memory_phase7_snapshot_restore` |
| ξ | Counter-based RNG pulses | `evolution_strategies_at_the_hyperscale_pdf_counter_based_rng` |
| I_τ | RC low-pass filter | *(new — add primitive: `analog_primitive_rc_integrator`)* |
| τ_x | Node capacitance × load resistance | — |
| τ_δ | C_bulk / leakage | `synaptic_and_neural_behaviours_pdf_short_term_plasticity` |
| τ_W | Trap-assisted tunneling time | `synaptic_and_neural_behaviours_pdf_rationale_charge_trapping_retention` |
| τ_archive | Event-driven | `three_tier_memory_trigger_learning_saturation` |

No `?` in any row. One entry is flagged for graph enrichment: **the RC integrator primitive is not yet a dedicated graph node**. Adding it fills the last structural gap.

---

## Section 7 — What Closure Requires at Layer C

Before moving to Layer D, Layer C's closure checklist:

- [x] Every signal/state space defined as a function space with explicit regularity
- [x] Every operator defined by its input-output map and its device implementation
- [x] Every time constant defined as a ratio of device parameters
- [x] No symbol referring to a "lookup", "table", or "condition on a discrete predicate"
- [x] Physics correspondence table has no unfilled rows except the RC integrator (to be added)
- [ ] Dynamics equations — deferred to Layer D
- [ ] Proofs — deferred to Layers D and S

Layer C is therefore declared complete **after RC integrator is added to the graph**. Everything after can reference these definitions verbatim without redefining.

---

## Section 8 — Open Points for Review

Before Layer D proceeds, Layer C flags:

1. **Bandwidth B** is declared but no numeric value yet. Link to device: highest gate transition frequency on the target CMOS node. Proposal: B ≈ 100 MHz for 65nm; to be tightened during Stage 3b SPICE.
2. **W_max** is declared as an upper bound but its numeric value depends on memristor/charge-trap choice. Candidate: `G_max ≈ 10 μS` per cell (memristor literature).
3. **Rank r** is a design parameter, not a device parameter. Typical `r ∈ {1, 2, 4, 8}` for EGGROLL experiments. To be tuned at Stage 3a.
4. **σ² in Gaussian score and perturbation** appears twice — same variable or two different parameters? Proposal: two different parameters `σ_pert` (perturbation draw) and `σ_fit` (fitness Gaussian), both tuned independently.

Each of these is a *numeric tuning* question, not a *structural* question, and is deferred until Layer D/S proofs are in place.

---

## Cross-References to Existing Graph Nodes

**Formulation v1 inheritance:**
- `bit_analog_formulation_v1_main`
- `bit_analog_formulation_v1_encoder_e`
- `bit_analog_formulation_v1_linear_combiner_w`
- `bit_analog_formulation_v1_nonlinearity_n`
- `bit_analog_formulation_v1_decoder_d`
- `bit_analog_formulation_v1_shared_silicon_claim`

**PPCA architecture:**
- `stage2_eggroll_ppca_main`
- `stage2_eggroll_ppca_phase1_perturbation_draw`
- `stage2_eggroll_ppca_phase6_consolidation_gilbert`
- `stage2_eggroll_ppca_k_batch_timescale_identity`

**Three-tier memory:**
- `three_tier_memory_main`
- `three_tier_memory_tier1_floating_bulk`
- `three_tier_memory_tier2_charge_trap`
- `three_tier_memory_tier3_permanent_archive`
- `three_tier_memory_sensor_readout_path`
- `three_tier_memory_phase7_snapshot_restore`

**Device physics:**
- `synaptic_and_neural_behaviours_pdf_mosfet`
- `synaptic_and_neural_behaviours_pdf_kink_effect`
- `synaptic_and_neural_behaviours_pdf_floating_bulk`
- `synaptic_and_neural_behaviours_pdf_long_term_plasticity`
- `synaptic_and_neural_behaviours_pdf_short_term_plasticity`
- `synaptic_and_neural_behaviours_pdf_ns_ram_cell`

**Analog primitives:**
- `analog_primitive_gaps_log_domain_translinear`
- `analog_primitive_gaps_gilbert_cell`
- `analog_primitive_gaps_subthreshold_exp`
- `analog_primitive_gaps_gaussian_score_realization`

**EGGROLL / ES:**
- `evolution_strategies_at_the_hyperscale_pdf_eggroll`
- `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`
- `evolution_strategies_at_the_hyperscale_pdf_counter_based_rng`
- `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`

**Catalog pairs (incorporated into definitions above):**
- `device_math_mapping_pair_2_charge_trap_consolidation`
- `device_math_mapping_pair_2_identity_trap_kernel_ema`
- `device_math_mapping_pair_6_identity_eta_tau_ratio`
- `device_math_mapping_pair_7_kink_relu_polytope`
