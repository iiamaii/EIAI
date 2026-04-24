---
title: Bit ↔ Analog Formulation — Stage 1 (E, W, N, D) Quadruple
author: ws
captured_at: 2026-04-19
contributor: ws
note_type: theoretical_formulation_v1
builds_on: raw/device_math_mapping.md
---

# Bit ↔ Analog Formulation — Stage 1 (E, W, N, D) Quadruple

This note formulates the first stage of the device↔math program: a single neural-network layer as a **state-transition quadruple** (E, W, N, D) that converts digital bit-level information into an analog function signal, performs linear combination, applies a selectively-passing nonlinearity, and quantizes back to bits. Each of the four primitives must be realizable by a specific semiconductor device element.

The goal is not yet to specify a learning rule; it is to pin down the forward-pass structure so that any learning rule later attached to this pipeline inherits a physically grounded semantics.

---

## The Quadruple

A layer with `n` input bits per channel, `m` analog dimensions, `k` post-combination channels, and `p` output bits is the composition

```
  E           W           N           D
{0,1}^n  →  ℝ^m  →  ℝ^k  →  ℝ^k  →  {0,1}^p
```

where:

- **Encoder** `E : {0,1}^n → ℝ^m` — a linear injection lifting bits into analog state.
- **Linear combiner** `W : ℝ^m → ℝ^k` — matrix multiplication `y = G·x` with `G ∈ ℝ^{k×m}` the physical conductance matrix of a crossbar.
- **Selective passing / nonlinearity** `N : ℝ^k → ℝ^k` — a pointwise nonlinearity whose functional form is dictated by transistor I–V characteristics.
- **Decoder** `D : ℝ^k → {0,1}^p` — a comparator array quantizing the analog state back to bits.

The full forward pass of the layer is `D ∘ N ∘ W ∘ E`. Stacking `L` layers gives `D ∘ N ∘ W^{(L)} ∘ E ∘ ... ∘ D ∘ N ∘ W^{(1)} ∘ E`.

---

## Component 1 — Encoder E

Three physically native encodings exist. Each is a linear injection but imposes a different geometry on the analog domain ℝ^m. The formulation commits to **bit-plane weighted charge** as the canonical choice; the other two are noted as substitutable.

### Option A (canonical) — Bit-plane weighted charge

```
E_bitplane(b_0, …, b_{n-1}) = Σ_{k=0}^{n-1} 2^k · b_k · e_k ∈ ℝ^n
```

Each bit index `k` receives charge `q_k = 2^k · Q_0` on a dedicated capacitor. The analog state is a point in the non-negative integer lattice of ℝ^n, read out as per-bit voltages `V_k = q_k / C`. This is exactly the representation used by `a_physical_reinterpretation_of_deep_learning_bit_plane_overlap_model` and `bit_level_operator_framework_for_relu_mlps_bit_plane_profile`; under this encoding, multiplication becomes bit-plane inner product.

### Option B — Pulse-density (unary)

```
E_pulse(b) = N_1(b) · e ∈ ℝ
```

where `N_1(b)` is the Hamming weight (number of 1-bits) in `b` and `e` is a single analog basis vector. Realized by charge accumulation on a single capacitor across `N_1(b)` clock cycles. Matches the dynamics of `synaptic_and_neural_behaviours_pdf_long_term_plasticity` (charge-trapping accumulation) and `semi_passive_physical_neural_devices_flash_slow_parameter`.

### Option C — Binarized signed (±1)

```
E_binary(b) = 2b − 1 ∈ {−1, +1}^n
```

The minimal encoding. Matches `binarized_neural_networks_xnor_popcount_mac` exactly; gives the XNOR+popcount pipeline as a composition identity (see Theorem 1 below).

**Linearity requirement.** Whatever encoding is chosen, `E` must be linear in `b` so that `W ∘ E` remains linear. All three options satisfy this because `E_bitplane` and `E_binary` are affine and `E_pulse` is linear on its codomain.

---

## Component 2 — Linear combiner W

There is essentially one physics-native realization: **Kirchhoff current summation on a conductance crossbar**. Given input voltages `x = (x_1, …, x_m)` and a conductance matrix `G`, the output current on column `j` is

```
y_j = Σ_i G_{ij} · x_i
```

This is not a "computation" — it is current conservation at a wire junction. Training stores weights in `G` as analog conductance levels of memristor / phase-change / floating-gate cells.

The crossbar is already established in the graph as a god-adjacent node: `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_in_memory_kv`. The catalog Pair 4 (`device_math_mapping_pair_4_crossbar_attention_logits`) already identifies one cycle of this crossbar with the pre-softmax attention logits `Q K^T / √d_k`. The current formulation reuses that identity as the general linear operator W — Pair 4's Identity is a special case (attention) of a universal building block.

**Constraint.** Any learning rule must update `G` locally per cell; there is no global matrix-level update operation in physics. This will become the binding constraint on Stage 2 (learning rule selection).

---

## Component 3 — Selective passing / nonlinearity N

