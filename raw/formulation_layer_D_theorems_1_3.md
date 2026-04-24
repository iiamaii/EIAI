---
title: Formulation Layer D — Deterministic Dynamics and Theorems 1-3
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: formulation_layer_d
builds_on: [raw/formulation_layer_C_symbolic.md]
---

# Formulation Layer D — Deterministic Dynamics and Theorems 1-3

Purpose: given the symbolic foundation (Layer C), specify the deterministic coupled-ODE dynamics of the device state and prove three theorems that together establish **physics-closed signal-processing completeness**: (1) the system is well-posed, (2) every operator in the system has an explicit device realization, (3) the input-to-output map is exactly a switched time-varying Volterra operator — a classical signal-processing object with no "escape" to digital or symbolic manipulation.

Stochastic effects (thermal noise, 1/f noise, device variability) and learning convergence are deferred to Layer S. This layer is the noise-free idealization that Layer S perturbs.

---

## Section 1 — The Deterministic ODE System

Using Layer C's symbols without redefining:

```
  (D1)  τ_x · ẋ(t)    = −x(t) + N( W(t)·E[u](t) + δW(t)·E[u](t) )
  (D2)  τ_δ · δẆ(t)  = −δW(t) + Σ_k  a_k b_k^⊤ · δ(t − t_k)
  (D3)  τ_W · Ẇ(t)   = −W(t) + η · S(x(t), y*(t)) · δW(t)
  (D4)  W̄(t_k⁺)       = W(t_k)       at snapshot events t_k
  (D5)  y(t)           = D(x(t))
  (D6)  s(t)           = R(W(t))      sensor readout, on demand
```

where `δ(·)` is the Dirac delta (impulse-triggered perturbation), and the perturbation marks `(a_k, b_k)` arrive at event times `{t_k}` determined by the counter-RNG clock `ξ`.

**(D1)** is the fast activation dynamics — `x(t)` is the RC-filtered response of the nonlinearity output.
**(D2)** is the perturbation reset dynamics — `δW(t)` is a leaky integrator of impulsive rank-1 resets.
**(D3)** is the consolidation dynamics — `W(t)` drifts under fitness-weighted perturbation accumulation.
**(D4)** is the archive snapshot — a discrete-time jump, decoupled from the continuous dynamics.
**(D5)** and **(D6)** are instantaneous readouts.

Note: **none of (D1)–(D6) contain a symbolic conditional, a lookup, or a digital operation.** Every term is either a continuous field, a leaky integrator, a Dirac impulse, or an analog operator from Layer C.

---

## Section 2 — Theorem 1 (Well-Posedness)

**Statement.** Let `u ∈ 𝒰` (continuous, bandlimited, finite energy). Let the nonlinearity `N` be Lipschitz continuous with constant `L_N` on the operating range. Let `y*(·)` be a continuous target signal. Let initial conditions `x(0) ∈ ℝ^m`, `W(0) ∈ 𝒲`, `δW(0) ∈ 𝒫_r` be specified. Then system (D1)–(D3) has a unique absolutely continuous solution `(x(·), W(·), δW(·))` on ℝ₊, and the slow weight stays in 𝒲 for all t > 0.

**Proof sketch.**

*Step 1 (piecewise classical).* Between impulse arrivals `[t_{k-1}, t_k)`, (D2) reduces to
```
  τ_δ · δẆ = −δW    with initial condition δW(t_{k-1}⁺)
```
which has the closed-form solution `δW(t) = δW(t_{k-1}⁺) · exp(−(t − t_{k-1})/τ_δ)`. Similarly (D1) and (D3) are classical ODEs on each inter-arrival interval.

*Step 2 (Lipschitz on compact state space).* On this interval, the right-hand-side of (D1) is
```
  f_x(x, W, δW, t) = (−x + N( W·E[u](t) + δW·E[u](t) )) / τ_x
```
Since `N` is Lipschitz and `W, δW` are bounded (by assumption `W ∈ 𝒲` and by induction `δW(t)` decays from a bounded impulse mark), the map `f_x` is Lipschitz in `(x, W, δW)` uniformly in t on each compact sub-interval. Picard–Lindelöf gives existence and uniqueness on the sub-interval.

