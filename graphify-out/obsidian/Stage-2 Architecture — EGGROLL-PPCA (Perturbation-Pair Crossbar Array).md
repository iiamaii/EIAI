---
source_file: "raw/stage2_eggroll_ppca_architecture.md"
type: "document"
community: "Formulation v1 Canonical + Composition Theorem"
tags:
  - graphify/document
  - graphify/1.0
  - community/Formulation_v1_Canonical_+_Composition_Theorem
---

# Stage-2 Architecture — EGGROLL-PPCA (Perturbation-Pair Crossbar Array)

## Connections
- [[Analog Low-Pass Consolidation on Charge-Trap]] - `` [1.0]
- [[Analog Primitive Gaps — Log-Domain, Gilbert Cell, Subthreshold Exp (main)]] - `None` [1.0]
- [[Bit-Analog Formulation v1 (E,W,N,D Quadruple)]] - `None` [1.0]
- [[Canonical Minimal Model (E_bitplane, crossbar W, N_kink, D_comparator)]] - `None` [1.0]
- [[Component D — Decoder (comparator array)]] - `None` [1.0]
- [[Component E — Encoder (bits → analog, linear injection)]] - `None` [1.0]
- [[Component N — Selective-passing nonlinearity (transistor I-V)]] - `None` [1.0]
- [[Component W — Linear Combiner (Kirchhoff crossbar MVM)]] - `None` [1.0]
- [[Device-Math Correspondence Catalog]] - `None` [1.0]
- [[Device-Primitive Completeness — Every Op Has a Graph Node]] - `` [1.0]
- [[Dual-Crossbar Topology — Base G (charge-trap) + Perturbation a·bT (floating-bulk)]] - `` [1.0]
- [[EGG (Evolved Generative GRU, int8 RNN)]] - `None` [1.0]
- [[EGGROLL Algorithm]] - `None` [1.0]
- [[Forward-Only All-Analog Critical Path]] - `` [1.0]
- [[Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)]] - `semantically_similar_to` [INFERRED]
- [[Lever 1 — Tiling (N×N → (Nk)² tiles)]] - `` [1.0]
- [[Lever 2 — Rank-r Perturbation with Precision-for-Rank Tradeoff]] - `` [1.0]
- [[Lever 3 — Two-Timescale Pipelining (τ_slow ≈ 10 μs, τ_fast ≈ 100 ns)]] - `` [1.0]
- [[Manifold hypothesis and the density-vs-mass distinction]] - `semantically_similar_to` [0.7]
- [[Natural Operating Point at Theoretical O(r⁻¹) Rate]] - `` [1.0]
- [[Open Problem — Stage 2 Learning Rule (D is discontinuous)]] - `None` [1.0]
- [[PPCA Structural Hub — Five-Community God-Node Candidate]] - `` [1.0]
- [[Phase 1 — Perturbation Draw (counter-RNG a,b ~ N(0,σ²))]] - `` [1.0]
- [[Phase 2 — Combined Forward Pass (y = Gx + α·a·(b·x))]] - `` [1.0]
- [[Phase 3 — Nonlinearity N_α via Kink-Biased MOSFETs]] - `` [1.0]
- [[Phase 4 — Inter-Layer Analog Routing (no intermediate digitization)]] - `` [1.0]
- [[Phase 5 — Fitness Scoring S = exp(−z−t²2σ²) (single subthreshold transistor)]] - `` [1.0]
- [[Phase 6 — Consolidation ΔG_ij = η·S·a_i·b_j via Gilbert-Cell Strip]] - `` [1.0]
- [[Rank-1 Perturbation Silicon Realization]] - `` [1.0]
- [[Rejection — Layer-Local (NoProp  Hebbian + Global Signal)]] - `` [1.0]
- [[Rejection — Surrogate  Straight-Through Estimator]] - `` [1.0]
- [[SIGReg anti-collapse regularizer]] - `semantically_similar_to` [0.75]
- [[Shared-Silicon Dual Role — Final-Layer MOSFETs Serve N and D]] - `` [1.0]
- [[Stage 2 Option — Layer-local learning (no gradient crosses D)]] - `None` [0.85]
- [[Stage 2 Option — Score-function  ES gradient (black-box perturbation)]] - `None` [1.0]
- [[Stage 2 Option — Surrogate  straight-through gradient (enrichment target)]] - `None` [0.85]
- [[Stage-2 Commitment to Score-Function  ES (EGGROLL)]] - `` [1.0]
- [[Stage-3 Hints — Open Problems Leaving PPCA]] - `` [1.0]
- [[Timescale Identity K_batch = τ_slow  (τ_fast_perturb + τ_forward + τ_fitness) ≈ 50]] - `` [1.0]

#graphify/document #graphify/1.0 #community/Formulation_v1_Canonical_+_Composition_Theorem