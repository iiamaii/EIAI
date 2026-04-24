---
title: Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp
author: ws
captured_at: 2026-04-20
contributor: ws
note_type: primitive_gap_fill
builds_on: raw/bit_analog_formulation_v1.md
---

# Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp

Three device primitives that are repeatedly implicated by the existing corpus but do not yet have explicit nodes in the knowledge graph. Adding them before composing the Stage-2 EGGROLL-PPCA architecture prevents the architecture note from having to invent them in passing; each primitive is load-bearing for at least one component of the (E, W, N, D) formulation and for the forward-only learning loop.

The three gaps form a tight triangle: **log-domain computation is the algebraic class, the Gilbert cell is its canonical multi-quadrant implementation, and subthreshold exponential is the device regime that makes it possible.** They should be understood as three views of the same fact about transistor physics, not three independent primitives.

---

## Primitive 1 — Log-Domain / Translinear Computation

### Device physics

In a BJT (and, in weak inversion, a MOSFET), the collector/drain current is exponential in the base/gate voltage: `I_C = I_S · exp(V_BE / V_T)`. Taking the logarithm, `V_BE = V_T · ln(I_C / I_S)`. A closed loop of `n` junctions summing to zero via Kirchhoff's Voltage Law gives the **translinear principle** (Gilbert 1975): the product of currents on one side of the loop equals the product on the other,

```
  ∏_{k ∈ CW}  I_k  =  ∏_{k ∈ CCW}  I_k
```

### Mathematical property

Multiplication becomes voltage addition in the log-domain: `log(xy) = log(x) + log(y)`. Division becomes subtraction, power-law becomes multiplication by a constant. A current-domain multiplier can be built from four transistors in a translinear loop with the output current equal to `I_out = I_x · I_y / I_ref`.

### The exact correspondence — EML operator as log-domain algebra

The corpus's `all_elementary_functions_from_a_single_operator_pdf_eml_operator` defines

```
  eml(x, y) = exp(x) − ln(y)
```

This is **literally the log-domain algebra**: x and y are already in log-domain (that is what voltages on BJT bases *are*), `exp(x)` converts x to current-domain, `ln(y)` converts a current y back to log-domain, and the subtraction is voltage arithmetic at a node. The EML operator is therefore not a symbolic curiosity — it is a device-native arithmetic primitive for any BJT or subthreshold-MOSFET implementation. This identity is currently missing from the graph and should be the strongest new edge this note introduces:

```
  log_domain_translinear --semantically_similar_to [INFERRED 0.9]-->
    all_elementary_functions_from_a_single_operator_pdf_eml_operator
```

A parallel identity holds for EDL: `edl(x, y) = exp(x) / ln(y)` is **log-domain mul-div** on the same junction structure.

### Role in EGGROLL-PPCA (Stage 2)

The fitness-weighted outer-product update `G ← G + η · S · ab^T` requires `mn` multiplications per rank-1 update. Doing these digitally defeats the "all-analog forward" claim of a forward-only architecture. Translinear current multipliers evaluate `(S · a_i) · b_j` in **one transistor-quad per cell** with nanosecond latency, making the consolidation step itself an analog operation.

### Connection to existing multiplication nodes

Crossbar MVM (`in_memory_attention_compute`, `pair_4_crossbar_attention_logits`) is multiplication by Kirchhoff current summation — one operand is a voltage, the other is a conductance. Bit-plane overlap (`bit_plane_overlap_model`) is multiplication by shift-and-add on bit-planes. Log-domain is a third implementation: multiplication by voltage addition. All three are special cases of the same mathematical primitive implemented on three different device axes (geometry, digital, exponential I–V).

---

## Primitive 2 — Gilbert Cell Four-Quadrant Multiplier

### Device physics

A Gilbert cell is two cross-coupled differential pairs sharing a common tail-current source. With differential inputs `V_x = V_x⁺ − V_x⁻` and `V_y = V_y⁺ − V_y⁻`, the differential output current is, to first order,

```
  I_out = (I_tail / V_T²) · (V_x · V_y)       for small signals
```

