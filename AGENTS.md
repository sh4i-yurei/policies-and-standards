# Repository Guidelines

## Project Structure & Module Organization
Policies, standards, and playbooks live as Markdown at the repo root. Keep high-level overviews in `README.md`, and group detailed material under new folders named for their domain (for example, `policies/`, `standards/`, `ops/`). Use nested `index.md` files to summarize each folder and link to deeper topics. Reference assets (charts, templates) from an adjacent `assets/` folder and prefer relative links so documents remain portable.

## Build, Test, and Development Commands
Although this is a documentation-first repo, treat formatting checks as the build. Run `npx markdownlint "**/*.md"` to enforce heading order, spacing, and list hygiene. Follow it with `npx cspell "**/*.md"` to catch terminology regressions. Use `npx markdown-link-check README.md` (or other target files) before opening a PR to ensure internal and external links resolve.

## Coding Style & Naming Conventions
Write in Markdown with 80-character soft wraps and sentence-case headings (except proper nouns). Prefer bulleted lists for policies, numbered steps for procedures, and callouts using blockquotes for warnings. File names should be lowercase with hyphens (`risk-register.md`). When including code or command snippets, add fenced blocks with an info string such as ```bash` to hint tooling. Run `markdownlint --fix` for mechanical formatting only when the semantic meaning stays intact.

## Testing Guidelines
Treat lint and spell-check runs as mandatory tests; documentation changes should not skip them. When introducing executable snippets, validate them locally and note prerequisites inline. For sizable restructures, add or update link-check steps in CI by extending `.github/workflows/*` once automation is introduced. Aim for every new folder to carry an overview file plus a checklist or appendix so reviewers can trace coverage easily.

## Commit & Pull Request Guidelines
Use Conventional Commit prefixes (`docs:`, `chore:`) and imperative mood, e.g., `docs: outline supplier onboarding policy`. Each PR should describe scope, reader impact, and any follow-up tasks; link to tracking issues or policy tickets when available. Attach screenshots or rendered previews when UI-facing assets change, and request review from the policy owner or steward named in the affected document's header.

## Security & Configuration Tips
Never include confidential data, access tokens, or system screenshots containing secrets. Redact names that are not already public policy owners, and move sensitive operational procedures to the secure knowledge base, linking here with access instructions instead. If a document depends on internal tooling, describe required roles and config files in an appendix rather than embedding credentials.


## Agent Roles & Workflow

### Gemini – CLI Operator
Gemini performs terminal and file-system tasks such as cloning repositories, running validation scripts, staging changes, and pushing commits. Gemini must never modify content logic or commit unverified files. All structural or textual changes require Codex approval and project-owner confirmation before push.

### Codex – Code & Standards Reviewer
Codex analyzes and validates repository content. It runs linting, schema, and structure checks; verifies conformance to `STD-001 Documentation Standard`; and proposes corrections. Codex does **not** commit directly. All Codex findings are reviewed and approved by the project owner prior to merge.

### Project Owner – Human Authority
The project owner manually executes sensitive operations, handles Git conflicts, and approves merges. The owner ensures alignment with organizational standards and manages version tags (e.g., `v1.0.0`). When ambiguity arises, the project owner’s decision is final.

### Workflow Summary
1. Gemini executes an operation or change request.  
2. Codex validates all modified files using `/review` or `./tools/validate.sh`.  
3. The project owner reviews Codex’s feedback and either requests edits or instructs Gemini to commit.  
4. Commits reference the verification cycle in the message (`CVC: Verified by Codex`).  
5. Tags and releases are created only after owner approval.

This workflow ensures a clean separation of duties and traceable, compliant documentation updates.
