# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This is a documentation-only engineering knowledge base. There is no
application source code, no build system, and no test suite. All files
are markdown with YAML frontmatter.

## Key entry points

- [Onboarding](00_Orientation/Onboarding.md) — start here for reading path
- [Governance Overview](01_Governance/Software_Engineering_Governance_Overview.md) — authority structure
- [SDLC](05_Dev_Workflows/SDLC_With_AI.md) — authoritative development workflow
- [Documentation Standard](02_Documentation_Standards/Documentation_Standard.md) — how docs are structured

## Document conventions

- Every governed doc has YAML frontmatter: id, title, version, category,
  status, owner, reviewer, approver, last_updated, extends, tags
- Every governed doc follows 7 mandatory sections: Purpose, Scope,
  Standard, Implementation Notes, Continuous Improvement, Compliance,
  Changelog
- Cross-references use standard relative markdown links
- When editing: bump version, update last_updated, add changelog entry

## Lint

```bash
npx markdownlint "**/*.md"
npx cspell "**/*.md"
```

CI is not yet configured. Lint locally before committing.

## Commits and PRs

- Use conventional commits with `docs:` prefix
- All changes via pull requests (squash merge, linear history)
- Per STD-031: branch naming `<type>/<short-name>` (feature/, fix/, chore/, docs/)
- Maintainer approval required before merge

## Privileged operations

Use `/usr/local/sbin/codex-helper.sh` for any privileged operations.
Do not run raw `sudo`.
