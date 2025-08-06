SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$(realpath "$SCRIPT_DIR/../src")"
POPULATED_DIR="$(realpath "$SCRIPT_DIR/../populated")"
mkdir -p "$POPULATED_DIR"

# Find all files in the src directory that end with .json and start with devcontainer.
mapfile -t files < <(find "$SRC_DIR" -type f -name 'devcontainer.*.json' -print)

# loop through each file and execute merge-sources.sh
for file in "${files[@]}"; do
  merged_file="$POPULATED_DIR/$(basename "$file" .json).json"
  "$SCRIPT_DIR/merge-sources.sh" "$file" > "$merged_file"
done