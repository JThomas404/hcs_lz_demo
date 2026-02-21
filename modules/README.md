# Terraform Modules

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
This directory contains reusable Terraform modules that implement core HCS building blocks and demo capabilities. Modules are consumed by Terragrunt stacks under live/.

## Real-World Business Value
Reusable modules reduce implementation variance, increase review quality, and accelerate onboarding.

## Project Folder Structure
- Modules root: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules&version=GBjarred/lz-hardening-20260221&_a=contents
- Network base: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/network-base&version=GBjarred/lz-hardening-20260221&_a=contents
- RDS: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/rds&version=GBjarred/lz-hardening-20260221&_a=contents
- KMS: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/kms&version=GBjarred/lz-hardening-20260221&_a=contents
- OBS bucket: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/obs-bucket&version=GBjarred/lz-hardening-20260221&_a=contents
- DRS demo: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/drs&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Defined module boundaries and input/output contracts.
2. Standardised provider/version constraints.
3. Added safe defaults to avoid accidental provisioning in demo paths.
4. Introduced DRS demo module for migration-control proof-of-concept.

## Core Implementation Breakdown
- network-base: VPC and subnet baseline patterns.
- rds: database instance resource model and outputs.
- kms: key management primitives for encryption use cases.
- obs-bucket: bucket and encryption integration support.
- drs: demo control-plane composition using KMS and OBS modules.

## IAM Role and Permissions
Modules are designed to run under scoped deployment identities. Runtime credentials are provided by pipeline-secured variable groups.

## Project Features (Detailed Breakdown)
- Composable module architecture.
- Shared version pinning.
- Input validation and safer defaults for demo execution.
- Output contracts that support stack-to-stack integration.

## Design Decisions and Highlights
- Kept modules narrowly focused to maintain low coupling.
- Favoured explicit outputs for observability and downstream use.

## Errors Encountered and Resolved (optional)
- Addressed incompatible stack inputs by aligning module contracts and stack wiring.

## Skills Demonstrated
- Terraform module engineering.
- Reuse-oriented design.
- Contract-first interface thinking.

## Conclusion
The module layer establishes a maintainable foundation for HCS platform delivery and demonstrates disciplined IaC engineering practices.