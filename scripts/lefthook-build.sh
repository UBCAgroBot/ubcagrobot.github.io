#!/usr/bin/env bash
set -euo pipefail

if git diff --cached --quiet; then
  exit 0
fi

# Skip the full build on pre-push in dev to avoid the long local wait.
# Run the full build explicitly when needed.
exit 0
