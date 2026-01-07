#!/usr/bin/env bash
set -euo pipefail

# Sync local .devcontainer/devcontainer.json from the canonical populated file in
# pmalacho-mit/devcontainers@main using the ref declared in customizations.

devcontainer_path="./.devcontainer/devcontainer.json"
repo="pmalacho-mit/devcontainers"
branch="main"

if [ ! -f "$devcontainer_path" ]; then
	echo "Error: $devcontainer_path not found. Run from a project root with .devcontainer/devcontainer.json." >&2
	exit 1
fi

# Read JSON and extract customizations["pmalacho-mit/devcontainers"].ref without jq.
# Assumptions: ref is a simple filename (no quotes inside, no spaces).
# Strategy: collapse whitespace to simplify matching, then sed to capture the ref value.

# Collapse all insignificant whitespace (safe for filenames without spaces)
minified_json=$(tr -d '\n\r\t ' < "$devcontainer_path")

# Extract ref under the exact key name "pmalacho-mit/devcontainers" then "ref":"..."
ref=$(printf '%s' "$minified_json" | sed -n 's@.*"pmalacho-mit/devcontainers"[^}]*"ref":"\([^"]*\)".*@\1@p')

if [ -z "${ref:-}" ]; then
	echo "Error: Could not determine customizations.pmalacho-mit/devcontainers.ref from $devcontainer_path" >&2
	echo "Ensure the file contains: \"customizations\": { \"pmalacho-mit/devcontainers\": { \"ref\": \"<filename>\" } }" >&2
	exit 1
fi

src_file="populated/$ref"

echo "Syncing $devcontainer_path from $repo@$branch:$src_file"

tmp_file="$devcontainer_path.tmp$$"
trap 'rm -f "$tmp_file"' EXIT

# Fetch raw file bytes using git-raw utility and write atomically
if bash <(curl -fsSL https://suede.sh/utils/git-raw) \
	--repo "$repo" \
	--branch "$branch" \
	--file "$src_file" > "$tmp_file"; then
	mv "$tmp_file" "$devcontainer_path"
	echo "Updated $devcontainer_path"
else
	echo "Error: Failed to fetch $src_file from $repo@$branch" >&2
	exit 1
fi

