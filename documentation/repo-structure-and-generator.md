**Repository Structure and PowerShell Generator**

This document describes the repo layout and how to generate it with the included PowerShell script `create_repo_skeleton.ps1`.

Top-level layout (skeleton):

- modules/
  - network-base/
    - main.tf, variables.tf, outputs.tf, versions.tf, README.md
  - ecs/  (and others)
- landing-zone/
  - landing-zone-foundation/
  - guardrails/
  - logging-audit/
  - shared-obs/
- resource-space/
  - network-base/
  - connectivity/
  - guardrails/
- workloads/
  - ecs/
  - elb/
  - rds/
  - drs/
  - kms/
  - obs-buckets/
- data-sources/
- live/
  - terragrunt.hcl
  - tenants/tenant-absa-bank/
    - dev/stacks
    - non-prod/
    - prod/
- pipelines/
  - azure-pipelines-per-stack.yml
  - azure-pipelines-run-all.yml
- templates/
  - stage-validate.yml
  - stage-plan.yml
  - stage-apply.yml
  - stage-evidence.yml
- policy/opa/
  - required-tags.rego
  - deny-public-ingress.rego
- documentation/
  - architecture-operating-model.md
  - migration-factory.md
  - drs-runbooks.md
  - state-backend.md
- runbooks/
  - drs-wave-runbook.md
  - rds-restore-test.md

Script: `create_repo_skeleton.ps1`
- Safe to re-run; will not overwrite existing files unless `-Force` is specified.
- Will create directories and skeleton files with a single newline or minimal content (no empty-string files).
- Prints status messages for each created file.

Usage (PowerShell):

  .\create_repo_skeleton.ps1 -RootPath 'C:\Users\Jarred Thomas\\.vscode\\hcs_lz_demo' [-Force]
