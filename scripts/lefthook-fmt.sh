#!/usr/bin/env bash
set -euo pipefail

check_only=0
for arg in "$@"; do
  if [ "$arg" = "--check" ]; then
    check_only=1
  fi
done

js_files=()
prettier_files=()

while IFS= read -r file; do
  [ -n "$file" ] || continue
  [ -f "$file" ] || continue

  case "$file" in
    *.js|*.jsx|*.ts|*.tsx|*.mjs|*.cjs)
      js_files+=("$file")
      prettier_files+=("$file")
      ;;
    *.astro|*.json|*.css|*.md|*.html)
      prettier_files+=("$file")
      ;;
  esac
done < <(git diff --cached --name-only --diff-filter=ACMR)

if [ ${#js_files[@]} -eq 0 ] && [ ${#prettier_files[@]} -eq 0 ]; then
  echo "No relevant staged files to format."
  exit 0
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$ROOT_DIR/node_modules/.bin:$PATH"

if [ ${#js_files[@]} -gt 0 ]; then
  if [ "$check_only" -eq 1 ]; then
    oxfmt --check "${js_files[@]}"
  else
    oxfmt --write "${js_files[@]}"
  fi
fi

if [ ${#prettier_files[@]} -gt 0 ]; then
  if [ "$check_only" -eq 1 ]; then
    prettier "${prettier_files[@]}" --check --log-level warn
  else
    prettier "${prettier_files[@]}" --write --log-level warn
  fi
fi
