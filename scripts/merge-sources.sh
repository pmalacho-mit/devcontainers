#!/usr/bin/env bash
set -euo pipefail

# USAGE: merge-sources.sh <file.json> > merged.json

# 1) Figure out where *this* script lives
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 2) Build the path to list-sources.sh
LIST_SCRIPT="$SCRIPT_DIR/list-sources.sh"

# 3) Now use it, passing along the child.json
child="$1"
mapfile -t files < <("$LIST_SCRIPT" "$child")


# 4) Convert relative paths to absolute paths
abs_files=()
child_dir="$(cd "$(dirname "$child")" && pwd)"
for f in "${files[@]}"; do
  if [[ "$f" = /* ]]; then
    abs_files+=("$f")
  else
    abs_files+=("$child_dir/$f")
  fi
done

# 5) merge via jq

jq -s '
  def deep_merge($val1; $val2):
    [($val1, $val2) | type] as $types |
    if $types == ["object", "object"] then
        # merge objects
        reduce ([($val1, $val2) | keys[]] | unique[]) as $k ({};
            if all($val1, $val2; has($k)) then
                .[$k] = deep_merge($val1[$k]; $val2[$k])
            else
                .[$k] = ($val1[$k] // $val2[$k])
            end
        )
    elif $types == ["array", "array"] then
        # both arrays, concatenate
        $val1 + $val2
    else
        # use default merge
        $val1 * $val2
    end
    ;

  # fold all inputs (base → … → child) through merge(), stripping any extends
  reduce .[] as $item (
    {};
    deep_merge(. ; $item | del(.extends))
  )
' "${abs_files[@]}"