"Selective passing" is exactly the physics of a transistor deciding whether to conduct. Three candidate nonlinearities map to three distinct device regimes:

### Option α (canonical) — Two-piece kink (piecewise-linear)

```
N_kink(y) = α · y · 𝟙[y > 0] + β · (y − V_k) · 𝟙[y > V_k]
```

A single bulk-silicon MOSFET realizes this transfer characteristic when punch-through impact ionization kicks in at drain-source voltage `V_k` (the kink voltage). Below threshold, zero current; between threshold and `V_k`, linear with slope α; above `V_k`, linear with slope α + β. This is *exactly* a ReLU polytope boundary with two regions, and it is literally what `synaptic_and_neural_behaviours_pdf_kink_effect` and `synaptic_and_neural_behaviours_pdf_punch_through` describe.

This canonical choice is identical to the claim already encoded as `device_math_mapping_pair_7_kink_statedict` (Pair 7 in the catalog). The present formulation upgrades that pair from "a pair of corresponding concepts" to "the nonlinearity component of the canonical forward pass."

### Option β — Subthreshold exponential

```
N_exp(y) = I_S · (exp(y / n V_T) − 1)
```

Realized by a transistor operated in the subthreshold (weak-inversion) regime where current depends exponentially on `V_GS`. Mathematically enables softmax-compatible composition (since the exponent is native). **Currently not represented in the graph** — filling this node is a concrete enrichment target for the next `--update`.

### Option γ — Saturation square law

```
N_sat(y) = ½ · μ · C_ox · (W/L) · (y − V_T)^2 · 𝟙[y > V_T]
```

Above-threshold saturation: current is quadratic in over-drive. Approximates "squared ReLU" / GELU-ish activations.

**Sign-preservation constraint.** For the decoder `D` to meaningfully extract bits from `N(y)`, we require

```
sign(N(y) − N_ref) = sign(y − V_T)     (Invariant 3 below)
```

All three options satisfy this because each is monotone non-decreasing on `y ≥ V_T` and zero below threshold.

---

## Component 4 — Decoder D, shared-silicon with N

```
D(z)_j = 𝟙[z_j > θ_j],  j = 1, …, p
```

Each output bit is one comparator: a transistor whose gate receives `z_j` and whose threshold is set to `θ_j`. The decoder is *not* a new functional unit — it is the same transistor primitive that realizes N, reused with a fixed reference voltage and a binary output read.

**Shared-silicon claim (Invariant 4).** A single transistor with I–V curve `f(V_GS)` implements both:

```
  (N)   z = f(y)                 — analog→analog, with continuous slope
  (D)   b = 𝟙[f(y) > f(θ)]        — analog→digital, with binary read
```

The composition `D ∘ N` is therefore *not* two physical devices in series but *one* device read twice — once as an analog output (to feed the next layer's `W`), once as a binary output (to feed the next layer's `E`). The existence of this dual read is what makes the pipeline single-device-per-logical-layer possible.

This is a new claim and is not yet represented in the corpus. Adding it as a node opens a hyperedge candidate: `N_and_D_share_one_transistor`.

---

## Four Invariants

The formulation holds iff all four of the following invariants are satisfied. Each is falsifiable against a specific device model.

1. **E is a linear injection.** Distinct bit patterns map to distinct analog states; the map is linear in the bit vector. Required so that W·E is unambiguously defined.

2. **W preserves E's linearity.** `W(E(b)) = W·Σ_k β_k·e_k = Σ_k β_k·(W·e_k)` for any affine coefficients `β_k`. Automatic when W is a matrix and E is linear.

3. **N sign-commutes with thresholding.** `sign(N(y) − N(θ)) = sign(y − θ)` for the reference threshold θ. Implies N must be monotone non-decreasing where it is non-zero.

4. **D reuses the same transistor as N.** The comparator-form of D is the binary-output read of the same device that realized N.

---

## Composition Theorem (to prove)

**Claim.** Under encoding C (binarized, `b ∈ {−1, +1}`) and nonlinearity α (two-piece kink with `V_k = ∞` so the second piece is absent), the composition `D ∘ N ∘ W ∘ E` evaluates to

```
D ∘ N ∘ W ∘ E (b) = XNOR_popcount_MAC (b, G)
```

up to a choice of reference voltages. That is, **the binarized instance of this formulation is exactly the Courbariaux 2016 Binarized NN forward pass** — which is the hardware pipeline `binarized_neural_networks_main` already encodes.

This would make the formulation a proper generalization: `BNN = (E_binary, W, N_kink|V_k=∞, D_binary)`. Under encoding A (bit-plane) and the same nonlinearity, the composition should recover the full-precision ReLU MLP pipeline of `bit_level_operator_framework_for_relu_mlps_main`, which in turn equals the `carry_save_tree` partial-product pipeline.

Proving both compositional identities closes the loop that the corpus currently only points at via the INFERRED 0.8 edge between `bit_plane_overlap_model` and `xnor_popcount_mac` (see Pair 4 and the `Bit-Level Partial-Product / Carry-Save Compute Pipeline` hyperedge).

