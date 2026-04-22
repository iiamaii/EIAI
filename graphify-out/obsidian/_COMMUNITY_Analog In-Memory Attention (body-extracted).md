---
type: community
cohesion: 0.07
members: 33
---

# Analog In-Memory Attention (body-extracted)

**Cohesion:** 0.07 - loosely connected
**Members:** 33 nodes

## Members
- [[Analog in-memory computing attention mechanism for fast and energy-efficient LLMs]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- [[Analytic angle-distribution codebook quantize angles with optimal small-bitwidth codebook, no stored scalezero-point]] - paper - raw/PolarQuant Quantizing KV Caches with Polar Transformation.pdf
- [[Charge-based gain cell capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC)]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- [[Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- [[Concentrated angle distribution fΘ(θ) ∝ sin{d-1}(2θ) after preconditioning; Var(Θ)=O(1sqrt d)]] - paper - raw/PolarQuant Quantizing KV Caches with Polar Transformation.pdf
- [[Conditional Memory via Scalable Lookup A New Axis of Sparsity for LLMs (Engram)]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Conditional memory = new sparsity axis complementary to MoE (conditional computation)]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Context-aware gating hidden state is Query, retrieved memory is KV; sigmoid gate α suppresses collision noise]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Data-oblivious, online, accelerator-friendly no calibration; 3.5 bpc neutrality, 2.5 bpc minor drop for KV cache]] - paper - raw/Turboquant.pdf
- [[Deterministic addressing enables host-memory prefetching; 100B Engram table offloaded with 3% overhead]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Engram O(1) hashed N-gram embedding lookup with multi-head multiplicative-XOR hash and shared table E_{n,k}]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- [[Initialization algorithm adapts pre-trained GPT-2 to non-ideal gain-cell multiplication via per-layer statistics rescaling]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- [[Mechanistic effect Engram off-loads early-layer static reconstruction, freeing attention for global long-context (NIAH 84.2→97.0)]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Per-coordinate Lloyd-Max  continuous k-means quantizer tuned to Beta marginal; optimal MSE Dmse ≤ sqrt(3π)2 · 4{-b}]] - paper - raw/Turboquant.pdf
- [[PolarQuant achieves 4.2x KV-cache compression with SOTA long-context quality]] - paper - raw/PolarQuant Quantizing KV Caches with Polar Transformation.pdf
- [[PolarQuant random preconditioning random Gaussian rotation preserves inner products, randomizes angle distribution]] - paper - raw/PolarQuant Quantizing KV Caches with Polar Transformation.pdf
- [[PolarQuant Quantizing KV Caches with Polar Transformation]] - paper - raw/PolarQuant Quantizing KV Caches with Polar Transformation.pdf
- [[QJL CUDA kernel; 3-bit KV cache reaches 5x memory reduction at no accuracy drop on LongBenchLlama-2]] - paper - raw/QJL.pdf
- [[QJL asymmetric estimator sign(S k) on keys, full S q on queries; unbiased q,k]] - paper - raw/QJL.pdf
- [[QJL outlier-channel handling two independent quantizers for outlier vs inlier key channels in deeper layers]] - paper - raw/QJL.pdf
- [[QJL sign-bit cosine 1-bit quantization of JL projection preserves inner products up to O(sqrt(kxym))]] - paper - raw/QJL.pdf
- [[QJL zero-overhead, data-oblivious no stored zero-pointscale, unbiased inner-product estimator]] - paper - raw/QJL.pdf
- [[QJL 1-Bit Quantized JL Transform for KV Cache Quantization with Zero Overhead]] - paper - raw/QJL.pdf
- [[QJL JL transform followed by sign-bit quantization]] - paper - raw/QJL.pdf
- [[Random rotation induces Beta-distributed coordinates; high-d near-independence enables per-coordinate scalar quantizer]] - paper - raw/Turboquant.pdf
- [[Recursive polar transformation pair coordinates, produce d-1 angles + 1 radius in log2(d) levels (Definition 1)]] - paper - raw/PolarQuant Quantizing KV Caches with Polar Transformation.pdf
- [[ShannonYao lower bound Dmse ≥ 4{-b}; TurboQuant within ~2.7× (≈1.45× at b=1) of optimal]] - paper - raw/Turboquant.pdf
- [[Sliding-window causal attention keeps fixed M KV entries, bounding array size; layer stacking recovers global receptive field]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf
- [[TurboQuant Online Vector Quantization with Near-optimal Distortion Rate]] - paper - raw/Turboquant.pdf
- [[Two-stage inner-product quantizer MSE-optimal Qmse + 1-bit QJL on residual → unbiased inner-product estimate]] - paper - raw/Turboquant.pdf
- [[U-shaped Sparsity Allocation optimal hybrid MoE+Engram ratio beats pure MoE at iso-FLOPs]] - paper - raw/Conditional Memory via Scalable Lookup A New Axis of Sparsity for Large Language Models.pdf
- [[Up to ×102 latency and ×104 energy reduction vs GPU for attention]] - paper - raw/Analog in-memory computing attention mechanism for fast and energy-efficient large language models.pdf

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/Analog_In-Memory_Attention_(body-extracted)
SORT file.name ASC
```

## Connections to other communities
- 1 edge to [[_COMMUNITY_EML + Log-Domain Algebra]]
- 1 edge to [[_COMMUNITY_Analog Multiplication Family (Gilbert + log-domain + crossbar)]]
- 1 edge to [[_COMMUNITY_Formulation v1 Canonical + Composition Theorem]]

## Top bridge nodes
- [[Gain-cell crossbar arrays store KV cache AND perform dot products in-memory (fuse storage + MVM)]] - degree 2, connects to 1 community
- [[Charge-based gain cell capacitor C1 holds weight; push-pull transistor emits current ∝ input × Vstore (analog MAC)]] - degree 2, connects to 1 community
- [[Charge-to-pulse circuit implements HardSigmoid activation, avoiding power-hungry ADCs and enabling sigmoid-attention]] - degree 2, connects to 1 community