# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Not a software project. This is a Karpathy-style `/raw` research corpus — a folder of ML / neuromorphic / symbolic-computing papers (PDFs + a few markdown notes) that gets compiled into a persistent knowledge graph via the `graphify` skill. There is no build, no tests, no application code to run.

Two directories matter:
- `raw/` — the corpus. Drop papers, tweets, screenshots, or notes here. Filenames are human-readable (e.g. `Evolution Strategies at the Hyperscale.pdf`). A `.md` file next to a `.pdf` of the same title is a companion note, not a duplicate — graphify will link them via `semantically_similar_to`.
- `graphify-out/` — generated artifacts. Treat as derivable: `graph.json` (raw graph), `graph.html` (interactive viz), `GRAPH_REPORT.md` (audit trail with god nodes / surprising connections / suggested questions), `manifest.json` (for incremental updates), `cache/` (per-file extraction cache, keyed by content hash), `cost.json` (cumulative token ledger).

The `wiki/` directory is currently empty and reserved for future curated output.

## Working with the graph

Use the `graphify` skill (`/graphify` slash command) for all corpus operations. Key invocations:

- `/graphify raw` — full pipeline (after adding files)
- `/graphify raw --update` — incremental; only re-extracts new/changed files. This is the usual command once the graph exists.
- `/graphify query "<question>"` — BFS traversal to answer a question from the graph
- `/graphify path "A" "B"` — shortest path between two concepts
- `/graphify explain "<node>"` — plain-language explanation of a node's connections
- `/graphify add <url>` — fetch a URL into `raw/` and update the graph

When a question could be answered from the graph, prefer `/graphify query` over re-reading PDFs — it's ~7× cheaper and the answers cite `source_location`.

## Extraction contract

Every edge in `graph.json` carries a `confidence` tag: `EXTRACTED` (explicit in source), `INFERRED` (reasoned), or `AMBIGUOUS` (uncertain). Respect this when citing — never upgrade an `INFERRED` edge to fact without verifying from the source file.

When manually editing or augmenting the graph, keep node IDs in the form `{filename_stem}_{entity}`, all lowercase with non-alphanumerics replaced by `_`. This matches what the extractor generates and keeps cross-references intact.

## One gotcha

`raw/` contains files whose names have spaces and non-ASCII characters (em-dashes, smart quotes, Korean translations). Always quote paths in shell commands. The detect step silently skips files it judges "sensitive" — if a file is missing from the graph, check `graphify-out/.graphify_detect.json` (transient) or re-run detection to see the `skipped_sensitive` list.
