---
title: Three-Tier Memory Hierarchy + Sensor Readout — PPCA Extension
author: ws
captured_at: 2026-04-23
contributor: ws
note_type: ppca_extension_memory_archive
builds_on: [raw/stage2_eggroll_ppca_architecture.md, raw/device_math_mapping.md, raw/Semi-Passive Physical Neural Devices.md]
---

# Three-Tier Memory Hierarchy + Sensor Readout — PPCA Extension

The PPCA architecture as specified treats `charge-trap` as the slow-weight store (`τ_slow ≈ 10 μs` to ~years depending on trap depth). This is long-term but **not permanent**, and the stored weights are **not externally observable**. For the stated goal — a *semi-passive adaptive memory device* where continuous data input produces learning that persists across power cycles and can be inspected by external systems — two additions are required:

1. **Tier-3 permanent archive** — non-volatile memory (flash / MRAM / FeRAM) coupled to the base crossbar so slow-variable `G` can be snapshotted and restored.
2. **Sensor-style readout path** — a non-destructive scan mechanism allowing external systems to observe current `G` values as if the device were a continuously-updating sensor.

Both additions are grounded in existing corpus material: `synaptic_and_neural_behaviours_pdf_flash_memory` explicitly references flash as a reference for long-term retention, and `semi_passive_physical_neural_devices_flash_slow_parameter` already proposes using flash cells as the slow parameter store in a semi-passive neural device.

---

## The Gap in PPCA as Currently Specified

PPCA Phase 6 (consolidation) writes `ΔG_{ij} = η·S·a_i·b_j` via Gilbert cell outputs into charge-trap cells. Charge-trap retention gives the `τ_slow ≈ 10 μs` that matches EGGROLL's batch cadence, but:

- **Retention is not infinite.** A 10 μs time constant implies decay; long-time retention still bleeds. Flash-class cells achieve years of retention; charge-trap-in-logic-process typically hours to months.
- **Power cycling wipes everything.** Charge-trap cells fabricated in standard CMOS lose state on full power-off (except for aggressively optimized flash-stack cells).
- **G is embedded, not exported.** The base crossbar's `G_{ij}` only couples to the forward path. There is no wire that says "tell me the current value of G_{12}" to an external observer. This breaks the "sensor" framing of the device.

Without these fixes, PPCA is a learning circuit but not a persistent memory; without readout, it is also a *black-box* circuit with no introspection.

---

## Three-Tier Memory Hierarchy

```
  ┌─────────────────────────────────────────────────────────┐
  │  Tier 1 — Perturbation state δG                         │
  │  Floating-bulk, τ_fast ≈ 100 ns                          │
  │  Reset per outer-step, never archived                    │
  └─────────────────────────────────────────────────────────┘
                            │ consolidation (Phase 6)
                            ▼
  ┌─────────────────────────────────────────────────────────┐
  │  Tier 2 — Active slow weight G                           │
  │  Charge-trap, τ_slow ≈ 10 μs to hours                    │
  │  Continuously updated during learning                    │
  │  Live forward-path source of W                           │
  └─────────────────────────────────────────────────────────┘
                            │ snapshot (event-triggered or scheduled)
                            ▼
  ┌─────────────────────────────────────────────────────────┐
  │  Tier 3 — Permanent archive G_archive                   │
  │  Flash / MRAM / FeRAM, τ_permanent ≈ years              │
  │  Decoupled from forward path                             │
  │  Source of G on power-up; target of snapshot; external   │
  │  readout via address bus                                 │
  └─────────────────────────────────────────────────────────┘
```

Tier 1 and Tier 2 together realize the two-timescale ES dynamics that PPCA already commits to. Tier 3 is the new addition: a persistent archive that is **decoupled from the live compute path** so its write endurance and access patterns do not bottleneck learning.

### Tier-3 technology choices

| Technology | Retention | Endurance | Cell area | Process |
|---|---|---|---|---|
| **NOR flash** | 10+ years | 10⁵ cycles | large | specialized stack |
| **Embedded flash (eFlash)** | 10+ years | 10⁵ cycles | medium | Logic + eFlash module |
| **MRAM (STT-MRAM)** | 10 years | 10¹⁰ cycles | small | BEOL compatible |
| **FeRAM** | 10+ years | 10¹² cycles | medium | specialized ferroelectric |
| **PCM** | 10 years | 10⁸ cycles | small | BEOL compatible |

The `synaptic_and_neural_behaviours_pdf_phase_change_memory` and `synaptic_and_neural_behaviours_pdf_memristor` nodes already reside in the graph — these families are natural Tier-3 candidates. STT-MRAM is most attractive for the PPCA use case because of high endurance (snapshots can be frequent without wearing the cells) and BEOL compatibility (stacks above CMOS logic).

### Snapshot protocol — three triggers

The consolidation from Tier 2 → Tier 3 should be **event-driven rather than continuous** to respect Tier-3 endurance. Three sensible triggers:

