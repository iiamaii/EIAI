---
type: community
cohesion: 0.29
members: 7
---

# Binarized NN + XNOR Pipeline (body-extracted)

**Cohesion:** 0.29 - loosely connected
**Members:** 7 nodes

## Members
- [[Binarized Neural Networks (Hubara, Courbariaux, Soudry, El-Yaniv, Bengio 2016)]] - paper - raw/Binarized Neural Networks.pdf
- [[Binary matmul GPU kernel 7× speedup on MNIST BNN without accuracy loss]] - paper - raw/Binarized Neural Networks.pdf
- [[Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)]] - paper - raw/Binarized Neural Networks.pdf
- [[Real-valued weight accumulators kept during training; clipped to -1,1; binarized only for forwardgradient compute]] - paper - raw/Binarized Neural Networks.pdf
- [[Shift-based BatchNorm and shift-based AdaMax multiplies replaced by power-of-2 bit-shifts (AP2)]] - paper - raw/Binarized Neural Networks.pdf
- [[Straight-through estimator (STE) gr = gq · 1_{r≤1}; gradient of sign() treated as gradient of hard-tanh]] - paper - raw/Binarized Neural Networks.pdf
- [[XNOR + popcount replaces floating-point MAC {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))]] - paper - raw/Binarized Neural Networks.pdf

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/Binarized_NN_+_XNOR_Pipeline_(body-extracted)
SORT file.name ASC
```

## Connections to other communities
- 1 edge to [[_COMMUNITY_Analog Multiplication Family (Gilbert + log-domain + crossbar)]]
- 1 edge to [[_COMMUNITY_Subthreshold Score + Nonlinearity Realization]]
- 1 edge to [[_COMMUNITY_Formulation v1 Canonical + Composition Theorem]]

## Top bridge nodes
- [[XNOR + popcount replaces floating-point MAC {-1,+1}·{-1,+1} dot product = popcount(xnor(a,W))]] - degree 2, connects to 1 community
- [[Deterministic sign() binarization of weights AND activations to {-1,+1}; stochastic variant uses σ(x)]] - degree 2, connects to 1 community
- [[Straight-through estimator (STE) gr = gq · 1_{r≤1}; gradient of sign() treated as gradient of hard-tanh]] - degree 2, connects to 1 community