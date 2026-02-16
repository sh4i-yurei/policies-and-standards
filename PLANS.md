# PLANS.md

PLANS.md tracks session history and planning for the policies-and-standards
knowledge base.

## When an ExecPlan is required

- New standards or major amendments (Heavy complexity).
- Multi-instance sprints with 3+ instances.
- Cross-cutting changes that affect multiple standards simultaneously.

Single-document amendments, template additions, and CI config changes do
not require an ExecPlan.

## ExecPlan requirements

- ExecPlans MUST be self-contained; a new contributor can implement the
  task using only the ExecPlan and the repo.
- ExecPlans MUST define the user-visible outcome and how to verify it.
- Progress, Surprises and Discoveries, Decision Log, and Outcomes and
  Retrospective MUST be updated as work proceeds.

## Storage

Store ExecPlans under `plans/exec_plans/<YYYY-MM-DD>_<short_slug>.md`.

## Current status

**Phase**: KB maintenance and improvement
**Last session**: Session 11 — 4-instance sprint, closed 11 issues, merged 6 PRs
**Next**: Session 12 — promote STD-063 through STD-066 from draft to review;
3ngram Stage 3 work shifts focus to the 3ngram repo

### Open issues (11)

All remaining issues are blocked on 3ngram implementation maturity or
are low-priority CI tooling:

- #31 — AI hallucination scanner (deferred, needs design maturity)
- #25 — Scheduled security scan (low priority)
- #27 — Auto-labeler for PRs (low priority)
- #30 — AI commit attribution (low priority)
- #26, #32-37 — Deployment/release pipeline (blocked on 3ngram)

### Key decisions (Session 11)

- **First 4-instance sprint**: 11 tasks distributed across I1 (orchestrator),
  I2 (ML/tech-debt), I3 (testing/benchmarking), I4 (standards amendments).
- **4 new standards**: STD-063 (ML/Model Lifecycle), STD-064 (Technical Debt
  Tracking), STD-065 (Non-Deterministic Testing), STD-066 (Performance
  Benchmarking). All in draft status.
- **5 standards amended**: STD-004 v1.2.0 (AI attribution + subagent
  verification), STD-005 v1.2.0 (dependency update cadence), STD-008 v1.1.1
  (non-deterministic testing cross-ref), STD-030 v1.4.0 (Gate G hallucination
  detection), STD-043 (benchmarking cross-ref).
- **STD-062 v1.2.0**: Worker completion protocol and review thread resolution
  added (PR #69, post-sprint process improvement).
- **STD-061 amended**: Daily report requirement for 3+ instance sessions,
  session handoff template storage paths updated.
- **Process improvements**: Fixed nvm lazy-load recursion, added review gates
  to sprint-merge skill, worker completion checklist to sprint-plan skill,
  thread resolution to pr-ready skill.
- **Copilot auto-review**: `review_on_push` unreliable for concurrent pushes
  (1/3 triggered). `--reviewer Copilot` on `gh pr create` doesn't work.
  Documented as known limitation.
- **Merge management**: Branch protection requires up-to-date branches. After
  each merge, remaining PRs must be rebased + force-pushed.

### Key decisions (Session 10)

- **GitHub account audit**: Squash-only, auto-delete branches, wiki disabled,
  secret scanning + push protection, Dependabot alerts on both repos.
- **Copilot rulesets**: Replaced custom gate workflow proposal (#22) with
  native Copilot auto-review rulesets.
- **CI gates**: p&s has 5 required gates (markdownlint, link-check, yamllint,
  spellcheck, frontmatter). 3ngram has 10 required gates.
- **SDLC-aligned labels**: phase:*, type:*, priority:*, scope:* labels on
  both repos.

### Key decisions (Session 9)

- **5-instance sprint**: First multi-agent sprint. Closed 10 issues across
  both repos. Established multi-instance patterns (worktrees, branch
  discipline, merge management).
- **KB gap analysis** (Session 8): Identified issues #42-46 from systematic
  KB audit, all resolved in Session 11.
