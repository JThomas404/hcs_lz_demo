# Migration Factory

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
The migration factory defines a repeatable DRS/DSM-aligned approach for high-volume database migration waves with governance and operational controls.

## Real-World Business Value
Wave-based migration planning improves delivery predictability, reduces outage risk, and supports business-window alignment for critical services.

## Project Folder Structure
- DRS module: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/drs&version=GBjarred/lz-hardening-20260221&_a=contents
- DRS stacks: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live/tenants/tenant-absa-bank/dev/vdcs/vdc-data/drs-primary&version=GBjarred/lz-hardening-20260221&_a=contents
- Runbook: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/runbooks/drs-wave-runbook.md&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Defined migration lifecycle phases.
2. Aligned implementation with validation and evidence requirements.
3. Built demo-control workflow for DRS baseline resources.

## Core Implementation Breakdown
The model includes pre-checks, controlled replication cutover gates, post-cutover verification, and evidence collection integrated with CI/CD automation.

## IAM Role and Permissions
Execution relies on scoped operational and pipeline identities with explicit separation between deployment capability and review capability.

## Project Features (Detailed Breakdown)
- Wave-based migration model.
- Audit-oriented evidence outputs.
- Controlled progression gates.

## Design Decisions and Highlights
The design favours industrialised migration repeatability over ad-hoc one-off cutovers.

## Errors Encountered and Resolved (optional)
Demo pipeline and stack-context constraints were corrected to preserve reliable execution semantics.

## Conclusion
The migration factory provides a practical pattern for scaling database migration delivery while maintaining governance and operational confidence.