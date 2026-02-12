#!/usr/bin/env bash
set -euo pipefail

# Project Scaffolding Script
# Automates STD-054 (project_repo_initialization_workflow)
#
# Usage:
#   ./scripts/init-project.sh --name my-project --tier 2 --language python
#   ./scripts/init-project.sh --name my-project --tier 3 --language rust --public
#   ./scripts/init-project.sh --name my-project --tier 1 --language node --dry-run

KB_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KB_TEMPLATES="$KB_ROOT/06_Projects/Templates"

# Defaults
PROJECT_NAME=""
TIER=""
LANGUAGE=""
VISIBILITY="private"
DRY_RUN=false
TARGET_DIR=""
GH_ORG="sh4i-yurei"

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Initialize a new governed project repository.

Required:
  --name <name>         Project name (used as repo name)
  --tier <1|2|3>        Project tier (determines template depth)
  --language <lang>     Primary language: python|node|rust|java

Optional:
  --target <dir>        Target directory (default: ~/\$name)
  --org <org>           GitHub org/user (default: $GH_ORG)
  --public              Make repo public (default: private)
  --dry-run             Show what would be created without doing it

Tiers:
  1  Minimal — no design docs, lightweight planning
  2  Standard — lightweight design, optional PRD
  3  Full — complete design chain (PRD, proposal, system/module design)
EOF
  exit 1
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --name)     PROJECT_NAME="$2"; shift 2 ;;
    --tier)     TIER="$2"; shift 2 ;;
    --language) LANGUAGE="$2"; shift 2 ;;
    --target)   TARGET_DIR="$2"; shift 2 ;;
    --org)      GH_ORG="$2"; shift 2 ;;
    --public)   VISIBILITY="public"; shift ;;
    --dry-run)  DRY_RUN=true; shift ;;
    -h|--help)  usage ;;
    *)          echo "Unknown option: $1"; usage ;;
  esac
done

# Validate required args
[[ -z "$PROJECT_NAME" ]] && echo "Error: --name is required" && usage
[[ -z "$TIER" ]] && echo "Error: --tier is required" && usage
[[ -z "$LANGUAGE" ]] && echo "Error: --language is required" && usage
[[ "$TIER" =~ ^[123]$ ]] || { echo "Error: --tier must be 1, 2, or 3"; exit 1; }
[[ "$LANGUAGE" =~ ^(python|node|rust|java)$ ]] || { echo "Error: --language must be python|node|rust|java"; exit 1; }

TARGET_DIR="${TARGET_DIR:-$HOME/$PROJECT_NAME}"

log() { echo "[init] $*"; }
dry() { if $DRY_RUN; then echo "[dry-run] $*"; else "$@"; fi; }

# -------------------------------------------------------------------
log "Initializing project: $PROJECT_NAME (tier $TIER, $LANGUAGE)"
log "Target: $TARGET_DIR"
log "Visibility: $VISIBILITY"
[[ "$DRY_RUN" == true ]] && log "*** DRY RUN — no files will be created ***"

# Create directory structure
log "Creating directory structure..."
for dir in \
  .github/workflows \
  .kb \
  docs \
  src \
  tests; do
  dry mkdir -p "$TARGET_DIR/$dir"
done

# If Quint MCP is available, init .quint; otherwise create the dir
if command -v quint-code &>/dev/null; then
  log "Initializing .quint/ via Quint Code..."
  dry mkdir -p "$TARGET_DIR/.quint"
else
  log "Creating .quint/ directory (Quint CLI not found, will init via MCP in session)..."
  dry mkdir -p "$TARGET_DIR/.quint"
fi

# -------------------------------------------------------------------
# Copy project root templates
log "Copying project root templates..."

copy_template() {
  local src="$1" dst="$2" desc="$3"
  if [[ -f "$src" ]]; then
    log "  $desc"
    dry cp "$src" "$dst"
  else
    log "  WARN: Template not found: $src"
  fi
}

