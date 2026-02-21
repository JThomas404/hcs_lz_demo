# Azure DevOps Integration: Secrets, Environments, and Locking

This document explains how to securely pass AK/SK to pipelines, configure environment approvals, and implement pipeline-level locking.

1) Secrets & variable groups
- Create a secure Variable Group in Azure DevOps named `hcs-credentials`.
- Add variables (secret) `TF_VAR_hcs_access_key` and `TF_VAR_hcs_secret_key` and enable "Keep this value secret".
- In pipeline YAML, reference the group under `variables:` or via library. Do not echo these variables in logs.

Example YAML snippet to include variable group:

variables:
  - group: hcs-credentials

2) Service connections
- Where supported, create an Azure DevOps Service Connection for HCS or use a self-hosted agent that has AK/SK injected from a secure vault.

3) Environment approvals & locking
- Create Azure DevOps Environments (`env-dev`, `env-non-prod`, `env-prod`) and configure approvals (pre-deployment) for non-prod/prod.
- To prevent concurrent applies against the same stack, use one of:
  - Environment deployment concurrency: set environment to allow only 1 deployment at a time; or
  - A pipeline-level semaphore: use a named lock file in OBS (created by pipeline) or use Azure Blob lease pattern to acquire exclusive lock before apply.

4) Evidence pack & artifact retention
- After `apply`, pipeline should collect:
  - `tfplan.json`, `tfplan` binary, apply logs, terragrunt logs, and metadata (run-id, approver, timestamp).
- Publish these as pipeline artifacts and upload a copy to OBS under `evidence/<tenant>/<env>/<vdc>/<stack>/<run-id>/` for long-term retention.

5) Runtime execution model
- Use ephemeral agents (hosted or container-based) started by pipeline; do not store long-lived credentials on the agent.
- Pipeline injects `TF_VAR_hcs_access_key` and `TF_VAR_hcs_secret_key`. Terragrunt/Terraform reads them as environment variables.
