---
title: Device ↔ Math Correspondence Catalog
author: ws
captured_at: 2026-04-19
contributor: ws
note_type: research_hypothesis_catalog
---

# Device ↔ Math Correspondence Catalog

A working catalog of candidate correspondences between **physical device properties** and **mathematical properties of neural-network elements** already present as nodes elsewhere in this corpus. Each pair states: the device-side property with its source paper, the math-side property with its source paper, the proposed identity (what invariant is supposed to be shared), and a candidate functional form or test.

The goal is not to argue for any single pair but to expose a substrate of eight specific, falsifiable correspondences that the graph can then cluster, challenge, or reinforce as more evidence arrives.

---

## Pair 1: Punch-Through Impact Ionization ↔ Fast-Weight Momentum in Evolution Strategies

**Device side** — *Punch-Through Impact Ionization* (Short-Term Plasticity mechanism)
- Source: `synaptic_and_neural_behaviours_pdf_punch_through`, also `synaptic_and_neural_behaviours_pdf_short_term_plasticity`
- Physics: drain-source field drives carriers through the depletion region; impact-ionization-generated holes accumulate in the floating bulk, locally raising V_T for milliseconds before leaking away.
- Key parameter: the bulk-hole decay constant τ_fast (sub-second).

**Math side** — *Gaussian-Approximate Score Function Update*
- Source: `evolution_strategies_at_the_hyperscale_pdf_gaussian_score_approximation`, `evolution_strategies_at_the_hyperscale_pdf_eggroll`
- Math: EGGROLL accumulates a low-rank perturbation response ΔE = AB^T / √r across a batch of rollouts; the response is integrated over a short window (one outer step) before being reset.
- Key parameter: the outer-loop reset period T_fast (one generation).

**Correspondence claim**: the short-time-window *accumulate-then-reset* dynamics of punch-through plasticity and of a single EGGROLL generation are the same low-pass filter with cutoff at (τ_fast)⁻¹ ≈ (T_fast)⁻¹. Both compute a running inner-product between a perturbation and its fitness response, then discharge.

**Falsifiable test**: a semi-passive two-transistor cell running EGGROLL-style score-function updates should converge at the same rate on a logistic regression benchmark as a floating-point reference when T_fast is tuned to match τ_fast.

**Evidence status**: hypothesis.

---

## Pair 2: Charge-Trapping Long-Term Retention ↔ Consolidation / Slow-Weight Math

**Device side** — *Long-Term Plasticity via Charge-Trapping*
- Source: `synaptic_and_neural_behaviours_pdf_long_term_plasticity`, rationale `synaptic_and_neural_behaviours_pdf_rationale_charge_trapping_retention`
- Physics: hot-carrier injection traps charges in gate dielectric; retention time τ_slow (minutes to years) depends on trap depth and tunneling barrier.

**Math side** — *Consolidation / Metaplasticity Mechanism* (and Fast/Slow two-timescale learning)
- Source: `self_organizing_cmos_memory_architecture_for_representation_learning_consolidation_mechanism`, `self_organizing_cmos_memory_architecture_for_representation_learning_time_scale_separation`
- Math: slow-weight accumulator w_slow that absorbs validated fast-weight deltas on a schedule w_slow ← w_slow + η_slow · (w_fast − w_slow).

**Correspondence claim**: the trap-depth distribution P(τ) induces a kernel whose convolution with the fast-weight residual is mathematically equivalent to exponential-moving-average consolidation at rate η_slow. Trap-depth heterogeneity ↔ multi-timescale EMA mixture.

**Predicted identity**: η_slow = ∫ P(τ) / τ dτ.

**Evidence status**: partial — the Fast/Slow Two-Timescale hyperedge in this corpus groups four papers that use this motif but none derive the kernel identity.

---

## Pair 3: Memristor / Phase-Change Conductance Levels ↔ Low-Rank Perturbation Rank r

**Device side** — *Memristor Conductance* and *Phase-Change Memory (PCM)*
- Source: `synaptic_and_neural_behaviours_pdf_memristor`, `synaptic_and_neural_behaviours_pdf_phase_change_memory`
- Physics: the cell stores a weight as an analog conductance with finite distinguishable levels b (typically 4–8 bits).

