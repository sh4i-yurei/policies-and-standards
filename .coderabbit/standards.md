# CodeRabbit Standards — policies-and-standards

Mechanically-checkable rules for AI code review. These supplement
`path_instructions` in `.coderabbit.yaml`.

## Document Structure (STD-001)

1. Governed documents MUST have YAML frontmatter with all required
   fields: `id`, `title`, `version`, `category`, `status`, `owner`,
   `reviewer`, `approver`, `last_updated`, `extends`, `tags`.
2. Governed documents MUST contain exactly 7 sections: Purpose, Scope,
   Standard, Implementation Notes, Continuous Improvement, Compliance,
   Changelog.
3. Every version bump MUST have a corresponding Changelog entry
   describing the change.

## Formatting

1. Headings MUST use ATX-style (`#`) not setext-style (`===` / `---`).
2. Cross-references MUST use standard relative markdown links, not
   absolute URLs to the same repo.
3. No trailing whitespace. Files MUST end with a single newline.

## Templates (STD-056)

1. Template `id` fields MUST use the `TPL-` prefix.
2. Templates MUST contain placeholder markers (angle-bracket tokens
   like `<project-name>`) for all user-supplied values.

## Workflows and Scripts

1. GitHub Actions MUST be pinned to a SHA or major version tag. Do
   not use `@main` or floating tags without SHA pinning.
2. Shell scripts in workflows MUST begin with `set -euo pipefail`.
3. No hardcoded secrets, tokens, API keys, or connection strings in
   any committed file. Use `${{ secrets.NAME }}` in workflows.
