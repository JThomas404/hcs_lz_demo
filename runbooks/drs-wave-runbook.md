# DRS Wave Runbook

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
This runbook defines operational steps for executing DRS migration waves with validation, cutover governance, and evidence collection.

## Real-World Business Value
Structured migration operations reduce business disruption, improve audit readiness, and increase confidence in phased migration delivery.

## Project Folder Structure
- Runbook path: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/runbooks/drs-wave-runbook.md&_a=contents
- DRS demo module: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/drs&_a=contents
- DRS dev stack: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/live/tenants/tenant-absa-bank/dev/vdcs/vdc-data/drs-primary&_a=contents

## Tasks and Implementation Steps
1. Preparation and pre-check execution, including naming guardrail compliance checks.
2. Full-load and CDC monitoring.
3. Validation gate and cutover readiness checks.
4. Cutover execution and post-cutover verification.
5. Evidence pack completion and sign-off.

Pre-check tag gate for DRS stacks:
- Required tags: owner, owner_name, ab_number, environment, project, db_type, data_classification, created_by, lifecycle
- Required values: project=HCS_DBaas_Migration and db_type=postgresql

## Core Implementation Breakdown
Preparation, validation, cutover, and recovery gates are documented as explicit operational checkpoints, with CI guardrails enforcing Terraform identifier standards and OPA policies enforcing deployed naming standards.

## IAM Role and Permissions
Runbook execution assumes role separation between operators, approvers, and pipeline identities with strict least-privilege enforcement.

## Project Features (Detailed Breakdown)
- Phase-gated migration workflow.
- Evidence-centric execution model.
- Clear rollback and accountability checkpoints.

## Design Decisions and Highlights
The wave model balances migration velocity against operational risk and prioritises validation-first sequencing.

## Errors Encountered and Resolved (optional)
Observed pipeline context gaps were addressed to ensure stack-aware apply behaviour and reproducible demo flow.

## Skills Demonstrated
- Migration operations planning.
- Reliability engineering mindset.

## Conclusion
The runbook provides a practical operational blueprint for DRS wave execution with governance, traceability, and controlled risk.