---
title: Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)
author: ws
captured_at: 2026-04-22
contributor: ws
note_type: stage2_architecture_closure
builds_on: [raw/bit_analog_formulation_v1.md, raw/analog_primitive_gaps.md, raw/device_math_mapping.md]
---

# Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)

This note closes the Stage-2 open problem from `bit_analog_formulation_v1`: **which learning rule does the (E, W, N, D) quadruple run under, and how does it scale?** The answer is a concrete architecture — EGGROLL-PPCA — that commits to the score-function / ES branch, uses only primitives already present in the graph, and whose scaling is bounded by device-physics timescales rather than algorithmic ones.

The architecture is forward-only, all-analog in its critical path, and its natural batch size (perturbations per consolidation) is set by the ratio of two device timescales — not by a hyperparameter.

---

## The Stage-2 Commitment

Formulation v1 listed three candidate learning rules. This architecture commits to exactly one:

| Option | Status | Reason |
|---|---|---|
| Layer-local (NoProp / Hebbian + global) | ✗ rejected | requires per-layer teacher wiring; breaks forward-only purity; adds area cost per layer |
| **Score-function / ES (EGGROLL)** | ✓ **chosen** | needs only forward + scalar fitness + outer-product write; every required op already maps to a device primitive in the graph |
| Surrogate / straight-through | ✗ rejected | requires an explicit backward path; ~2× silicon area; not forward-only |

The commitment to ES is not arbitrary — it is the only option whose five required operations (perturbation draw, forward pass, fitness scoring, outer-product update, slow-weight consolidation) all have *existing* device-native realizations in the current knowledge graph. Stage-2 closure is therefore less an algorithmic design decision than a recognition that the graph's gravity well is pulling toward ES.

---

## Architecture — PPCA (Perturbation-Pair Crossbar Array)

```
   Input x (analog voltages)
        │
        ├──────────────────┐
        ▼                  ▼
   ┌─────────┐        ┌─────────┐
   │ Base    │        │ Pert.   │
   │ crossbar│        │ crossbar│
   │   G     │        │  a·b^T  │
   │ (charge │        │ (floating│
   │ -trap)  │        │  -bulk)  │
   └─────────┘        └─────────┘
        │ Gx                │ a·(b·x)
        └────── y = Gx + α·a·(b·x) ─────┐
                                        ▼
                              ┌─────────────────┐
                              │  N_α kink array │
                              │ (formulation v1)│
                              └─────────────────┘
                                        │ z
                           ┌────────────┴────────────┐
                           │                         │
                           ▼                         ▼
                  ┌────────────────┐        ┌──────────────┐
                  │  D comparator  │        │ Next PPCA    │
                  │  (if output)   │        │ layer (stay  │
                  │                │        │ analog)      │
                  └────────────────┘        └──────────────┘
                          │
                          ▼
              ┌──────────────────────────┐
              │ Fitness scoring          │
              │ S = exp(−||z−t||²/2σ²)   │
              │ (subthreshold exp)       │
              └──────────────────────────┘
                          │
                          ▼
              ┌──────────────────────────┐
              │ Gilbert cell strip       │
              │ computes S·a_i·b_j       │
              │ → charge packets to G    │
              └──────────────────────────┘
                          │
                          ▼
                    Base G consolidation
                    (slow τ_slow, charge-trap)
```