---

## The Open Problem — What Stage 2 Must Resolve

`D` is discontinuous. Therefore `∇_θ (D ∘ N ∘ W ∘ E)(b)` is not defined in the classical sense, and end-to-end backpropagation through this pipeline is impossible. Three candidate resolutions exist in the corpus; Stage 2 must commit to one:

- **Layer-local learning** — each layer is trained in isolation; gradient signal does not cross `D`. Matches `noprop_training_neural_networks_without_full_back_propagation_or_full_forward_propagation_local_layer_training` and `hebbian_learning_with_global_direction_local_rule_global_signal`.
- **Score-function / ES gradient** — treat the entire network (including D) as a black box; perturb parameters, observe fitness, update by the Gaussian score. Matches `evolution_strategies_at_the_hyperscale_pdf_eggroll` and the Pair 1 / Pair 3 hypotheses.
- **Surrogate (straight-through) gradient** — use a differentiable surrogate for D during backward pass. Not currently represented as a node in the corpus; an enrichment target.

Each choice imposes different hardware demands on Stage 2. Score-function ES requires only the forward pass (cheap in this silicon). Layer-local learning requires per-layer teacher signals (expensive). Surrogate gradients require backward-path wiring (moderately expensive).

---

## Relation to the Existing Catalog

This formulation is not orthogonal to the 8-pair catalog in `raw/device_math_mapping.md`; it is a **reduction** of several pairs into a single compositional schema:

- **Pair 4** (Analog Crossbar MVM ↔ Pre-Softmax Logits) — becomes component W of this quadruple.
- **Pair 7** (Kink Effect ↔ ReLU Polytope) — becomes component N (canonical Option α).
- **Pair 3** (Memristor Levels ↔ Low-Rank Rank r) — becomes a constraint on the resolution of `G` in W.
- **Pair 1** (Punch-Through ↔ ES Fast-Weight Momentum) — becomes a candidate Stage 2 learning rule when combined with the score-function gradient option above.
- **Pairs 2, 5, 6** (two-timescale pairs) — become candidate learning dynamics for updating `G` over time, also deferred to Stage 2.

The formulation therefore absorbs the catalog's 8-pair structure into a **4-slot schema plus a pending learning rule**. When the graph re-clusters with this file included, the expected outcome is that `bit_analog_formulation_v1` becomes a new god node sitting between Communities 2 (Bit-Plane), 7 (NS-RAM), 9 (Analog→Low-Rank Bridge), and 10 (Crossbar-Logit Bridge), with the existing Pair nodes attached as specialization edges rather than as independent claims.

---

## Canonical Minimal Model

For the first concrete instance to build against, fix:

```
E = E_bitplane       (bit-plane weighted charge, Option A)
W = crossbar MVM     (memristor array, b=4 bits/cell initially)
N = N_kink           (two-piece piecewise-linear, Option α)
D = D_comparator     (shared transistor with N)
```

This combination is the smallest self-consistent instantiation of the quadruple that uses only device-physics primitives currently in the corpus. Every other cell of the (3 × 3) encoding × nonlinearity table is derivable from this one by substitution.

---

## Cross-References to Existing Graph Nodes

This file is intended to be merged and linked, not isolated. The extractor should emit cross-reference edges to the following existing IDs:

**For E (encoder):**
`a_physical_reinterpretation_of_deep_learning_bit_plane_overlap_model`, `a_physical_reinterpretation_of_deep_learning_signal_particle_energy_mapping`, `bit_level_operator_framework_for_relu_mlps_bit_plane_profile`, `bit_level_operator_framework_for_relu_mlps_main`, `binarized_neural_networks_main`, `binarized_neural_networks_xnor_popcount_mac`, `synaptic_and_neural_behaviours_pdf_long_term_plasticity`, `semi_passive_physical_neural_devices_flash_slow_parameter`.

**For W (linear combiner):**
`analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_in_memory_kv`, `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_main`, `synaptic_and_neural_behaviours_pdf_memristor`, `synaptic_and_neural_behaviours_pdf_phase_change_memory`.

**For N (nonlinearity):**
`synaptic_and_neural_behaviours_pdf_kink_effect`, `synaptic_and_neural_behaviours_pdf_punch_through`, `synaptic_and_neural_behaviours_pdf_mosfet`, `neural_networks_as_state_region_dictionaries_main`.

**For D (decoder) and N/D reuse:**
No existing node captures the shared-transistor claim; this file introduces it.

**For Stage-2 open problem (learning):**
`noprop_training_neural_networks_without_full_back_propagation_or_full_forward_propagation_local_layer_training`, `hebbian_learning_with_global_direction_local_rule_global_signal`, `evolution_strategies_at_the_hyperscale_pdf_eggroll`.

**For catalog absorption:**
Pair 3, Pair 4, Pair 7 nodes in `device_math_mapping` (Pair-N nodes with `pair_*` in their IDs).