**Math side** — *Rank-r Perturbation Structure* / *Low-Rank Perturbation E = AB^T / √r*
- Source: `evolution_strategies_at_the_hyperscale_pdf_rank_1_perturbation`, `evolution_strategies_at_the_hyperscale_md_low_rank_perturbation`
- Math: EGGROLL expresses a weight update as a rank-r outer product; the effective information per weight is O(r · bits_per_element) rather than O(d · bits).

**Correspondence claim**: the usable rank r of a low-rank update is bounded above by the product of cell resolution b and array redundancy; thus *device bits-per-cell is a hardware constraint on ES rank*. Going from 4-bit to 8-bit cells should permit a proportional increase in effective rank.

**Falsifiable test**: train the same model on the same task with memristor-simulated b=4 and b=8 cells under EGGROLL; plot convergence rate as a function of rank r; expect a knee where r·b saturates.

**Evidence status**: hypothesis.

---

## Pair 4: Analog Crossbar Matrix-Vector Multiply ↔ Pre-Softmax Attention Logits

**Device side** — *In-Memory Attention Compute* (analog crossbars for KV)
- Source: `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_in_memory_kv`, `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_main`
- Physics: voltage-to-current multiply summed along a column; one crossbar evaluation = one matrix-vector product Q · K^T across the cached keys.

**Math side** — *Attention Score Computation* (pre-softmax)
- Math: logits ℓ = QK^T / √d_k are the exact output of a matrix-vector multiply against the K-cache.
- Note: no existing node explicitly labels "attention score math" in the graph; this is a documentation gap to be closed by this catalog.

**Correspondence claim**: one cycle of analog crossbar MVM is bit-exact (up to analog noise) with the pre-softmax attention logits. The √d_k scale factor corresponds to the array's reference-voltage calibration.

**Implication**: because softmax itself is not in memory, analog crossbar attention is always attention with an *off-chip* normalization. Systems that attempt a fully in-memory attention must approximate softmax (e.g. polynomial, linearized) — this is the genuine mathematical constraint imposed by the device.

**Evidence status**: partial — correspondence is implicit in the in-memory attention paper but not stated as a mathematical identity.

---

## Pair 5: Floating-Bulk Potential Drift ↔ Running-Statistics Normalization (Layer-/Batch-Norm)

**Device side** — *Floating-Bulk Configuration* and *Bulk Bias Control*
- Source: `synaptic_and_neural_behaviours_pdf_floating_bulk`, `synaptic_and_neural_behaviours_pdf_bulk_bias_control_transistor`
- Physics: slow drift of floating-bulk potential V_B shifts the operating point of the transistor; the time-average of V_B acts as a device-local offset.

**Math side** — *LayerNorm / BatchNorm running statistics*
- Math: running mean μ_running ← (1−α) μ_running + α μ_batch tracks a slow average that is then subtracted at inference.
- Note: no canonical normalization node exists in the graph yet.

**Correspondence claim**: floating-bulk potential plays the role of per-cell running statistics; its update law is the same exponential moving average at a physics-dictated decay constant. Normalization in silicon is "free" if the bulk potential is interpreted as the normalization state.

**Predicted identity**: α = Δt / (C_B · R_leak) where C_B is bulk capacitance and R_leak the leakage resistance.

**Evidence status**: hypothesis.

---

## Pair 6: Single-Cell Two-Timescale Physics ↔ Fast/Slow Learning Rate Schedule

**Device side** — *Single Adaptive Cell with Two Timescales*
- Source: `semi_passive_physical_neural_devices_single_cell_two_timescales`, rationale `semi_passive_physical_neural_devices_rationale_single_cell`, and `semi_passive_physical_neural_devices_flash_slow_parameter`
- Physics: one physical cell hosts both a fast capacitive/bulk state and a slow charge-trap state, with intrinsic τ_fast ≪ τ_slow.

**Math side** — *Fast/Slow Learning-Rate Schedule* as practiced in consolidation algorithms
- Source: `self_organizing_cmos_memory_architecture_for_representation_learning_time_scale_separation`, hyperedge "Fast/Slow Two-Timescale Learning Substrate"
- Math: η_fast / η_slow ratio controls the separation between exploratory fast weights and validated slow weights.

**Correspondence claim**: the cell's τ_slow / τ_fast ratio is the η_fast / η_slow ratio in the continuous-time limit of the two-timescale SGD. Making this *quantitative* — not merely a shared motif — is the gap this pair targets.

**Predicted identity**: η_fast / η_slow = τ_slow / τ_fast.

**Evidence status**: strong motif (hyperedge exists); weak on quantitative identity.