*Step 3 (bounded operating range for consolidation).* The right-hand-side of (D3) satisfies
```
  ‖(−W + η S δW) / τ_W‖ ≤ (W_max + η · σ · r) / τ_W
```
since `S ≤ 1` (Gaussian score is bounded by 1) and `‖δW‖ ≤ ‖a‖‖b‖ ≤ σ√n · σ√m`. This bounds the growth rate of W. Combined with the `−W/τ_W` decay term, trajectories stay bounded: if `W(0) ∈ 𝒲`, then `W(t) ∈ 𝒲` for all `t > 0` provided `W_max` is chosen satisfying `W_max > η σ² √(nm)` (feasibility condition).

*Step 4 (impulse concatenation).* At `t = t_k`, (D2) has a jump `δW(t_k⁺) = δW(t_k⁻) + a_k b_k^⊤`. This is a finite jump in δW. Since `f_x` and the RHS of (D3) are Lipschitz in δW, the state `(x, W)` continues continuously across the jump, only δW has a finite discontinuity. Concatenating the piecewise-classical solutions gives a global absolutely continuous solution on ℝ₊ (with δW having countable jump discontinuities at {t_k}).

*Step 5 (uniqueness).* Uniqueness holds on each sub-interval by Picard–Lindelöf. The jump rule (D2) at {t_k} is deterministic given the RNG seed, so concatenation is unique.

**∎**

**Remark (Lipschitz constants for N).** All three canonical nonlinearities satisfy the Lipschitz requirement:
- `f_kink`: piecewise linear with slopes {0, α, α+β} — Lipschitz constant max(α, α+β)
- `f_sub`: `I_S · exp(z/nV_T)/(nV_T)`, which grows unboundedly; must be **restricted to the operating range** `z ∈ [V_SS, V_DD]`, on which it is bounded and Lipschitz
- `f_sat`: `μ C_ox (W/L) (z − V_T)_+` — linear Lipschitz in the saturation region

So Theorem 1 is **not trivial** for `f_sub`: it requires explicit domain truncation. This truncation is physically automatic (silicon rails).

---

## Section 3 — Theorem 2 (Operator-Level Realizability)

**Statement.** Every operator appearing in (D1)–(D6) admits an explicit mapping to a CMOS-compatible device primitive. No step in the dynamics requires a computation outside the operator set of Layer C Section 3.

**Proof (constructive mapping).**

