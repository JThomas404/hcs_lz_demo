# OBS IAM and Bucket Controls

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
This document captures OBS bucket and IAM guidance for secure Terraform state and evidence artefact storage.

## Real-World Business Value
A secure state backend model lowers operational risk, supports compliance, and improves incident recoverability.

## Project Folder Structure
- Backend include: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live/terragrunt.backend.hcl&_a=contents
- Backend notes: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/documentation/state-backend.md&_a=contents

## Tasks and Implementation Steps
1. Defined bucket and retention requirements.
2. Specified role separation for write and read-only access.
3. Aligned controls with pipeline-based state operations.

## Core Implementation Breakdown
State and evidence are stored in OBS with encryption and controlled access paths. Operational guidance supports immutable retention posture where available.

## IAM Role and Permissions
- Pipeline role: scoped write/list/read for required prefixes.
- Engineer role: list/read for diagnostics and review.
- Administrative role: audited emergency-only escalation.

## Project Features (Detailed Breakdown)
- Prefix-scoped access model.
- Encryption baseline.
- Audit-oriented storage patterns.

## Design Decisions and Highlights
The model separates duties to preserve least privilege while enabling CI/CD execution and operational troubleshooting.

## Errors Encountered and Resolved (optional)
No critical backend IAM design defects were identified after standardisation.

## Conclusion
The OBS IAM model establishes a secure storage foundation for state and evidentiary artefacts in automated cloud delivery.