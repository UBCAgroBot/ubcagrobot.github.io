#!/usr/bin/env bash
set -euo pipefail

check_only=0
for arg in "$@"; do
  if [ "$arg" = "--check" ]; then
    check_only=1
  fi
done

files=()
while IFS= read -r file; do
  [ -n "$file" ] || continue
  [ -f "$file" ] || continue
  case "$file" in
    *.astro|*.js|*.jsx|*.ts|*.tsx|*.mjs|*.cjs)
      files+=("$file")
      ;;
  esac
done < <(git diff --cached --name-only --diff-filter=ACMR)

if [ ${#files[@]} -eq 0 ]; then
  echo "No relevant staged files to lint."
  exit 0
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$ROOT_DIR/node_modules/.bin:$PATH"

if [ "$check_only" -eq 1 ]; then
  oxlint --quiet "${files[@]}" && eslint "${files[@]}"
else
  oxlint --fix "${files[@]}" && eslint "${files[@]}" --fix
fi
