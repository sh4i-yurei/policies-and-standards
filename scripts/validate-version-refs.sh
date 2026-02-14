#!/usr/bin/env bash
set -euo pipefail

# Validate cross-document version references.
# Scans markdown files for "vX.Y.Z" references adjacent to known artifact
# names (e.g., "system design v0.1.3") and checks that the referenced
# artifact's frontmatter version matches.
#
# Usage:
#   ./scripts/validate-version-refs.sh [directory]
#   Default directory: current working directory

DIR="${1:-.}"
ERRORS=0

# Extract frontmatter version from a markdown file.
get_version() {
  local file="$1"
  if [ ! -f "$file" ]; then
    return 1
  fi
  sed -n '/^---$/,/^---$/p' "$file" | grep '^version:' | head -1 | \
    sed 's/version:[[:space:]]*//' | tr -d '"' | tr -d "'"
}

# Map of reference patterns to their source files.
# Format: "grep pattern|source file path (relative to DIR)"
# Add entries as artifacts are created.
REFS=(
  "system design v|docs/design/system-design.md"
  "system-design v|docs/design/system-design.md"
  "charter v|docs/governance/project-charter.md"
  "project-charter v|docs/governance/project-charter.md"
)

for entry in "${REFS[@]}"; do
  PATTERN="${entry%%|*}"
  SOURCE="${entry##*|}"
  SOURCE_PATH="${DIR}/${SOURCE}"

  # Skip if source artifact doesn't exist in this repo
  if [ ! -f "$SOURCE_PATH" ]; then
    continue
  fi

  ACTUAL_VERSION=$(get_version "$SOURCE_PATH") || continue
  if [ -z "$ACTUAL_VERSION" ]; then
    continue
  fi

  # Find files referencing this artifact with a version
  while IFS= read -r match; do
    FILE="${match%%:*}"
    LINE="${match#*:}"

    # Skip self-references
    if [ "$(realpath "$FILE" 2>/dev/null)" = "$(realpath "$SOURCE_PATH" 2>/dev/null)" ]; then
      continue
    fi

    # Extract the referenced version (e.g., "v0.1.3" -> "0.1.3")
    REF_VERSION=$(echo "$LINE" | sed -nE "s/.*${PATTERN}([0-9]+\.[0-9]+\.[0-9]+).*/\1/p" | head -1)
    if [ -z "$REF_VERSION" ]; then
      continue
    fi

    if [ "$REF_VERSION" != "$ACTUAL_VERSION" ]; then
      echo "ERROR: $FILE references ${SOURCE} v${REF_VERSION} but actual version is ${ACTUAL_VERSION}"
      ERRORS=$((ERRORS + 1))
    fi
  done < <(grep -rn "${PATTERN}[0-9]" "$DIR" \
    --include='*.md' \
    --exclude-dir=.git \
    --exclude-dir=node_modules 2>/dev/null || true)
done

if [ "$ERRORS" -gt 0 ]; then
  echo ""
  echo "Found $ERRORS version reference mismatches."
  exit 1
fi

echo "All version references consistent."