copy_template "$KB_TEMPLATES/project_root/agents_tpl.md" "$TARGET_DIR/AGENTS.md" "AGENTS.md"
copy_template "$KB_TEMPLATES/project_root/plans_tpl.md" "$TARGET_DIR/PLANS.md" "PLANS.md"
copy_template "$KB_TEMPLATES/project_root/readme_tpl.md" "$TARGET_DIR/README.md" "README.md"
copy_template "$KB_TEMPLATES/project_root/contributing_tpl.md" "$TARGET_DIR/CONTRIBUTING.md" "CONTRIBUTING.md"
copy_template "$KB_TEMPLATES/project_root/code_of_conduct_tpl.md" "$TARGET_DIR/CODE_OF_CONDUCT.md" "CODE_OF_CONDUCT.md"
copy_template "$KB_TEMPLATES/project_root/security_tpl.md" "$TARGET_DIR/SECURITY.md" "SECURITY.md"
copy_template "$KB_TEMPLATES/project_root/testing_tpl.md" "$TARGET_DIR/docs/TESTING.md" "Testing guide"
copy_template "$KB_TEMPLATES/project_root/pull-request-template_tpl.md" "$TARGET_DIR/.github/pull_request_template.md" "PR template"

# -------------------------------------------------------------------
# CI and tooling files
log "Copying CI and tooling files..."

copy_template "$KB_TEMPLATES/ci/ci-caller.yml" "$TARGET_DIR/.github/workflows/ci.yml" "CI caller workflow"
copy_template "$KB_TEMPLATES/ci/pre-commit-config.yml" "$TARGET_DIR/.pre-commit-config.yaml" "Pre-commit config"

# Copy lint configs from KB repo root
for cfg in .markdownlint.yaml .cspell.json; do
  if [[ -f "$KB_ROOT/$cfg" ]]; then
    log "  $cfg"
    dry cp "$KB_ROOT/$cfg" "$TARGET_DIR/$cfg"
  fi
done

# CODEOWNERS and Dependabot
dry mkdir -p "$TARGET_DIR/.github"
if ! $DRY_RUN; then
  echo "* @$GH_ORG" > "$TARGET_DIR/.github/CODEOWNERS"
  log "  CODEOWNERS"

  cat > "$TARGET_DIR/.github/dependabot.yml" <<DEPEOF
version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
DEPEOF
  log "  dependabot.yml"
fi

# -------------------------------------------------------------------
# Tier-specific templates
log "Copying tier-$TIER templates..."

if [[ "$TIER" -ge 2 ]]; then
  copy_template "$KB_TEMPLATES/design/lightweight-design_tpl.md" "$TARGET_DIR/docs/design.md" "Lightweight design"
  copy_template "$KB_TEMPLATES/planning/project-intake_tpl.md" "$TARGET_DIR/docs/project-intake.md" "Project intake"
fi

if [[ "$TIER" -ge 3 ]]; then
  copy_template "$KB_TEMPLATES/planning/requirements-prd_tpl.md" "$TARGET_DIR/docs/prd.md" "PRD"
  copy_template "$KB_TEMPLATES/planning/project-proposal_tpl.md" "$TARGET_DIR/docs/proposal.md" "Project proposal"
  copy_template "$KB_TEMPLATES/design/system_design_tpl.md" "$TARGET_DIR/docs/system-design.md" "System design"
  copy_template "$KB_TEMPLATES/design/module_design_tpl.md" "$TARGET_DIR/docs/module-design.md" "Module design"
  copy_template "$KB_TEMPLATES/design/technical_specification_tpl.md" "$TARGET_DIR/docs/tech-spec.md" "Technical spec"
  copy_template "$KB_TEMPLATES/architecture/adr_tpl.md" "$TARGET_DIR/docs/adr-template.md" "ADR template"
fi

