#!/usr/bin/env bash
set -euo pipefail

# Validate YAML frontmatter in governed markdown files.
# Checks that required fields exist in all files with frontmatter.
#
# Usage:
#   ./scripts/validate-frontmatter.sh [directory]
#   Default directory: current working directory

DIR="${1:-.}"
ERRORS=0
REQUIRED_FIELDS="id title version category status"

# Files to skip (no governed frontmatter expected)
SKIP_PATTERN="README.md|SECURITY.md|INDEX.md|CLAUDE.md|CONTRIBUTING.md|CODE_OF_CONDUCT.md|LICENSE.md"

for f in $(find "$DIR" -name '*.md' \
  -not -path '*/.github/*' \
  -not -path '*/node_modules/*' \
  -not -path '*/.git/*' | sort); do

  basename=$(basename "$f")

  # Skip non-governed files
  if echo "$basename" | grep -qE "^($SKIP_PATTERN)$"; then
    continue
  fi

  # Check if file has frontmatter
  if ! head -1 "$f" | grep -q '^---'; then
    continue
  fi

  # Extract frontmatter (between first and second ---)
  FM=$(sed -n '1,/^---$/p' "$f" | tail -n +2 | head -50)

  for field in $REQUIRED_FIELDS; do
    if ! echo "$FM" | grep -q "^${field}:"; then
      echo "ERROR: $f — missing required field: $field"
      ERRORS=$((ERRORS + 1))
    fi
  done
done

if [ "$ERRORS" -gt 0 ]; then
  echo ""
  echo "Found $ERRORS frontmatter errors."
  exit 1
fi

echo "All frontmatter valid."
