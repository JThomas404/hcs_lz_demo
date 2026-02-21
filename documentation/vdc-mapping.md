# VDC Mapping and Stack Responsibilities

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
This document maps level-one landing-zone stacks and level-two VDC stacks to ownership and implementation responsibilities.

## Real-World Business Value
Clear stack mapping reduces ownership ambiguity and supports safer operational handover between platform and domain teams.

## Project Folder Structure
- Tenant stacks: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/tree/main/live/tenants/tenant-absa-bank
- DRS demo stack: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/tree/main/live/tenants/tenant-absa-bank/dev/vdcs/vdc-data/drs-primary

## Tasks and Implementation Steps
1. Defined landing-zone stack responsibilities.
2. Defined VDC workload stack responsibilities.
3. Added DRS demo stack mapping for migration demonstrations.

## Core Implementation Breakdown
Landing-zone stacks cover foundational controls, while VDC stacks cover domain and workload implementation, including data and migration paths.

## IAM Role and Permissions
Role boundaries should follow stack ownership, with least-privilege deployment rights aligned to owning teams and environments.

## Project Features (Detailed Breakdown)
- Ownership-oriented stack model.
- Environment parity support.
- Migration-path visibility via DRS stack mapping.

## Design Decisions and Highlights
The mapping model prioritises traceable ownership and operational segregation of concerns.

## Errors Encountered and Resolved (optional)
Structure and naming drift was resolved to preserve consistent environment stack patterns.

## Conclusion
The VDC mapping approach improves clarity, accountability, and delivery consistency for platform-scale operations.