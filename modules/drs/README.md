# DRS Demo Module

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
This module implements a DRS/DSM demo control-plane pattern by composing KMS and OBS resources.

## Real-World Business Value
The demo enables stakeholders to validate migration governance workflows end-to-end before introducing full production migration complexity.

## Project Folder Structure
- Module path: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/drs&version=GBjarred/lz-hardening-20260221&_a=contents
- Main implementation: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/drs/main.tf&version=GBjarred/lz-hardening-20260221&_a=contents
- Demo stack path (dev): https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live/tenants/tenant-absa-bank/dev/vdcs/vdc-data/drs-primary&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Created module interface for demo toggles and naming.
2. Composed existing KMS and OBS modules for rapid implementation.
3. Wired environment stacks in dev, non-prod, and prod.
4. Integrated with pipeline templates and OPA checks.

## Core Implementation Breakdown
- Optional KMS key creation for encryption demonstration.
- Evidence bucket provisioning for migration artefact storage.
- Tag-driven governance compatibility with required-tags policies.

## IAM Role and Permissions
Requires scoped permissions for KMS key management and OBS bucket operations in the target project.

## Project Features (Detailed Breakdown)
- create and create_kms toggles for controlled behaviour.
- Environment-specific naming support.
- Outputs for integration and validation.

## Design Decisions and Highlights
Reused mature modules instead of writing new low-level resources for faster, safer delivery.

## Errors Encountered and Resolved (optional)
Initial stack integration required pipeline context adjustments for Terragrunt-based apply execution.

## Skills Demonstrated
- Module composition strategy.
- Delivery under scope constraints.

## Conclusion
This module provides a practical, reproducible DRS demo baseline suitable for technical review and controlled extension.