# Azure DevOps Pipelines

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
This directory contains Azure DevOps pipeline entry points for per-stack deployment, run-all orchestration, stack-wrapper templates, and DRS demo execution.

## Real-World Business Value
The pipeline model standardises delivery quality by enforcing validation, policy checks, plan artefacts, and controlled apply steps.

## Project Folder Structure
- Per-stack pipeline: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines/azure-pipelines-per-stack.yml&version=GBjarred/lz-hardening-20260221&_a=contents
- Run-all pipeline: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines/azure-pipelines-run-all.yml&version=GBjarred/lz-hardening-20260221&_a=contents
- Stack wrapper pipeline: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines/azure-pipelines-stack-wrapper.yml&version=GBjarred/lz-hardening-20260221&_a=contents
- DRS demo pipeline: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines/azure-pipelines-drs-demo.yml&version=GBjarred/lz-hardening-20260221&_a=contents
- Shared templates: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/templates&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Defined reusable stage templates for validate, plan, apply, and evidence.
2. Implemented fail-closed behaviour in critical stages.
3. Added checksum verification for tool download integrity.
4. Added demo-safe trigger controls to prevent noisy non-demo executions.

## Core Implementation Breakdown
Validate stage enforces formatting, Terragrunt validation, and OPA policy checks. Plan stage generates reusable artefacts. Apply stage executes gated deployment with stack-specific context. Evidence stage publishes traceability artefacts.

## IAM Role and Permissions
Pipeline credentials are injected via secure variable groups (hcs-credentials) and should be scoped with least privilege for state and target resources.

## Project Features (Detailed Breakdown)
- Template-driven multi-pipeline consistency.
- Environment-gated apply patterns.
- Security-aware credential handling.
- Demo-targeted DRS pipeline path.

## Design Decisions and Highlights
Selected Azure DevOps templates to preserve DRY principles and simplify policy-aligned scaling.

## Errors Encountered and Resolved (optional)
Corrected apply stage path context and artefact handling for Terragrunt stack applies.

## Skills Demonstrated
- Azure DevOps YAML engineering.
- CI/CD hardening and supply-chain checks.

## Conclusion
The pipeline implementation demonstrates practical production-minded CI/CD discipline with clear pathways for both demonstration and operational scale.