Unlike single-quadrant multipliers (including the log-domain one above), the Gilbert cell handles **all four sign combinations** of (V_x, V_y) natively. This is essential for any computation involving signed weights, signed activations, or signed perturbations.

### Mathematical property

It is the cleanest analog realization of a single scalar multiplication `z = x · y` with both operands continuously variable and signed. With two cells in parallel and subtraction of outputs, it extends to dot-products of small vectors. It cannot match crossbar MVM for large vector sizes (area scales linearly per multiplication), but it complements the crossbar by handling the outputs where crossbars struggle: **small-dimension fully-signed products** like fitness × perturbation pairs in EGGROLL.

### Role in EGGROLL-PPCA

The rank-1 perturbation `ab^T` requires only two vectors `a ∈ ℝ^m` and `b ∈ ℝ^n`. A strip of `max(m, n)` Gilbert cells — one per row or column — evaluates the outer product `a_i · b_j` one row at a time as the crossbar is written, turning consolidation into a pipelined analog operation. The fitness scalar `S` can be pre-multiplied into `a` by a single cell upstream.

### Relation to corpus

No existing node captures Gilbert-cell multiplication. It is the most obvious missing element because the corpus's two existing multiplication realizations (crossbar MVM, bit-plane overlap) are both single-quadrant or require pre-separation of sign. Pair 3 of `device_math_mapping` constrains the precision of the crossbar multiplier by cell bits; Gilbert cells offer a different precision regime (higher dynamic range, lower parallelism, signed-native) that the catalog does not yet reason about.

---

## Primitive 3 — Subthreshold Exponential Regime

### Device physics

For `V_GS < V_T` in a MOSFET, the drain current is not zero but exponentially small:

```
  I_D = I_0 · exp(V_GS / n·V_T) · (1 − exp(−V_DS / V_T))
```

where `n ≈ 1.3–1.5` is the subthreshold slope factor. This is the same exponential law as a BJT (up to `n`) but at CMOS-compatible geometry and far lower current levels (nA to pA).

### Mathematical property

- **Sigmoid-native**: the ratio `I_D / (I_D + I_ref)` is `1 / (1 + exp(−V_GS / n·V_T))`, i.e. the logistic sigmoid with no explicit circuitry beyond a current mirror.
- **Softmax-native**: a bank of `K` subthreshold transistors sharing a normalizing node produces `exp(V_k / n·V_T) / Σ_j exp(V_j / n·V_T)` at each node — softmax for free.
- **Gaussian-score-native**: `exp(−r² / 2σ²)`, the exact form of EGGROLL's Gaussian approximate score function (`evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`), is computed by one subthreshold transistor with V_GS = −r²/(2σ²·n·V_T).

### The missing N_β node from formulation v1

`raw/bit_analog_formulation_v1.md` introduced `Nonlinearity Option β — Subthreshold exponential (weak inversion)` as a placeholder but flagged it as "not in graph — enrichment target". This note fills that node: `N_β` is physically realized by running the same MOSFET that realizes `N_α` (the kink/ReLU-polytope option) **in a different operating regime** — below threshold rather than above.

### The three-regime unification

The corpus already has `kink_effect` (above threshold, piecewise-linear) and `punch_through` (above threshold, impact-ionization onset). Subthreshold exp completes the picture:

```
  MOSFET operating regimes (one device, three activations)
    ─────────────────────────────────────────────────────
    V_GS < V_T        →  N_β : subthreshold exp (smooth, sigmoid)
    V_T < V_GS, low V_DS  →  N_γ : saturation (y−V_T)² (≈ squared ReLU)
    V_GS > V_T, high V_DS →  N_α : kink / punch-through (piecewise, ReLU polytope)
```

A single transistor thus instantiates *all three* nonlinearity options from formulation v1 depending on bias — this is a stronger version of the "same-transistor dual-read" hyperedge, now applied to the N slot itself rather than the N+D sharing. Candidate new hyperedge: **`mosfet_three_regime_n_option_family`** with members {`N_α`, `N_β`, `N_γ`, `mosfet`, `kink_effect`, `punch_through`}, INFERRED 0.9.

### Connection to LIF neuron and score-function gradient

