#!/usr/bin/env bash
set -euo pipefail

file="$1"

# 1. Read your list of bases from .extends[]
mapfile -t bases < <(jq -r '.extends[]?' "$file")

# 2. Pass all base files, then the child file itself, into jq slurp
#    Reduce them in order, merging each into the accumulator
jq -s '
  reduce .[] as $item ({}; . * ($item | del(.extends)))
' "${bases[@]}" "$file"