1. **Learning-saturation trigger**: when the rolling variance of fitness `S` drops below a threshold for τ_stable duration, the weights have stabilized → snapshot.
2. **Scheduled trigger**: fixed interval (e.g. one snapshot per hour of operation) as a safety net for slowly-drifting states that never trigger (1).
3. **External trigger**: explicit `save()` signal from host system or watchdog; also the power-down interrupt that copies G to G_archive before shutdown.

Restoration on power-up is unconditional: Tier 3 → Tier 2 bulk copy. Costs one flash-read latency but happens once per power cycle.

### Energy budget

Each snapshot writes `N²` bits (for an N×N crossbar tile). Flash write energy is ~10 nJ/bit, MRAM ~100 pJ/bit. For a 256×256 tile:
- Flash: ~655 μJ per snapshot
- MRAM: ~6.5 μJ per snapshot

Compared to per-outer-step forward pass of nJ-scale, a snapshot per ~10⁴ outer-steps is energy-neutral.

---

## Sensor-Style Readout Path

Even without Tier 3, external observability requires a **non-destructive scan mechanism** for the base crossbar.

### Row-column address scan

A select transistor per cell, row/column decoders, and a sense amplifier at the output:

```
  row_addr ─▶ row decoder ─┐
                           │
  col_addr ─▶ col decoder ─┴─▶ select transistor gates open exactly one cell
                                                                │
                                                                ▼
                                                     sense amp (non-disturbing)
                                                                │
                                                                ▼
                                                     readout voltage V_read ∝ G_{ij}
```

The non-destructiveness comes from biasing the sense circuit with a **small probe current** (nA-range) that does not disturb the stored charge. This is standard in memristor array readout.

### Analog vs digital readout

Two design choices for the readout output:

- **Analog readout**: V_read fed directly to an external sensing pad. Lowest cost; requires external ADC or analog-to-digital interface if the observer is digital. Preserves the "no internal ADC" property of the device.
- **Digital readout**: per-row ADC bank converts all column outputs on a read cycle. Higher cost and violates the digital-bypass goal for the compute path, but the readout path can be isolated.

For a pure *semi-passive* design, the analog readout preserves architectural purity: external systems observe the device as they would observe any analog sensor.

### Readout frequency and disturbance

Each readout introduces a small probe current that may perturb G on the μs-to-ms scale. This is acceptable for occasional reads but not continuous polling. If continuous monitoring is desired, a `probe buffer` (small capacitance sample-hold per cell) can be added at ~3× area cost.

---

## Architectural Addition — Phase 7 (Snapshot/Restore) in the PPCA Cycle

PPCA's 6-phase operational cycle becomes 7 phases with Tier 3:

```
  1. Perturbation draw
  2. Combined forward pass
  3. Nonlinearity N_α
  4. Inter-layer analog routing
  5. Fitness scoring
  6. Consolidation (Tier 1 → Tier 2)
  7. [ASYNCHRONOUS] Snapshot (Tier 2 → Tier 3), event-driven
```

Phase 7 runs on a slower clock domain than phases 1-6 and does not block the learning loop. Conceptually this is the **third timescale**:

```
  τ_fast    ≈ 100 ns      (perturbation reset)
  τ_slow    ≈ 10 μs-h     (consolidation, Phase 6)
  τ_archive ≈ min-h       (snapshot, Phase 7)
```

The ratio τ_archive / τ_slow is the **snapshot-to-learning ratio** — how many learning steps between persistent saves. This is a new hyperparameter *set by flash endurance*, not by algorithm choice.

---

## Conceptual Consequences

### The device becomes a *three-role* object simultaneously

With the extensions, the same silicon plays three roles at three timescales:

- **Learner** (fast): forward-pass + consolidation
- **Live memory** (slow): Tier-2 G holds the current learned state
- **Sensor** (any time): row-column scan exposes current G to the outside world
- **Persistent archive** (permanent): Tier-3 G_archive survives power cycles

The "semi-passive adaptive memory device" framing becomes literally true: the same chip *learns*, *holds*, *exposes*, and *remembers* without any of these four roles being externally orchestrated.

### Relation to Semi-Passive Physical Neural Devices

The existing corpus node `semi_passive_physical_neural_devices_flash_slow_parameter` already proposes flash as slow-parameter storage in a semi-passive neural device. This note extends that proposal by:

- Inserting flash as **Tier 3 rather than Tier 2** (keeps charge-trap as the live compute store for speed reasons).
- Adding the explicit snapshot protocol with three triggers.
- Providing the sensor-readout path that the original proposal did not address.

The `Flash-memory slow parameter` node of Semi-Passive Devices should therefore be upgraded in the graph from a leaf concept to an architectural tier — `semantically_similar_to` the new Tier-3 node with INFERRED 0.9.

### Relation to Pair 2 (Charge-Trap ↔ Consolidation)

