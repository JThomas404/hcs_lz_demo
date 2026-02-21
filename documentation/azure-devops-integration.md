# Azure DevOps Integration

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
This document defines Azure DevOps pipeline integration for secure HCS deployment workflows, including variable management, environment gating, and artefact traceability.

## Real-World Business Value
The integration model improves deployment consistency, lowers manual error rates, and provides clear governance checkpoints before infrastructure changes reach target environments.

## Project Folder Structure
- Pipeline definitions: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/pipelines&_a=contents
- Pipeline templates: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/templates&_a=contents

## Tasks and Implementation Steps
1. Configured secure variable group usage for credentials.
2. Implemented validate/plan/apply/evidence stage templates.
3. Added environment-gated deployment behaviour.
4. Added Terraform identifier naming guardrail checks in validation.
5. Introduced checksum verification for tool binary downloads.

## Core Implementation Breakdown
Pipelines execute Terragrunt stack validation, enforce naming guardrails (snake_case Terraform identifiers and policy-based kebab-case deployed names), produce reusable plan artefacts, apply through controlled deployment stages, and publish evidence for audit review.

## IAM Role and Permissions
Deployment identities are scoped to required state and target resources. Credentials are provided through secure Azure DevOps variable groups and should not be hardcoded.

## Project Features (Detailed Breakdown)
- Stage template reuse.
- Fail-closed validation logic.
- Controlled apply context per stack path.
- Evidence publication for traceability.

## Design Decisions and Highlights
Template standardisation was selected to reduce duplication and preserve consistent controls across stack pipelines.

## Errors Encountered and Resolved (optional)
Pipeline context issues were resolved by ensuring apply stages receive explicit stack paths and correct artefact locations.

## Conclusion
The Azure DevOps integration establishes a secure and reproducible delivery baseline aligned with cloud platform governance requirements.