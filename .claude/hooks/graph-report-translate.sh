#!/usr/bin/env bash
# Stop hook: if graphify-out/GRAPH_REPORT.md is newer than GRAPH_REPORT.ko.md,
# block stopping and instruct Claude to (re)create the Korean translation.
# The .ko.md file's own mtime serves as the "already translated" sentinel —
# no extra state files needed.

set -euo pipefail

REPORT="graphify-out/GRAPH_REPORT.md"
KO_REPORT="graphify-out/GRAPH_REPORT.ko.md"

# No report yet → nothing to do.
[ -f "$REPORT" ] || exit 0

mtime() {
    stat -f %m "$1" 2>/dev/null || stat -c %Y "$1" 2>/dev/null || echo 0
}

REPORT_MTIME=$(mtime "$REPORT")
KO_MTIME=0
[ -f "$KO_REPORT" ] && KO_MTIME=$(mtime "$KO_REPORT")

# Korean version is up-to-date → allow stop.
if [ "$REPORT_MTIME" -le "$KO_MTIME" ]; then
    exit 0
fi

# Out of date → block and tell Claude what to do.
cat <<'JSON'
{
  "decision": "block",
  "reason": "graphify-out/GRAPH_REPORT.md was updated but graphify-out/GRAPH_REPORT.ko.md is missing or stale. Before stopping, write the Korean translation to graphify-out/GRAPH_REPORT.ko.md using the Write tool.\n\nRules:\n1. Do NOT modify GRAPH_REPORT.md — only create/overwrite GRAPH_REPORT.ko.md.\n2. Translate prose to natural Korean. For technical/specialist terms, algorithm names, acronyms, and proper nouns (e.g. EGGROLL, LoRA, NTK, MOSFET, Evolution Strategies, EML Operator, NS-RAM, Transformer, RNN), keep the Korean rendering AND include the original English in parentheses on first meaningful occurrence per section — e.g. '진화 전략(Evolution Strategies)', '어텐션(attention)'. Well-established loanwords that are already common in Korean technical writing (e.g. 알고리즘, 그래프) do not need parentheses.\n3. Keep the following verbatim: node IDs, file paths, code identifiers, numeric values, edge relations (EXTRACTED/INFERRED/AMBIGUOUS), wikilinks [[...]], hyperedge labels.\n4. Preserve Markdown structure exactly: headings, list order, community numbering, god-node ranking, surprising-connection arrows (-->), and hyperedge groupings.\n5. Translate the top-level title too, but keep the date and path unchanged — e.g. '# 그래프 보고서 (Graph Report) - ./raw  (2026-04-18)'.\n\nDo not answer the user further until GRAPH_REPORT.ko.md has been written."
}
JSON
