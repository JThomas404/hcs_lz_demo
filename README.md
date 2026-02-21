# ABSA HCS DBaaS Landing Zone and Automation Platform

## Table of Contents
- [Overview](#overview)
- [Real-World Business Value](#real-world-business-value)
- [Project Folder Structure](#project-folder-structure)
- [Tasks and Implementation Steps](#tasks-and-implementation-steps)
- [Core Implementation Breakdown](#core-implementation-breakdown)
- [IAM Role and Permissions](#iam-role-and-permissions)
- [Project Features (Detailed Breakdown)](#project-features-detailed-breakdown)
- [Design Decisions and Highlights](#design-decisions-and-highlights)
- [Errors Encountered and Resolved (optional)](#errors-encountered-and-resolved-optional)
- [Skills Demonstrated](#skills-demonstrated)
- [Conclusion](#conclusion)

## Overview
This repository delivers a Huawei Cloud Stack (HCS) landing zone and automation baseline managed through Terraform, Terragrunt, OPA guardrails, and Azure DevOps pipelines. The implementation is designed to support repeatable environment provisioning across dev, non-prod, and prod while maintaining governance, least-privilege controls, and auditable change management.

## Real-World Business Value
The implementation reduces delivery risk by standardising environment provisioning and policy enforcement before deployment. It enables platform teams to scale changes across environments without introducing uncontrolled drift.

## Project Folder Structure
- Repository root: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/README.md&_a=preview
- Live stacks: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live&_a=contents
- Terraform modules: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules&_a=contents
- Pipelines: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines&_a=contents
- Pipeline templates: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/templates&_a=contents
- Policies (OPA): https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/policy&_a=contents
- Documentation: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/documentation&_a=contents
- Runbooks: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/runbooks&_a=contents

## Tasks and Implementation Steps
1. Established environment parity for dev, non-prod, and prod stack topology.
2. Standardised Terragrunt backend behaviour and stack path conventions.
3. Implemented and hardened OPA guardrails for naming, tags, ingress, and egress.
4. Refined Azure DevOps pipeline templates for fail-closed execution and artefact integrity.
5. Added DRS demo module and environment stack wiring for reproducible demonstration.

## Core Implementation Breakdown
- Terragrunt orchestration: stack-level terragrunt.hcl files under live/ drive module execution and remote state handling.
- Modular Terraform: reusable modules under modules/ encapsulate network, RDS, KMS, OBS bucket, and DRS demo components.
- Guardrail enforcement: OPA policies are executed against generated plan JSON in validation stages.
- CI/CD flow: validate, plan, apply, and evidence stages are templated and reused across per-stack pipelines.

## Operational Status
- Supported deployment model: per-stack pipelines with explicit stack paths via pipelines/azure-pipelines-per-stack.yml (or wrapper variants).
- Run-all pipeline: intentionally disabled in pipelines/azure-pipelines-run-all.yml to prevent root-path Terragrunt execution.
- Production-ready path: DRS demo stacks are fully wired and validated through current CI templates.
- Needs completion before broad rollout: non-DRS stacks require explicit Terragrunt inputs to move from no-op defaults to deployable state.

## IAM Role and Permissions
The operating model follows least privilege by separating read-only engineering access from pipeline write access to state and deployment targets. Pipeline credentials are injected through Azure DevOps variable groups rather than hardcoded into code.

## Project Features (Detailed Breakdown)
- Multi-environment landing zone structure with aligned stack composition.
- Centralised backend and deterministic state key derivation.
- Policy-as-code integration in CI for naming, tags, and exposure controls.
- Fail-closed validation and apply behaviour.
- Evidence artefact publication for traceability.

## Design Decisions and Highlights
- Selected Terragrunt to improve composability and reduce repetitive backend/module wiring.
- Chosen policy gates in CI to prevent non-compliant infrastructure from reaching apply stages.
- Used template-driven Azure pipelines to preserve DRY patterns and simplify maintenance.
- Added checksum verification in tool installation paths to strengthen supply-chain assurance.

## Errors Encountered and Resolved (optional)
- Resolved environment naming drift by aligning staging to non-prod across stack paths and references.
- Corrected relative path depth issues in Terragrunt include/source entries after structure updates.
- Fixed pipeline template YAML and execution-context defects that prevented reliable plan/apply operations.

## Skills Demonstrated
- Infrastructure as Code: Terraform module design and Terragrunt orchestration.
- Cloud engineering: Huawei Cloud Stack resource patterns and state management.
- Secure delivery: least-privilege access model, guardrails, and credential hygiene.
- CI/CD engineering: Azure DevOps multi-stage YAML templates and artefact workflows.

## Conclusion
This repository demonstrates practical platform engineering capability across architecture, implementation, security controls, and operational documentation.