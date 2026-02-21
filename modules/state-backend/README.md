# State Backend Guidance

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
This directory documents state backend operating principles for Terragrunt/Terraform on OBS with immutable retention controls.

## Real-World Business Value
Reliable and auditable state management is critical for production automation, compliance evidence, and controlled recovery.

## Project Folder Structure
- Backend include file: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live/terragrunt.backend.hcl&version=GBjarred/lz-hardening-20260221&_a=contents
- Detailed notes: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/documentation/state-backend.md&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Standardised backend configuration in a shared include.
2. Centralised key derivation from stack-relative paths.
3. Removed duplicated per-stack backend blocks.

## Core Implementation Breakdown
Shared backend config defines bucket, region, encryption, and key derivation. Stack files include backend configuration and focus on module and input logic.

## IAM Role and Permissions
Pipeline identity should have scoped write/list/read for required state prefixes. Engineer identity should remain read/list only.

## Project Features (Detailed Breakdown)
- Deterministic state key generation.
- Encryption enabled by default.
- DRY backend implementation.

## Design Decisions and Highlights
Backend logic is centralised to reduce drift and simplify audit review across many stacks.

## Errors Encountered and Resolved (optional)
Per-stack remote state duplication was removed to eliminate inconsistent backend behaviour.

## Skills Demonstrated
- State governance design.
- Terragrunt backend orchestration.

## Conclusion
The backend approach provides reproducible, auditable, and maintainable state handling for multi-environment IaC operations.