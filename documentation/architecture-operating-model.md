# Architecture and Operating Model

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
- [Conclusion](#conclusion)

## Overview
The architecture implements a landing-zone-first delivery model on Huawei Cloud Stack using Terraform and Terragrunt, with Azure DevOps pipelines for controlled automation and OPA for policy enforcement.

## Real-World Business Value
This model enables predictable multi-environment rollout, reduces operational drift, and strengthens governance traceability across platform changes.

## Project Folder Structure
- Landing zone stacks: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live&version=GBjarred/lz-hardening-20260221&_a=contents
- Modules: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules&version=GBjarred/lz-hardening-20260221&_a=contents
- Pipelines: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines&version=GBjarred/lz-hardening-20260221&_a=contents
- Policies: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/policy&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Established landing-zone and VDC stack topology.
2. Implemented central backend configuration.
3. Integrated policy checks into CI stages.
4. Added demo-capable DRS control-plane workflow.

## Core Implementation Breakdown
Platform baseline is delivered through reusable modules and environment-specific Terragrunt stacks. CI pipelines enforce validation, planning, and controlled application through gated stages.

## IAM Role and Permissions
The platform follows least privilege by separating pipeline deployment access from read-only engineering access and audited break-glass administration.

## Project Features (Detailed Breakdown)
- Environment parity across dev, non-prod, and prod.
- Policy-enforced change validation.
- Evidence artefact generation for audit support.
- Demo-safe execution controls for controlled demonstrations.

## Design Decisions and Highlights
Key decisions prioritised deterministic state management, reusable pipeline templates, and guardrail-driven security posture.

## Errors Encountered and Resolved (optional)
Renaming and path-depth issues were resolved through Terragrunt include/source correction and structure normalisation.

## Conclusion
The operating model demonstrates production-oriented cloud engineering discipline with clear ownership boundaries and automation controls.