# -------------------------------------------------------------------
# KB integration file
log "Creating KB integration file..."
if ! $DRY_RUN; then
  KB_TAG=$(cd "$KB_ROOT" && git describe --tags --abbrev=0 2>/dev/null || echo "v2.0.0")
  cat > "$TARGET_DIR/.kb/ai-context.yaml" <<KBEOF
# KB Integration — see STD-056
kb_repo: $GH_ORG/policies-and-standards
kb_tag: $KB_TAG
index: INDEX.md
entry_point: 00_Orientation/Onboarding.md
KBEOF
  log "  .kb/ai-context.yaml (pinned to $KB_TAG)"
fi

# -------------------------------------------------------------------
# Language-specific CI adjustment
if ! $DRY_RUN && [[ -f "$TARGET_DIR/.github/workflows/ci.yml" ]]; then
  sed -i "s/language: python/language: $LANGUAGE/g" "$TARGET_DIR/.github/workflows/ci.yml"
  log "CI workflow language set to: $LANGUAGE"
fi

# -------------------------------------------------------------------
# Language-specific gitignore
log "Creating .gitignore..."
if ! $DRY_RUN; then
  cat > "$TARGET_DIR/.gitignore" <<GIEOF
# Editor
.DS_Store
Thumbs.db
*.swp
.idea/
.vscode/

# AI tools
.aider*
GIEOF

  case "$LANGUAGE" in
    python)
      cat >> "$TARGET_DIR/.gitignore" <<GIEOF

# Python
__pycache__/
*.py[cod]
*.egg-info/
dist/
build/
.venv/
venv/
.mypy_cache/
.ruff_cache/
.pytest_cache/
htmlcov/
results.json
GIEOF
      ;;
    node)
      cat >> "$TARGET_DIR/.gitignore" <<GIEOF

# Node
node_modules/
dist/
coverage/
results.json
.env
GIEOF
      ;;
    rust)
      cat >> "$TARGET_DIR/.gitignore" <<GIEOF

# Rust
target/
Cargo.lock
results.json
GIEOF
      ;;
    java)
      cat >> "$TARGET_DIR/.gitignore" <<GIEOF

# Java
target/
*.class
*.jar
.settings/
.project
.classpath
GIEOF
      ;;
  esac
  log "  .gitignore ($LANGUAGE)"
fi

# -------------------------------------------------------------------
# Git init and initial commit
if ! $DRY_RUN; then
  log "Initializing git repository..."
  cd "$TARGET_DIR"
  git init -b main
  git add -A
  git commit -m "chore: initialize $PROJECT_NAME (tier $TIER, $LANGUAGE)

Scaffolded from policies-and-standards KB templates.
See: STD-054 (project_repo_initialization_workflow)"

  # Create GitHub repo
  log "Creating GitHub repository..."
  gh repo create "$GH_ORG/$PROJECT_NAME" \
    --"$VISIBILITY" \
    --source=. \
    --remote=origin \
    --push

  # Branch protection
  log "Configuring branch protection..."
  gh api "repos/$GH_ORG/$PROJECT_NAME/branches/main/protection" \
    --method PUT \
    --input - <<BPEOF || log "WARN: Branch protection may need manual setup"
{
  "required_status_checks": {
    "strict": true,
    "contexts": []
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 1
  },
  "restrictions": null
}
BPEOF

  log "Done! Repository created: https://github.com/$GH_ORG/$PROJECT_NAME"
else
  log "Done! (dry-run — no repo created)"
fi

# Summary
echo ""
echo "=== Project Initialized ==="
echo "  Name:      $PROJECT_NAME"
echo "  Tier:      $TIER"
echo "  Language:   $LANGUAGE"
echo "  Location:   $TARGET_DIR"
echo "  Visibility: $VISIBILITY"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET_DIR"
echo "  2. pre-commit install"
echo "  3. Review and customize templates in docs/"
echo "  4. Start with the design phase per SDLC (STD-032)"