---

## Pair 7: Kink Effect (I–V Discontinuity) ↔ ReLU Polytope Boundary / State-Region Dictionary

**Device side** — *Kink Effect* in bulk-silicon MOSFETs
- Source: `synaptic_and_neural_behaviours_pdf_kink_effect`, related `synaptic_and_neural_behaviours_pdf_punch_through`
- Physics: piecewise I–V characteristic — at drain voltages above the kink, impact-ionization contributes a second current component, producing a slope discontinuity.

**Math side** — *State-Region Dictionary* and *ReLU polytope* geometry
- Source: `neural_networks_as_state_region_dictionaries_main`, `neural_networks_as_state_region_dictionaries_depth_as_iterative_flow`, `neural_networks_as_state_region_dictionaries_jacobian_conditioning`
- Math: a ReLU network partitions input space into polytopes; within each region, the function is affine; polytope boundaries are slope discontinuities.

**Correspondence claim**: the kink is a physics-realized activation boundary — the transistor is a single-unit state-region dictionary with two regions separated by the punch-through onset. Stacking kinked transistors instantiates a state-region network in silicon without any explicit ReLU gate.

**Falsifiable test**: characterize a transistor stack's input-output function at a dense grid of bias points; fit a piecewise-affine model; expect the number of regions to match the state-region-dictionary count predicted by layer depth.

**Evidence status**: hypothesis (speculative but structurally tight).

---

## Pair 8: Variational Quantum Circuit Angle θ ↔ Continuous Rotation Parameter in Geometric NN

**Device side** — *Variational Quantum Circuit as Learnable Physical System*
- Source: `a_primer_on_quantum_machine_learning_variational_quantum_circuit`, `a_primer_on_quantum_machine_learning_main`
- Physics: each trainable gate is parameterized by an angle θ on the unit circle or sphere; the device realizes a unitary U(θ) on the computational basis.

**Math side** — *Exact-Invariance Learning* and *KAN learnable edge functions*
- Source: `learning_with_exact_invariances_in_polynomial_time_main`, `a_practitioner_s_guide_to_kolmogorov_arnold_networks_learnable_edge_functions`
- Math: continuous-parameter rotations on SO(n) or SU(n) implement exact group equivariance; a learnable edge function that is periodic in θ is dual to a quantum gate family.

**Correspondence claim**: the angle parameter of a VQC gate is the *same object* as a learnable periodic edge activation in KAN. Quantum ML and KAN are dual implementations of a "learnable rotation" primitive; the quantum side guarantees exact unitarity by physics, while the KAN side guarantees it by constraint.

**Evidence status**: hypothesis.

---

## Cross-Pair Structure

These eight pairs are not independent. Three structural groupings emerge:

1. **Two-timescale physics → slow/fast math** — Pairs 1, 2, 5, 6 all encode a fast-state-plus-slow-state separation. In silicon this appears as bulk potential + trapped charge; in math as momentum + running-EMA + running-stats. The unifying claim is that *any single-cell two-timescale physics is a hardware realization of a momentum-plus-EMA optimizer*.

2. **Analog continuum → low-rank math** — Pairs 3, 4, 8 are all about what the *continuous* parameterization of a device (conductance levels, crossbar MVM, quantum-gate angles) expresses as a mathematical structure. The common claim is that a device's *representable-value set* is the same object as the learning algorithm's *update span*.

3. **Piecewise physics → piecewise-linear math** — Pair 7 is alone but hints at a broader thesis: any device with a threshold/breakdown voltage implements a piecewise-affine activation, and stacking them realizes state-region networks without explicit gates.

---

## Cross-References to Existing Graph Nodes

This catalog is meant to be *merged*, not isolated. For each pair, the intent is that the graph connect this file's hypothesis nodes to the existing device-side and math-side nodes listed above by explicit `conceptually_related_to` and `semantically_similar_to` edges. Target IDs are listed inside each pair; a subagent reading this file should emit cross-references to those IDs rather than duplicating them.

Existing hyperedges that this catalog extends:
- `Fast/Slow Two-Timescale Learning Substrate` — Pair 6 makes it quantitative
- `NS-RAM Neuro-Synaptic Dual-Use Pattern` — Pairs 1, 2, 5, 7 live inside or against this group
- `Bit-Level Partial-Product / Carry-Save Compute Pipeline` — orthogonal but shares Pair 3's information-capacity concern
