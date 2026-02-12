# Security Policy

## Scope

This policy covers the `policies-and-standards` knowledge base repository
and all governed artifacts within it.

## Supported Versions

| Version | Supported |
|---------|-----------|
| v2.x    | Yes       |
| < v2.0  | No        |

## Reporting Vulnerabilities

If you discover a security vulnerability in this repository or in any
governed project that references it:

1. **Do not** open a public issue.
2. Email the maintainer directly or use GitHub's private vulnerability
   reporting feature.
3. Include: affected version, impact assessment, and reproduction steps.
4. Expected response time: 48 hours for acknowledgment, 7 days for
   triage.

## Handling Vulnerabilities

- The maintainer triages, assesses severity, and assigns a fix owner.
- Fixes follow the standard PR workflow with all CI gates enforced.
- Advisories are published via GitHub Security Advisories when applicable.
- Vulnerability tracking follows
  [vulnerability-management-workflow](05_Dev_Workflows/vulnerability-management-workflow.md).

## Dependencies and Secrets

- No application dependencies exist in this repository (documentation only).
- GitHub Actions workflows pin to specific versions and are monitored by
  Dependabot.
- No secrets are stored in the repository. CI secrets use GitHub
  encrypted secrets with least-privilege scope.

## Safe Behavior Expectations

- All changes require pull request review and passing CI.
- Follow [Security and Threat Modeling Standard](03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md).
- No direct pushes to protected branches.

## Contact

Security contact: @sh4i-yurei (GitHub)
