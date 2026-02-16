---
id: STD-063
title: Non-Deterministic Testing Standard
version: 0.1.0
category: engineering
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
review_date: 2026-05-15
extends: [STD-000, STD-008]
tags: [testing, non-deterministic, statistical, flaky, ml, rl, llm, property-based]
---
# Purpose

This standard defines requirements for testing software components whose
outputs are inherently non-deterministic. It extends
[Testing_and_Quality_Standard](Testing_and_Quality_Standard.md) with
guidance for statistical assertions, property-based testing, flakiness
management, seed control, and evaluation of ML/RL/LLM outputs.

STD-008 assumes deterministic assertions. This companion standard
addresses the gap for systems where exact output matching is impossible
or inappropriate.

# Scope

This standard applies to any governed component that produces
non-deterministic output, including but not limited to:

- Machine learning inference pipelines
- Reinforcement learning policy evaluation
- LLM-backed retrieval or generation
- Randomized algorithms and probabilistic data structures
- Concurrent or distributed systems with observable non-determinism
- Property-based and fuzz testing harnesses

Components with fully deterministic behavior remain governed solely by
[Testing_and_Quality_Standard](Testing_and_Quality_Standard.md).

# Standard

## 1. Classification of Non-Deterministic Components

1.1 Each module MUST be classified as deterministic or non-deterministic
in its technical specification per
[Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md).

1.2 Non-deterministic components MUST document the source of
non-determinism (e.g., model inference, random sampling, concurrency,
external service variability).

1.3 Where possible, non-deterministic components MUST expose a seed or
configuration parameter to enable reproducible test runs.

## 2. Statistical Assertions

2.1 Tests for non-deterministic outputs MUST use statistical assertions
rather than exact equality checks.

2.2 Statistical assertions MUST define:

- The metric under test (e.g., accuracy, latency percentile, reward)
- The expected value or acceptable range
- The confidence level (minimum 95% unless justified)
- The minimum sample size or number of trials

2.3 Acceptable tolerance thresholds MUST be documented alongside each
statistical assertion and justified based on domain requirements.

2.4 Tests MUST fail when the observed metric falls outside the defined
confidence interval, not on individual trial results.

2.5 Where applicable, tests SHOULD use established statistical methods:
Welch's t-test, bootstrap confidence intervals, or Kolmogorov-Smirnov
tests for distribution comparison.

## 3. Property-Based Testing

3.1 Non-deterministic components SHOULD use property-based testing to
validate invariants across randomized inputs.

3.2 Property-based tests MUST define:

- The property (invariant) under test
- The input generation strategy
- The minimum number of examples to generate (default: 100)
- The shrinking strategy for failure cases

3.3 Failing property-based test cases MUST be recorded as regression
seeds and added to the deterministic test suite.

3.4 Property-based tests MUST be reproducible given the same seed.

## 4. Seed Management and Reproducibility

4.1 All randomized test runs MUST log the seed used so failures can be
reproduced.

4.2 CI pipelines MUST support re-running a test with a specific seed
via environment variable or command-line parameter.

4.3 A fixed seed regression suite MUST exist alongside randomized runs
to provide a deterministic baseline.

4.4 Seed values used in fixed regression suites MUST be documented with
the rationale for their selection (e.g., previously discovered edge
case).

## 5. Flakiness Management

5.1 Each project MUST define a flakiness budget: the maximum percentage
of non-deterministic test runs permitted to fail without blocking the
pipeline.

5.2 The flakiness budget MUST NOT exceed 5% of non-deterministic test
runs per CI cycle unless explicitly approved and documented per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

5.3 Tests that exceed their flakiness budget MUST be quarantined and
tracked as defects.

5.4 Quarantined tests MUST have an assigned owner and a remediation
deadline not exceeding 14 calendar days.

5.5 Retry strategies for flaky tests MUST be explicit:

- Maximum retry count MUST be defined (recommended: 3)
- Retries MUST NOT mask genuine regressions
- Retry outcomes MUST be logged and counted toward flakiness metrics

5.6 A test that passes only on retry MUST be counted as a flaky pass,
not a clean pass, in quality metrics.

## 6. ML/RL Output Validation

6.1 ML model tests MUST validate against held-out evaluation datasets
with versioned, immutable snapshots.

6.2 Evaluation datasets MUST be version-controlled or referenced by
content hash and documented in the technical specification.

6.3 ML model tests MUST define regression thresholds: the minimum
acceptable metric (accuracy, F1, AUC, etc.) below which the model
MUST NOT be deployed.

6.4 RL policy tests MUST validate:

- Reward distribution bounds (mean and variance)
- Behavioral constraints (safety invariants the policy must not violate)
- Performance relative to a baseline policy

6.5 RL tests MUST run a minimum number of episodes sufficient for
statistical significance (documented per component).

## 7. LLM Output Testing

7.1 LLM output tests MUST NOT rely on exact string matching.

7.2 LLM outputs MUST be validated using one or more of:

- Schema conformance (structured output matches expected format)
- Semantic similarity against reference outputs (with defined threshold)
- Classifier-based evaluation (toxicity, relevance, factuality)
- Human evaluation protocols for subjective quality (with inter-rater
  reliability requirements)

7.3 LLM test suites MUST include adversarial and edge-case prompts to
validate robustness.

7.4 LLM evaluation results MUST be logged with model version, prompt
version, and evaluation criteria version to enable regression tracking.

## 8. Evaluation Dataset Management

8.1 Evaluation datasets MUST be versioned independently from code using
content-addressable storage or tagged releases.

8.2 Changes to evaluation datasets MUST be reviewed and approved with
the same rigor as code changes.

8.3 Evaluation datasets MUST NOT overlap with training data. Separation
MUST be verified and documented.

8.4 Dataset versioning MUST support rollback to any previous version for
regression investigation.

## 9. Reporting and Metrics

9.1 Non-deterministic test results MUST be reported separately from
deterministic test results in CI dashboards.

9.2 Reports MUST include: pass/fail counts, flakiness rate, retry
counts, statistical confidence levels, and trend data.

9.3 Flakiness trends MUST be reviewed at least monthly. Increasing
flakiness MUST trigger investigation per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

# Implementation Notes

- Python projects SHOULD use Hypothesis for property-based testing and
  scipy.stats or statsmodels for statistical assertions.
- Seed management can be implemented via `RANDOM_SEED` environment
  variable convention across test frameworks.
- Consider dedicated test stages in CI: deterministic tests run first
  (fast fail), non-deterministic tests run second with retry logic.
- LLM evaluation tooling (e.g., promptfoo, deepeval) MAY be used to
  automate semantic evaluation, but tool selection is not mandated.

# Continuous Improvement and Compliance Metrics

- Track flakiness rate trends per component and across the project.
- Track quarantine queue depth and remediation time.
- Track evaluation dataset freshness and coverage.
- Review statistical threshold calibration quarterly or after model
  retraining.

# Compliance

Components classified as non-deterministic that do not meet this
standard are non-compliant per
[Testing_and_Quality_Standard](Testing_and_Quality_Standard.md) and
MUST NOT be released to production.

# Changelog

- 0.1.0 -- Initial draft.
