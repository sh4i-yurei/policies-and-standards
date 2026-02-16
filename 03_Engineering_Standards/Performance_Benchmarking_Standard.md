---
id: STD-064
title: Performance Benchmarking Standard
version: 0.1.0
category: engineering
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
review_date: 2026-05-15
extends: [STD-000, STD-008, STD-043]
tags: [performance, benchmarking, regression, load-testing, profiling]
---
# Purpose

This standard defines requirements for establishing performance
baselines, detecting regressions, and validating system behavior under
load. It bridges the gap between
[SLI_SLO_Standard](SLI_SLO_Standard.md) (which defines reliability
targets) and [Testing_and_Quality_Standard](Testing_and_Quality_Standard.md)
(which defines test types) by specifying how performance is measured,
tracked, and enforced through CI and operational workflows.

# Scope

This standard applies to all governed systems with performance-sensitive
paths, including but not limited to:

- API services with latency or throughput SLOs
- Data processing and ML inference pipelines
- Batch and ETL workflows with timeliness constraints
- Client-facing applications with responsiveness requirements

Systems without performance-sensitive paths remain governed solely by
[Testing_and_Quality_Standard](Testing_and_Quality_Standard.md) and
[SLI_SLO_Standard](SLI_SLO_Standard.md).

# Standard

## 1. Benchmark Baseline Establishment

1.1 Each performance-sensitive path MUST have a documented benchmark
baseline before release to production.

1.2 A benchmark baseline MUST include:

- The metric under test (e.g., p50/p95/p99 latency, throughput, memory)
- The workload profile (input size, concurrency, data distribution)
- The execution environment (hardware, OS, runtime version, config)
- The measured values with statistical summary (mean, median, standard
  deviation, percentiles)
- The date and commit hash of the measurement

1.3 Baselines MUST be established using a controlled environment that
is documented and reproducible.

1.4 Baselines MUST be re-established after significant architectural
changes, dependency upgrades, or environment migrations.

1.5 Baseline measurements MUST use a minimum of 30 iterations (or runs)
to ensure statistical validity unless the workload duration makes this
impractical, in which case the minimum iteration count MUST be justified.

## 2. Regression Detection

2.1 Each benchmark MUST define a regression threshold: the maximum
acceptable deviation from baseline before the change is flagged.

2.2 Regression thresholds MUST be expressed as a percentage relative
to the baseline (e.g., "p95 latency must not increase by more than
10%").

2.3 Default regression thresholds, when not otherwise specified, are:

- Latency (p95): 10% degradation
- Throughput: 10% degradation
- Memory usage (peak): 15% increase

2.4 Custom thresholds MUST be documented alongside the benchmark
definition and justified based on SLO requirements per
[SLI_SLO_Standard](SLI_SLO_Standard.md).

2.5 Regression detection MUST account for measurement noise by using
statistical comparison (e.g., confidence intervals, effect size) rather
than single-run comparison.

2.6 When a regression is detected, it MUST be reported as a CI check
failure or advisory warning depending on the project's gate
configuration.

## 3. CI Integration

3.1 Projects with performance-sensitive paths SHOULD include a
performance check in their CI pipeline.

3.2 The performance check MAY be configured as either:

- A blocking gate (merge is blocked on regression)
- An advisory check (regression is reported but does not block merge)

3.3 The choice between blocking and advisory MUST be documented in the
project's CI configuration and aligned with the criticality of the
performance path.

3.4 Performance benchmarks in CI MUST run on consistent infrastructure
to minimize environmental variance. If shared CI runners are used,
variance MUST be documented and thresholds adjusted accordingly.

3.5 Performance CI results MUST be stored as artifacts with commit hash,
branch, timestamp, and full metric output for historical comparison.

3.6 Performance checks SHOULD NOT run on every commit to avoid pipeline
bottlenecks. Recommended triggers:

- Pull request targeting main or release branches
- Scheduled nightly runs against the main branch
- Manual trigger for ad-hoc investigation

## 4. Load Testing

4.1 Services with throughput or concurrency SLOs MUST have load tests
that validate behavior under expected and peak traffic.

4.2 Load test scenarios MUST include:

- Baseline load (expected steady-state traffic)
- Peak load (maximum expected concurrent users or requests)
- Soak test (sustained load over an extended period to detect leaks)

4.3 Load tests MUST define pass/fail criteria tied to SLOs: latency
percentiles, error rates, and resource utilization thresholds.

4.4 Load test results MUST be documented with the workload profile,
environment, and observed metrics.

4.5 Load tests SHOULD be run in a staging or pre-production environment
that approximates production capacity. Deviations from production MUST
be documented.

## 5. Profiling Workflow

5.1 Profiling MUST be performed when:

- A performance regression is detected and the root cause is unknown
- A new performance-sensitive path is introduced
- A significant refactoring of a performance-sensitive path is planned

5.2 Profiling results MUST identify the top contributors to the
measured metric (e.g., top functions by CPU time, top allocations by
memory).

5.3 Profiling MUST use tooling appropriate to the language and runtime.
Tool selection is not mandated but MUST be documented in the project's
[Tooling_Inventory](Tooling_Inventory.md) or technical specification.

5.4 Profiling results that lead to optimization work MUST be linked to
the governing issue per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

## 6. Historical Tracking and Reporting

6.1 Benchmark results MUST be stored in a persistent, queryable format
(e.g., JSON artifacts, database, or time-series store).

6.2 Historical benchmark data MUST be retained for at least 90 days or
the duration of the current release cycle, whichever is longer.

6.3 Projects SHOULD maintain a performance dashboard or trend report
that visualizes benchmark metrics over time.

6.4 Performance trends MUST be reviewed at least quarterly or when SLOs
are recalibrated per [SLI_SLO_Standard](SLI_SLO_Standard.md) §4.

6.5 Reports MUST include:

- Metric trends with commit or release correlation
- Regression events and their resolution status
- Comparison of current performance against baseline and SLO targets

# Implementation Notes

- Micro-benchmark frameworks (e.g., `pytest-benchmark`, Go's
  `testing.B`, Criterion for Rust) are suitable for function-level
  benchmarks.
- Load testing tools (e.g., k6, Locust, wrk) are suitable for
  service-level load tests. Tool selection is project-specific.
- Store benchmark results as CI artifacts or in a dedicated results
  repository for historical comparison.
- Consider using benchmark comparison tools (e.g., `benchstat` for Go,
  `pytest-benchmark` compare mode) for automated regression detection.

# Continuous Improvement and Compliance Metrics

- Track the number of performance-sensitive paths with baselines vs.
  those without.
- Track regression detection rate and false positive rate.
- Track time to resolution for detected regressions.
- Review threshold calibration quarterly alongside SLO reviews.

# Compliance

Performance-sensitive paths without documented baselines and regression
thresholds are non-compliant. Non-compliance MUST be tracked per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md)
and remediated before the next production release.

# Changelog

- 0.1.0 -- Initial draft.
