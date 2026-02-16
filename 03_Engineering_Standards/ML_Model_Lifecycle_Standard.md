---
id: STD-063
title: ML/Model Lifecycle Standard
version: 0.1.0
category: engineering
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-000, STD-008, STD-044]
tags: [ml, model, lifecycle, training, deployment, monitoring]
---
# Purpose

Define mandatory requirements for the lifecycle management of machine
learning models — from training data through deployment, monitoring, and
retirement — so that model behavior is traceable, reproducible, and
governed with the same rigor as conventional software.

# Scope

Applies to all projects that train, fine-tune, deploy, or consume
machine learning models under this governance framework. This includes
traditional ML, deep learning, and large language model (LLM)
integrations.

This standard does not prescribe specific ML frameworks or tooling.

# Standard

## 1. Model inventory and registration

1.1 Every model MUST be registered in a model registry before deployment
to any non-local environment.
1.2 Registry entries MUST include: model name, version, owner, training
date, framework, intended use, and known limitations.
1.3 Models without registry entries MUST NOT be promoted beyond
development environments per
[Environment_Segregation_Standard](Environment_Segregation_Standard.md).

## 2. Training data management

2.1 Training datasets MUST be versioned and traceable to their source.
2.2 Data classification MUST follow
[Data_Management_Standard](Data_Management_Standard.md) requirements for
the data's sensitivity level.
2.3 Data preprocessing and transformation steps MUST be documented and
reproducible.
2.4 Data quality checks MUST be performed before training and results
recorded alongside the training run.
2.5 Personally identifiable information (PII) handling MUST comply with
[AI_Data_Handling_Standard](AI_Data_Handling_Standard.md) and
[Security_and_Threat_Modeling_Standard](Security_and_Threat_Modeling_Standard.md).

## 3. Model versioning and reproducibility

3.1 Every trained model MUST be assigned a unique, immutable version
identifier.
3.2 Training runs MUST record: hyperparameters, random seeds, framework
version, training data version, and environment configuration.
3.3 It MUST be possible to reproduce a training run from recorded
artifacts within documented tolerance bounds.
3.4 Model artifacts (weights, configuration, tokenizer files) MUST be
stored in a versioned artifact store with access controls.

## 4. Evaluation and validation

4.1 Models MUST be evaluated against documented metrics and acceptance
criteria before deployment.
4.2 Evaluation datasets MUST be separate from training data and
versioned independently.
4.3 Evaluation results MUST be recorded and linked to the model version.
4.4 Bias and fairness assessments MUST be performed for models that
affect user-facing decisions, with results documented.
4.5 Models MUST pass testing requirements defined in
[Testing_and_Quality_Standard](Testing_and_Quality_Standard.md)
including integration tests for inference pipelines.

## 5. Deployment lifecycle

5.1 Model deployments MUST follow the staged rollout approach defined in
[Environment_Segregation_Standard](Environment_Segregation_Standard.md).
5.2 Deployment artifacts MUST include the model version, serving
configuration, and dependency manifest.
5.3 Rollback procedures MUST be documented and tested before production
deployment.
5.4 Shadow or canary deployment strategies SHOULD be used for
high-impact models before full production traffic.
5.5 Deployment approvals MUST follow
[Release_Management_Policy](../01_Governance/Release_Management_Policy.md).

## 6. Monitoring and drift detection

6.1 Production models MUST have monitoring for prediction quality,
latency, and throughput.
6.2 Data drift detection MUST be implemented to identify when input
distributions diverge from training data.
6.3 Concept drift detection MUST be implemented to identify when the
relationship between inputs and outputs changes.
6.4 Monitoring thresholds and alerting MUST be defined per
[SLI_SLO_Standard](SLI_SLO_Standard.md) and
[observability_and_feedback](../05_Dev_Workflows/observability_and_feedback.md).
6.5 Drift alerts MUST trigger a documented review process.

## 7. Retraining triggers and schedule

7.1 Retraining criteria MUST be defined for each production model,
including drift thresholds, performance degradation limits, and
scheduled cadence.
7.2 Retraining MUST use the same versioning, evaluation, and deployment
gates as initial training.
7.3 Emergency retraining (e.g., after data contamination or significant
drift) MUST follow
[incident_response](../05_Dev_Workflows/incident_response.md) workflow.
7.4 Retraining decisions MUST be recorded with rationale.

## 8. Model retirement and deprecation

8.1 Models MUST have a documented deprecation plan when superseded or no
longer maintained.
8.2 Retired models MUST be removed from production serving within the
documented deprecation window.
8.3 Retired model artifacts MUST be retained per
[Data_Management_Standard](Data_Management_Standard.md) retention
requirements for audit purposes.
8.4 Downstream consumers MUST be notified before model retirement per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

## 9. Access control and governance

9.1 Model registry access MUST follow least-privilege principles.
9.2 Training infrastructure access MUST be restricted to authorized
personnel.
9.3 Model serving endpoints MUST be secured per
[Security_and_Threat_Modeling_Standard](Security_and_Threat_Modeling_Standard.md).
9.4 AI-assisted development activities involving models MUST comply with
[AI_Assisted_Development_Standard](AI_Assisted_Development_Standard.md).

# Implementation Notes

- Use [Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md)
  to document model evaluation criteria and deployment procedures.
- Track model-related risks in the
  [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md).
- Record operational procedures for model serving in
  [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md).
- This standard intentionally avoids prescribing specific ML frameworks,
  registries, or monitoring tools.

# Continuous Improvement and Compliance Metrics

- Track model deployment frequency, rollback rate, and mean time to
  detect drift.
- Review retraining cadence adherence and evaluation metric trends.
- Audit model registry completeness quarterly.

# Compliance

Models deployed to staging or production without registry entries,
documented evaluation results, or monitoring configuration are
non-compliant and subject to correction prior to serving traffic.

# Changelog

- 0.1.0 — Initial draft.
