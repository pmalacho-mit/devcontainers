#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MERGE_SCRIPT=$(realpath "$SCRIPT_DIR/../../merge-sources.sh")

CASES=("array" "object" "primitive")

for TEST in "${CASES[@]}"; do
  TEST_PATH="$SCRIPT_DIR/$TEST"
  TEST_FILES=("$TEST_PATH"/{a,b}.json)
  EXPECTED_FILE="$TEST_PATH/expected.json"
  if ! "$MERGE_SCRIPT" "${TEST_FILES[@]}" | diff --ignore-all-space - "$EXPECTED_FILE"; then
    echo "Test failed for case: $TEST. Output differs from expected." >&2
    exit 1
  fi
done