`device_math_mapping_pair_2_charge_trap_consolidation` describes Pair 2's identity `η_slow = ∫ P(τ)/τ dτ`. This remains exactly the consolidation dynamics between Tier 1 and Tier 2. Tier 3 is decoupled from this identity — flash programming is discrete, not continuous, so it does not participate in the consolidation integral.

### Relation to forward-only commitment

Phase 7 does not touch the forward path. It is a side process that reads G and writes G_archive asynchronously. Therefore the forward-only / no-backward-path commitment of PPCA Stage-2 is preserved.

### Relation to the roadmap's Stage 5 (MVC tape-out)

MVC design must decide: include Tier 3 (flash/MRAM) from the start or defer to Stage 6?

- **Include**: requires eFlash-compatible MPW shuttle (more expensive, fewer options). Validates full three-tier behavior.
- **Defer**: MVC uses only Tier 1 + Tier 2, relies on sensor readout for external observation, external FPGA or microcontroller handles snapshot to off-chip flash as a stand-in.

The **deferred** approach is pragmatic for MVC and still validates the critical new piece — the sensor readout path. Stage 6 then adds on-chip Tier 3 once the scaling plan is settled.

---

## New Failure Modes Introduced

Three risks not present in the original 6-phase PPCA:

1. **Snapshot-during-learning race**: if snapshot is triggered while consolidation is mid-write, Tier-3 captures a partially-updated G. Mitigation: double-buffered snapshot (copy Tier 2 → holding latch → Tier 3, decoupled from live Phase 6).

2. **Restore divergence**: on power-up, Tier-3 G_archive is loaded to Tier 2 but the perturbation state is re-initialized. The first few learning steps after restore may diverge from the pre-shutdown trajectory. Mitigation: log-normal `σ` of Gaussian score kept in Tier 3 as well so sampling regime is preserved.

3. **Readout-induced forgetting**: frequent sensor scans accumulate probe-current disturbance on cells. Mitigation: amortize reads — a full scan ≤ once per τ_slow period, partial scans with row-by-row priority for suspicious cells.

All three have established mitigations in the flash/memristor literature — none are show-stoppers but all need to be specified before tape-out.

---

## Summary of What the Extension Adds to the Graph

- **Tier-3 permanent archive node** — a new concept spanning the memory-device axis of the graph, directly connected to existing flash/memristor/PCM nodes.
- **Sensor readout node** — a new concept bridging the device to external observability; currently the graph has no "observability" axis at all.
- **Phase 7 (snapshot/restore) node** — extends PPCA's operational cycle.
- **Three-timescale hyperedge** — {τ_fast, τ_slow, τ_archive} as a unified family, generalizing the existing two-timescale hyperedge.
- **Upgrades to `semi_passive_physical_neural_devices_flash_slow_parameter`** — becomes the direct graph-internal justification for Tier 3.

---

## Cross-References to Existing Graph Nodes

**PPCA architecture:**
- `stage2_eggroll_ppca_main`
- `stage2_eggroll_ppca_phase6_consolidation_gilbert`
- `stage2_eggroll_ppca_lever3_two_timescale`
- `stage2_eggroll_ppca_k_batch_timescale_identity`

**Memory devices:**
- `synaptic_and_neural_behaviours_pdf_flash_memory`
- `synaptic_and_neural_behaviours_pdf_long_term_plasticity`
- `synaptic_and_neural_behaviours_pdf_rationale_charge_trapping_retention`
- `synaptic_and_neural_behaviours_pdf_memristor`
- `synaptic_and_neural_behaviours_pdf_phase_change_memory`
- `synaptic_and_neural_behaviours_pdf_ns_ram_cell`

**Semi-passive device (direct prior art):**
- `semi_passive_physical_neural_devices_flash_slow_parameter`
- `semi_passive_physical_neural_devices_single_cell_two_timescales`
- `semi_passive_physical_neural_devices_rationale_single_cell`

**Catalog pairs:**
- `device_math_mapping_pair_2_charge_trap_consolidation`
- `device_math_mapping_pair_2_identity_trap_kernel_ema`
- `device_math_mapping_pair_6_identity_eta_tau_ratio`

**Formulation v1:**
- `bit_analog_formulation_v1_main`
- `bit_analog_formulation_v1_decoder_d` (sensor readout shares silicon with D)

**Analog primitives:**
- `analog_primitive_gaps_gilbert_cell` (Phase 6 consolidation source)

Relevant papers whose body mentions analogous mechanisms (via the audit re-extraction):
- `a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_main` (TEXEL BEOL memristive interface — a Tier-3 candidate in mixed-signal neuromorphic)
- `a_neuromorphic_processor_with_on_chip_learning_for_beyond_cmos_device_integration_beol_memristive_interface`
- `analog_in_memory_computing_attention_mechanism_for_fast_and_energy_efficient_large_language_models_main` (gain-cell arrays with sensor-style readout)