Two co-located crossbars, one for the slow parameter `G` (charge-trapping long-term retention) and one for the fast rank-1 perturbation `α·ab^T` (floating-bulk short-term plasticity). A Gilbert-cell strip at the bottom performs the analog outer product for consolidation. Fitness is a single subthreshold transistor. `N` is a column of kink-biased MOSFETs. `D` is a comparator array that re-uses the same MOSFET species at different bias (formulation v1's shared-silicon claim).

---

## One Outer Step — Six Phases

### Phase 1 — Perturbation draw

Sample `a ∈ ℝ^m`, `b ∈ ℝ^n` from `N(0, σ²)`. Counter-based deterministic RNG (already in graph as `evolution_strategies_at_the_hyperscale_pdf_counter_based_rng`) produces reproducible vectors that can be regenerated at consolidation time without storage. Write `a` to the perturbation crossbar's row inputs and `b` to its column inputs as analog voltages.

### Phase 2 — Combined forward pass (rank-1 add)

Input vector `x` is broadcast to both crossbars simultaneously. The base crossbar emits `Gx` by Kirchhoff summation. The perturbation crossbar emits `a·(b·x)` — the inner product `b·x` is one column-sum, then the result broadcasts across `a`. Total output `y = Gx + α·a·(b·x)` is assembled by current summation at the output node. The forward pass is **one crossbar latency plus one rank-1 broadcast**, not two full MVMs — this is the key efficiency of rank-1 perturbation realized in silicon.

### Phase 3 — Nonlinearity N_α

`y` passes through a column of kink-biased MOSFETs. Each transistor implements the two-piece piecewise-linear `N_kink` (formulation v1 canonical Option α). Because the `kink_effect` and `punch_through` corpus nodes describe exactly this I–V characteristic, the layer's activation function is fixed by device physics, not by software choice.

### Phase 4 — Inter-layer routing

For intermediate layers, `z` is kept analog and fed into the next PPCA layer's `x`. **No digitization between layers** — the `D` comparator array is only invoked at the output of the network, which minimizes analog→digital conversion overhead. This is consistent with the corpus's `bit_analog_formulation_v1_shared_silicon_claim`: the final-layer MOSFETs serve dual-role as N and D, each earlier layer's MOSFETs serve only as N.

### Phase 5 — Fitness scoring

The final output `z_out` and target `t` feed a subthreshold exponential transistor that computes

```
  S = exp(−||z_out − t||² / 2σ²)
```

This is the Gaussian-approximate score from EGGROLL (`evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`), computed in one device — the `analog_primitive_gaps_gaussian_score_realization` sub-node. The scalar `S` is a current level on a reference wire.

### Phase 6 — Consolidation (outer-product write)

A strip of Gilbert cells — one per row (or column, pipelined) — evaluates

```
  ΔG_{ij} = η · S · a_i · b_j
```

each as a four-quadrant signed current. These currents drive gate-side programming pulses that push charge into the charge-trap layer of the base crossbar's cells. Because charge-trap programming is slow (μs), the **consolidation itself acts as a low-pass filter** over many fast Phase 1–5 iterations:

```
  G(t+T_slow) = G(t) + η · Σ_{k=1}^{K} S_k · a_k · b_k^T
```

The sum is accumulated on the floating-gate trap itself by successive sub-threshold programming currents. No digital accumulator is needed.

---

## Device-Primitive Mapping (Every Operation → Graph Node)

| Phase | Operation | Device primitive | Graph node |
|---|---|---|---|
| 1 | Pseudo-random vector draw | Counter-based RNG circuit | `evolution_strategies_at_the_hyperscale_pdf_counter_based_rng` |
| 2 | `Gx` MVM | Memristor crossbar, Kirchhoff | `analog_in_memory_computing_attention_mechanism_..._in_memory_kv`, `synaptic_and_neural_behaviours_pdf_memristor` |
| 2 | `a(b·x)` rank-1 add | Second crossbar + broadcast | `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`, `evolution_strategies_at_the_hyperscale_md_low_rank_perturbation` |
| 3 | Nonlinearity `N_α` | Kink-biased MOSFET column | `synaptic_and_neural_behaviours_pdf_kink_effect`, `bit_analog_formulation_v1_nonlinearity_option_alpha_kink`, `device_math_mapping_pair_7_kink_relu_polytope` |
| 5 | Fitness `exp(−r²/2σ²)` | Single subthreshold transistor | `analog_primitive_gaps_subthreshold_exp`, `analog_primitive_gaps_gaussian_score_realization`, `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation` |
| 6 | Outer product `S·a_i·b_j` | Gilbert cell strip | `analog_primitive_gaps_gilbert_cell`, `analog_primitive_gaps_four_quadrant_mul` |
| 6 | Slow-weight consolidation | Charge-trap programming | `synaptic_and_neural_behaviours_pdf_long_term_plasticity`, `synaptic_and_neural_behaviours_pdf_rationale_charge_trapping_retention`, `device_math_mapping_pair_2_charge_trap_consolidation` |
| 1→6 | Fast perturbation reset | Floating-bulk decay | `synaptic_and_neural_behaviours_pdf_floating_bulk`, `synaptic_and_neural_behaviours_pdf_short_term_plasticity`, `synaptic_and_neural_behaviours_pdf_punch_through` |
| all | Device-native arithmetic class | Log-domain / translinear | `analog_primitive_gaps_log_domain_translinear`, `all_elementary_functions_from_a_single_operator_pdf_eml_operator` |

Every row has a graph-resident primitive. Nothing in the architecture is invented without prior device grounding.

---

## Scalability Analysis — Three Levers

### Lever 1 — Tiling

A logical `N × N` crossbar is implemented as `(N/k)²` physical tiles of `k × k`. Typical k ≈ 256. Tiles are independent during Phase 2 (no horizontal data dependency in Kirchhoff summation). Tile pipelining allows many tiles to accept new inputs while others are still settling. Scaling: latency O(log(N/k)) due to tree-adder consolidation of tile outputs; area O(N²).

### Lever 2 — Rank r < full

EGGROLL's perturbation is rank-r with `r ≪ min(m, n)`. Write bandwidth per outer step is `O(r(m+n))`, not `O(mn)`. Pair 3 (`device_math_mapping_pair_3_identity_bits_bound_rank`) states `r ≤ b · redundancy`, so increasing cell bit-depth linearly increases usable rank. This gives a **precision-for-rank tradeoff** that is a hardware design decision, not an algorithmic one.

### Lever 3 — Two-timescale pipelining

Charge-trap programming time τ_slow ≈ 10 μs. Floating-bulk perturbation write + decay ≈ 100 ns. Forward-pass + fitness ≈ 100 ns. Therefore:

```
  K_batch = τ_slow / (τ_fast_perturb + τ_forward + τ_fitness)
         ≈ 10 μs / 200 ns ≈ 50
```

The architecture naturally batches ≈ 50 perturbations per consolidation — which happens to match the typical K value in EGGROLL training. This is not tuned; it falls out of device physics. If the corpus's `evolution_strategies_at_the_hyperscale_pdf_rank_convergence_theorem` O(r⁻¹) convergence is correct, the architecture's natural operating point is already at the theoretical rate.

---

## Closing the Formulation-v1 Pipeline

PPCA absorbs or operationalizes every component of the prior notes:

- **Formulation v1 quadruple (E, W, N, D)** — PPCA is the hardware realization of this quadruple plus a consolidation loop.
- **Catalog Pair 1 (Punch-through ↔ ES fast-weight momentum)** — becomes the τ_fast of the floating-bulk perturbation crossbar.
- **Catalog Pair 2 (Charge-trap ↔ consolidation math)** — becomes the τ_slow of the base crossbar.
- **Catalog Pair 3 (Memristor bits ↔ rank r)** — becomes Lever 2 of scalability.
- **Catalog Pair 4 (Crossbar MVM ↔ QK^T)** — `G` crossbar is the general case; attention is a special case.
- **Catalog Pair 6 (Single-cell two-timescale ↔ fast/slow LR)** — becomes Lever 3 of scalability, quantitatively: K_batch = τ_slow/τ_fast.
- **Catalog Pair 7 (Kink ↔ ReLU polytope)** — becomes the canonical N_α.
- **Log-domain / Gilbert / Subthreshold primitives** — become the fitness, outer-product, and arithmetic class of Phase 5 and Phase 6.

What remains open (Stage 3 hints):

1. **Proof of Gaussian-score learnability under charge-trap noise** — does the noisy consolidation of a finite-precision memory still converge at O(r⁻¹)?
2. **Cross-tile perturbation correlation** — independent tiles drawing independent perturbations may bias the effective gradient estimator; needs analysis.
3. **Multi-task / continual learning** — two-timescale math suggests a natural consolidation hierarchy (fast → slow → structural) that the corpus has not yet formulated.

---

## Structural Claims This Note Introduces

1. **PPCA hub** — the whole architecture is a single god-node candidate whose neighbors span five communities: Analog Multiplication Family (W, Gilbert), Subthreshold Nonlinearity (N, fitness), Two-Timescale Bridge (charge-trap, floating-bulk), Bit-Level Physics (encoder options), Local/Non-Backprop Learning (Stage-2 ES commitment).

2. **Stage-2 closure hyperedge** — `{ppca_main, formulation_v1_main, stage2_option_score_function_es, eggroll_algorithm, analog_primitive_gaps_main, device_math_mapping_main}` as EXTRACTED 0.95. This hyperedge states that the four prior notes + EGGROLL close to a single architectural schema.

3. **Timescale-ratio identity** — `K_batch = τ_slow / τ_fast ≈ 50 ≈ EGGROLL's K`. A derived number, not a chosen one. Candidate EXTRACTED edge between device timescales and EGGROLL hyperparameter choice.

4. **Rejection edges** — explicit `incompatible_with` edges from PPCA to `noprop_..._local_layer_training`, `hebbian_learning_with_global_direction_local_rule_global_signal`, and the surrogate-gradient placeholder. These document the Stage-2 decision explicitly so future additions don't silently reopen it.

---

## Cross-References to Existing Graph Nodes

**EGGROLL and ES:**
- `evolution_strategies_at_the_hyperscale_pdf_eggroll`
- `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`
- `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`
- `evolution_strategies_at_the_hyperscale_md_low_rank_perturbation`
- `evolution_strategies_at_the_hyperscale_pdf_counter_based_rng`
- `evolution_strategies_at_the_hyperscale_pdf_rank_convergence_theorem`
- `evolution_strategies_at_the_hyperscale_pdf_egg_model`

**Formulation v1 components:**
- `bit_analog_formulation_v1_main`
- `bit_analog_formulation_v1_encoder_e`
- `bit_analog_formulation_v1_linear_combiner_w`
- `bit_analog_formulation_v1_nonlinearity_n`
- `bit_analog_formulation_v1_nonlinearity_option_alpha_kink`
- `bit_analog_formulation_v1_decoder_d`
- `bit_analog_formulation_v1_canonical_minimal_model`
- `bit_analog_formulation_v1_open_stage2_learning_problem`
- `bit_analog_formulation_v1_stage2_option_score_function_es`
- `bit_analog_formulation_v1_stage2_option_layer_local` (for rejection edge)
- `bit_analog_formulation_v1_stage2_option_surrogate_ste` (for rejection edge)
- `bit_analog_formulation_v1_shared_silicon_claim`

**Analog primitives:**
- `analog_primitive_gaps_main`
- `analog_primitive_gaps_log_domain_translinear`
- `analog_primitive_gaps_gilbert_cell`
- `analog_primitive_gaps_subthreshold_exp`
- `analog_primitive_gaps_gaussian_score_realization`
- `analog_primitive_gaps_four_quadrant_mul`
- `analog_primitive_gaps_n_beta_fills_placeholder`

**Catalog pairs to absorb:**
- `device_math_mapping_main`
- `device_math_mapping_pair_1_punchthrough_es_momentum`
- `device_math_mapping_pair_2_charge_trap_consolidation`
- `device_math_mapping_pair_3_memristor_lowrank`
- `device_math_mapping_pair_3_identity_bits_bound_rank`
- `device_math_mapping_pair_4_crossbar_attention_logits`
- `device_math_mapping_pair_6_identity_eta_tau_ratio`
- `device_math_mapping_pair_7_kink_relu_polytope`

**Device physics:**
- `synaptic_and_neural_behaviours_pdf_memristor`
- `synaptic_and_neural_behaviours_pdf_phase_change_memory`
- `synaptic_and_neural_behaviours_pdf_long_term_plasticity`
- `synaptic_and_neural_behaviours_pdf_short_term_plasticity`
- `synaptic_and_neural_behaviours_pdf_floating_bulk`
- `synaptic_and_neural_behaviours_pdf_kink_effect`
- `synaptic_and_neural_behaviours_pdf_punch_through`
- `synaptic_and_neural_behaviours_pdf_mosfet`
- `synaptic_and_neural_behaviours_pdf_rationale_charge_trapping_retention`

**Linear combiner:**
- `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_in_memory_kv`
- `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_main`

**Rejected options (for explicit `incompatible_with` edges):**
- `noprop_training_neural_networks_without_full_back_propagation_or_full_forward_propagation_local_layer_training`
- `hebbian_learning_with_global_direction_local_rule_global_signal`
