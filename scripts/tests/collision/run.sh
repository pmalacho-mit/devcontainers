SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MERGE_SCRIPT=$(realpath "$SCRIPT_DIR/../../merge-sources.sh")

TEST_FILES=("$SCRIPT_DIR/a.json" "$SCRIPT_DIR/b.json")
EXPECTED_FILE="$SCRIPT_DIR/expected.json"

"$MERGE_SCRIPT" "${TEST_FILES[@]}" | diff --ignore-all-space - "$EXPECTED_FILE"