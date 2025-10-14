#!/usr/bin/env bash
set -euo pipefail

# Configure git (overridable via env)
git config user.email "${GIT_AUTHOR_EMAIL:-action@github.com}"
git config user.name  "${GIT_AUTHOR_NAME:-GitHub Action}"

# Make sure we see remote branches
git fetch --all --prune

shopt -s nullglob
files=(populated/devcontainer.*.json)
if (( ${#files[@]} == 0 )); then
  echo "No populated/devcontainer.*.json files found. Nothing to publish."
  exit 0
fi

for path in "${files[@]}"; do
  base="$(basename "$path")"
  # Branch name is the bit between devcontainer. and .json
  name="${base#devcontainer.}"
  name="${name%.json}"
  branch="$name"

  echo "=== $base -> branch '$branch' ==="

  if git ls-remote --exit-code --heads origin "$branch" >/dev/null 2>&1; then
    echo "Branch exists. Updating .devcontainer/devcontainer.json"
    wt="$(mktemp -d)"
    # Create/reset a local branch tracking origin/$branch, then add as a worktree
    git worktree add -B "$branch" "$wt" "origin/$branch"
    mkdir -p "$wt/.devcontainer"
    cp "$path" "$wt/.devcontainer/devcontainer.json"

    pushd "$wt" >/dev/null
    git add .devcontainer/devcontainer.json
    if git diff --cached --quiet; then
      echo "No changes to commit for '$branch'."
    else
      git commit -m "chore: update devcontainer for $branch from $base"
      git push origin "$branch"
    fi
    popd >/dev/null

    git worktree remove "$wt" --force
  else
    echo "Branch does not exist. Creating orphan '$branch' with only the devcontainer."
    wt="$(mktemp -d)"
    git worktree add --orphan "$branch" "$wt"
    pushd "$wt" >/dev/null

    # Ensure empty tree (ignore errors if globs don't match)
    rm -rf ./* .[^.]* || true

    mkdir -p .devcontainer
    cp "$GITHUB_WORKSPACE/$path" ".devcontainer/devcontainer.json"

    git add .devcontainer/devcontainer.json
    git commit -m "chore: init devcontainer for $branch from $base"
    git push -u origin "$branch"

    popd >/dev/null
    git worktree remove "$wt" --force
  fi
done