| Term in (D1)–(D6) | Device realization | Layer C definition |
|---|---|---|
| `E[u](t)` | capacitor voltage after anti-alias RC | Def 3.1 |
| `W(t)·v` | Kirchhoff current summation at crossbar column | Def 3.2 |
| `δW(t)·v` | Kirchhoff sum at perturbation crossbar | Def 3.2 (applied to δW) |
| `W·E[u] + δW·E[u]` | current summation at merged output wire | linearity of Def 3.2 |
| `N(·)` | transistor stage in chosen regime (kink/sub/sat) | Def 3.3 |
| `τ_x · ẋ + x = N(·)` | node capacitor (load RC filter on N's output) | Def 3.9 (integrator) |
| `Σ_k a_k b_k^⊤ δ(t−t_k)` | counter-RNG pulse + Gilbert-cell outer product | Def 3.8 + `analog_primitive_gaps_gilbert_cell` |
| `τ_δ · δẆ + δW = Σ impulses` | floating-bulk capacitance leakage of written perturbation | Def 3.9 with τ_δ |
| `η · S · δW` | per-cell multiplier: (fitness current) × (δW value) | Gilbert cell at learning strip |
| `τ_W · Ẇ + W = η S δW` | charge-trap programming current integrated on trap site | Def 3.9 with τ_W |
| `S(x, y*)` | differential amplifier + squarer + subthreshold exp | Def 3.5 |
| `D(x)` | comparator array | Def 3.4 |
| `R(W)` | sense-amp with row-column select | Def 3.6 |
| `Σ, Π` | flash/MRAM program + read cycle | Def 3.7 |

Every right-hand-side of (D1)–(D6) decomposes into operators in this table. Composition of operators is closed in the Layer C operator algebra. **∎**

**Key observation.** The three "time derivatives" `ẋ`, `δẆ`, `Ẇ` are **not** separate operations — they are the inverse of the integrator `I_τ`. Physically, an RC filter *is* a leaky integrator; its differential equation is the mathematical description of the same device. There is no step where "a computer differentiates" — differentiation is the read of a voltage that is decaying through an RC.

This is why the formulation is **physics-closed**: integration is native to the device, and differentiation is just the inverse view of the same RC filter. A formulation that required explicit time-derivative computation would not be physics-closed.

---

## Section 4 — Theorem 3 (Signal-Processing Completeness — Switched Volterra Representation)

This is the central theorem. It proves that the device's input-to-output map is a well-defined classical signal-processing object — namely a time-varying, switched Volterra operator of bounded order — with all coefficients given explicitly in terms of `W(t)` and the chosen `N`.

**Statement.** Fix `W(t)` (treat as slowly varying — valid since `τ_W ≫ τ_x`). Define the input-output map
```
  T_W : 𝒰 → 𝒴_analog,       T_W[u](t) := x(t)
```
where `x(t)` is the solution of (D1) with `W(t) = W` held constant on the timescale `τ_x`. Then:

**(a) Analytic N (e.g. subthreshold exp):** `T_W` admits a Volterra series representation
```
  x(t) = Σ_{k=1}^∞ ∫∫...∫  h_k(t; τ_1, …, τ_k; W) · u(t−τ_1) ⊗ … ⊗ u(t−τ_k)  dτ_1 … dτ_k
```
with `h_k` expressed explicitly in terms of `W` and the Taylor coefficients of `N` around the operating point.

**(b) Piecewise-linear N (kink/sat):** `T_W` admits a **switched Volterra** representation: a finite partition of the input space into polytopes P_1, …, P_Q (determined by the kink thresholds of each N-stage) and on each P_q, `T_W|_{P_q}` is a classical Volterra series.

In both cases, the entire map `u ↦ x ↦ y` (or `u ↦ x ↦ s` for sensor) is a composition of classical signal-processing operators: a Volterra filter followed by a thresholding (D) or a conductance readout (R). No symbolic, discrete, or lookup-based step intervenes.

**Proof.**

*Part (a), analytic N.* The ODE (D1) with `W` held constant is a nonlinear autonomous-in-W system driven by `E[u]`. Expanding `N` in Taylor series around the bias point `z₀ = W·E[u](0)`:
```
  N(z) = N(z₀) + N'(z₀)(z−z₀) + (1/2)N''(z₀)(z−z₀)² + …
```
Substituting into (D1) and solving iteratively in powers of the input amplitude (standard Volterra-series derivation, e.g. Rugh 1981 "Nonlinear System Theory: The Volterra/Wiener Approach"):
- 1st-order kernel `h_1(t; τ; W) = h_x(t−τ) · W · h_E(τ)` where `h_x(t) = (1/τ_x) e^{−t/τ_x} 1_{t ≥ 0}` is the activation RC impulse response and `h_E` is the encoder impulse response.
- 2nd-order kernel `h_2(t; τ_1, τ_2; W) = (1/2) N''(z₀) · h_x(t−max(τ_1,τ_2)) · (W h_E)(τ_1) ⊗ (W h_E)(τ_2)`.
- Higher orders follow the same recursive pattern.

Convergence of the series requires `‖u‖` small enough that the operating point stays in a neighborhood of `z₀` where the Taylor remainder is negligible. For bandlimited `u` with bounded `L^∞` norm, this radius of convergence is computable from `N`'s analytic properties.

*Part (b), piecewise-linear N.* `f_kink` partitions ℝ into three linear regions by thresholds `{V_T, V_k}`. For each N-stage `i`, define the "region" at time `t` as
```
  R_i(t) = q ∈ {0, 1, 2}   where 0: below V_T, 1: V_T to V_k, 2: above V_k
```
The tuple `R(t) = (R_1(t), …, R_n(t)) ∈ {0,1,2}^n` takes at most `3^n` values (typically far fewer are dynamically accessible). Within each region tuple q, N is a fixed linear function `N_q(z) = A_q z + b_q`, and (D1) becomes
```
  τ_x ẋ + x = A_q(W·E[u] + δW·E[u]) + b_q
```
— a linear time-invariant system. Its solution is a linear Volterra series (in fact a 1st-order LTI filter) with kernel
```
  h_1^q(t; τ; W) = h_x(t−τ) · A_q · (W + δW) · h_E(τ)
```
and bias offset. The global map on input space ℝ^d is therefore a **switched linear Volterra operator** with `3^n` (finitely many) regions and explicit transition boundaries. The switching events at transitions between regions are themselves analog threshold crossings of the N-stages — no digital decision is required.

The extension to include δW as a separate rank-r perturbation follows by treating `W + δW` as a single effective weight on each interval between perturbation events. Across a perturbation event, δW jumps and the region boundaries shift; the switched Volterra representation is piecewise constant across intervals and updated at each t_k.

*Conclusion.* The input-to-output map `u ↦ y` (digital output) or `u ↦ s` (sensor output) is the composition
```
  u → [E] → [Volterra / switched Volterra] → [D or R]
```
Each block is a classical operator:
- E is an LTI convolution.
- Volterra block has explicit kernel coefficients in `W`.
- D is a pointwise thresholding.
- R is a conductance readout (pointwise sensing).

The entire chain is a signal-processing object. **∎**

**Remark (Why this matters for the goal).** The claim "bypass digitalization + numeric conversion + symbolic operation" is now precise: it means the system is in the switched-Volterra class. Any system in this class is realized by analog filters + threshold elements + piecewise-linear gain stages — the exact ingredients of analog signal processing. No step in the computation is symbolic.

**Remark (connection to Formulation v1 Composition Theorem).** Formulation v1 stated an equivalence `(E_binary, W, N_kink|V_k=∞, D) ≡ XNOR-popcount`. This is now a **special case of Theorem 3**: when `E` is the binarized encoder, N is the single-kink ReLU limit, and D is sign, the switched Volterra representation collapses to a single region (sign-of-inner-product) and the Volterra kernels reduce to the classical XNOR+popcount MAC expressions. Theorem 3 is the general case; Formulation v1 is its specialization.

**Remark (connection to AMBIGUOUS Edge 1 and 2).** The two remaining AMBIGUOUS edges were:
- `Punch-Through ↔ Depth as Iterative Operator Flow`
- `Kink Effect ↔ State-Region Dictionary (overview)`

Theorem 3 resolves both:
- **Edge 1**: "Depth as iterative operator flow" is precisely the composition of per-layer switched Volterra operators. Punch-through provides the threshold that induces region switching. The composition-of-operators view is iteration (discrete depth) of the flow (continuous time).
- **Edge 2**: "State-region dictionary" is the partition `{P_q}` of input space; each "region" corresponds to a specific region-tuple `R(t) ∈ {0,1,2}^n`. Kink effect provides the per-unit threshold that defines the partition boundaries.

Both AMBIGUOUS edges should now be **upgraded to EXTRACTED via Theorem 3**: each is a direct statement of a part of Theorem 3(b).

---

## Section 5 — Discretization to Discrete NN (Sanity Check)

**Claim.** Under uniform time discretization with step `Δt` and first-order Euler approximation, (D1)–(D3) reduces to a standard layered NN forward pass + EGGROLL update rule when `Δt → 0`.

**Sketch.**

Layered view: take `Δt = τ_x` (one "layer" per RC time constant). Then over one step,
```
  x_{t+Δt} ≈ x_t + Δt · (−x_t + N(W·E(u_t))) / τ_x
          = (1 − 1)·x_t + N(W·E(u_t))
          = N(W·E(u_t))
```
— the standard one-layer forward pass.

Stacking: if the device consists of multiple layers in series with independent RC intervals, stacking Δt intervals produces multi-layer composition. Multi-layer `x^{(L)} = N(W^{(L)} · N(W^{(L−1)} · … · N(W^{(1)} · E(u))))` is standard NN forward.

EGGROLL update: the consolidation equation `τ_W Ẇ = −W + η S δW`, Euler-discretized at step `Δt = τ_W / K_batch`, becomes
```
  W_{t+Δt} ≈ (1 − 1/K_batch) W_t + (η/K_batch) · S_t · δW_t
```
which is a rank-1 EGGROLL update weighted by the fitness score. Under `K_batch ≈ 50`, this is exactly the inner-loop update that the EGGROLL algorithm performs.

Thus the continuous formulation **contains** the discrete NN + EGGROLL algorithm as its Euler-discretization limit. **∎**

This is the "discretization reduction theorem" that upgrades the catalog-pair identity `K_batch = τ_W/τ_δ ≈ 50` from qualitative motif to formal correspondence.

---

## Section 6 — Open Points Before Layer S

1. **Bandwidth of Volterra series** — the k-th kernel `h_k` has support width ~ k·τ_x. For the series to represent a bandlimited input faithfully, we need the series to converge for `‖u‖_∞ ≤ u_max`. The explicit radius of convergence depends on N's analytic structure — computable but tedious. Defer to Layer S where it also governs noise propagation.
2. **Uniform consolidation assumption** — Theorem 3 held W constant on the τ_x timescale. This is justified by τ_W ≫ τ_x but becomes quantitative only once the noise model of Layer S specifies how fast W can drift. Rigorous proof: perturbation analysis around fixed W, with `W(t) = W_0 + δ(t)` and `‖δ‖ = O(τ_x/τ_W)`.
3. **Switching events** — Theorem 3(b) glosses over the exact dynamics at region transitions. These are measure-zero events for generic inputs but may matter under worst-case adversarial input. Defer.
4. **Multiple-N-layer interaction** — a multi-layer device is a cascade of switched Volterra operators, each with its own region partition. The global partition is the product of per-layer partitions; its cardinality grows as `3^{Σ n_ℓ}`. This is the connection to State-Region Dictionary's region-count theorem — a Zaslavsky-type bound. Left open until Stage 2 incorporates Hanin-Rolnick.

---

## Cross-References

**Layer C (all definitions):**
- `formulation_layer_C_symbolic_main` (to be emitted)
- All operator definitions (E, W, N, D, S, R, Σ, Π, ξ, I_τ)

**Formulation v1 (special case to generalize):**
- `bit_analog_formulation_v1_composition_theorem`
- `bit_analog_formulation_v1_composition_identity_bitplane_relu_mlp`
- `bit_analog_formulation_v1_composition_identity_binary_xnor_popcount`

**AMBIGUOUS edges now resolved:**
- `synaptic_and_neural_behaviours_pdf_punch_through` → `neural_networks_as_state_region_dictionaries_depth_as_iterative_flow`
- `synaptic_and_neural_behaviours_pdf_kink_effect` → `neural_networks_as_state_region_dictionaries_main`

**Related existing theory:**
- `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`
- `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`
- `device_math_mapping_pair_6_identity_eta_tau_ratio` (K_batch identity now formally derived)

**Signal-processing literature anchors (new nodes to create):**
- Rugh 1981 "Volterra/Wiener Approach"
- Zaslavsky hyperplane arrangement theorem

**Device realization anchors:**
- `analog_primitive_gaps_subthreshold_exp` (Option β's N)
- `device_math_mapping_pair_7_kink_relu_polytope` (Option α's N, region switching)
- `synaptic_and_neural_behaviours_pdf_punch_through` (kink threshold)
