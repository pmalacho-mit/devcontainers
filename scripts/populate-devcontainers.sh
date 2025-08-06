# USAGE: populate-devcontainers.sh
#
# Finds all devcontainer.*.json files in the src directory, merges each using merge-sources.sh,
# and writes the merged output to the populated directory. This produces fully resolved
# devcontainer configuration files with "extends" inheritance applied.

self_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src_dir="$(realpath "$self_dir/../src")"
populated_dir="$(realpath "$self_dir/../populated")"
mkdir -p "$populated_dir"

# Find all files in the src directory that end with .json and start with devcontainer.
mapfile -t files < <(find "$src_dir" -type f -name 'devcontainer.*.json' -print)

# loop through each file and execute merge-sources.sh
for file in "${files[@]}"; do
  merged_file="$populated_dir/$(basename "$file" .json).json"
  "$self_dir/merge-sources.sh" "$file" > "$merged_file"
done