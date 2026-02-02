#!/bin/bash

# Path to the commit message file
COMMIT_MSG_FILE="$1"

# Conventional commit regex
REGEX='^((build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)(\(.+\))?(!)?(: (.*\s*)*))|(Merge (.*\s*)*)|(Initial commit$)'

# Read the commit message
COMMIT_MSG=$(head -n1 "$COMMIT_MSG_FILE")

if [[ ! "$COMMIT_MSG" =~ $REGEX ]]; then
  exit 1
fi

exit 0