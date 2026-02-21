# Repository Structure and Generator

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
This document explains repository layout and the bootstrap script that creates a baseline project skeleton for consistent onboarding.

## Real-World Business Value
A predictable repository shape reduces onboarding time, enables standard review patterns, and improves automation reliability.

## Project Folder Structure
- Generator script: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/blob/main/scripts/create_repo_skeleton.ps1
- Documentation root: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/tree/main/documentation
- Live stacks: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/tree/main/live
- Modules: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/tree/main/modules

## Tasks and Implementation Steps
1. Defined target folder hierarchy for platform, policy, and delivery concerns.
2. Implemented safe rerun behaviour in bootstrap script.
3. Updated script outputs to align with documentation/ path.

## Core Implementation Breakdown
The repository is segmented by function: module code, environment stacks, pipeline automation, policy controls, and technical documentation.

## IAM Role and Permissions
Repository structure supports role separation by isolating deployable stack paths from policy and automation templates.

## Project Features (Detailed Breakdown)
- Deterministic folder conventions.
- Scripted bootstrap and regeneration support.
- Clear mapping between architecture and source layout.

## Design Decisions and Highlights
The structure favours maintainability and auditability over compactness, which improves long-term ownership and governance.

## Errors Encountered and Resolved (optional)
Updated path references after docs-to-documentation naming consolidation.

## Conclusion
The repository model supports reproducible engineering workflows and coherent technical communication across teams.