`synaptic_and_neural_behaviours_pdf_neuron` (Electronic Neuron, LIF) relies on subthreshold leakage to realize the "leaky" part of leaky integrate-and-fire. And `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation` computes `exp(−r²/2σ²)` as part of the score estimate. Both are subthreshold-natural. Adding the subthreshold node therefore creates two new high-confidence EXTRACTED edges that previously had no structural home.

---

## Triangular Structure of the Three Primitives

Log-domain, Gilbert cell, and subthreshold exp are not three independent additions. They stand in a specific relationship:

```
              log-domain  ◆ (algebraic class)
               /    \
              /      \
      Gilbert        subthreshold exp
      cell           (device regime)
      (topology)

  log-domain = the algebra (mul → add via exp/ln)
  Gilbert cell = one topology implementing that algebra with signed operands
  subthreshold exp = the MOSFET regime that makes the exp() law available in CMOS
```

The Gilbert cell *uses* the exp law (above-threshold BJT or subthreshold MOSFET). Subthreshold exp *is* the exp law in weak-inversion CMOS. Log-domain is the algebra that both realize. Adding all three as separate nodes (plus a parent `translinear_principle` node) lets the graph express the class/implementation/regime structure rather than collapsing them.

---

## Structural Gaps This Note Fills

The following previously-weak edges should become stronger or newly possible:

1. **`EML Operator` ↔ `log_domain_translinear`** [new INFERRED 0.9] — the EML operator is currently isolated in Community 6 despite being the cleanest mathematical statement of log-domain algebra. This edge repositions it as a *device-native* operator, not merely a symbolic curiosity.

2. **`gaussian_score_approximation` ↔ `subthreshold_exp`** [new INFERRED 0.85] — EGGROLL's Gaussian score has no device-level realization node in the current graph. Subthreshold transistors compute it in one device.

3. **`mosfet`, `kink_effect`, `punch_through` ↔ `subthreshold_exp`** [new EXTRACTED 1.0 hyperedge] — three regimes of the same MOSFET become one family, providing a device-level justification for why formulation v1 has exactly three N options.

4. **`gilbert_cell` ↔ `rank_1_perturbation`** [new INFERRED 0.8] — Gilbert cells are the natural way to evaluate the outer-product step `a_i · b_j` in EGGROLL's low-rank update. Currently no device node in the graph performs a signed scalar multiplication, so `rank_1_perturbation` has no hardware-level child.

5. **`log_domain_translinear` ↔ `bit_plane_overlap_model` ↔ `crossbar_MVM`** [new INFERRED hyperedge 0.85] — three implementations of multiplication as one family. This generalizes the existing `Bit-Level Partial-Product / Carry-Save Compute Pipeline` hyperedge from "digital-bit pipeline" to "any-analog multiplication."

---

## Cross-References to Existing Graph Nodes

The extractor should emit edges to these IDs:

**Log-domain cross-links:**
- `all_elementary_functions_from_a_single_operator_pdf_eml_operator`
- `all_elementary_functions_from_a_single_operator_pdf_edl_operator`
- `all_elementary_functions_from_a_single_operator_pdf_exp_log_pair`
- `a_physical_reinterpretation_of_deep_learning_bit_plane_overlap_model`
- `binarized_neural_networks_xnor_popcount_mac`
- `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_in_memory_kv`

**Gilbert cell cross-links:**
- `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`
- `evolution_strategies_at_the_hyperscale_md_low_rank_perturbation`
- `synaptic_and_neural_behaviours_pdf_mosfet`
- `bit_analog_formulation_v1_linear_combiner_w`
- `device_math_mapping_pair_3_memristor_lowrank`

**Subthreshold exp cross-links:**
- `synaptic_and_neural_behaviours_pdf_mosfet`
- `synaptic_and_neural_behaviours_pdf_kink_effect`
- `synaptic_and_neural_behaviours_pdf_punch_through`
- `synaptic_and_neural_behaviours_pdf_neuron`
- `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`
- `bit_analog_formulation_v1_nonlinearity_option_beta_subthreshold_exp` (fills placeholder)
- `bit_analog_formulation_v1_nonlinearity_n`
- `device_math_mapping_pair_7_kink_relu_polytope`
