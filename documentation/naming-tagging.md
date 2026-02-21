# Naming and Tagging Standards

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
This document defines canonical naming and tagging controls used by Terraform modules, Terragrunt stacks, and OPA guardrails.

## Real-World Business Value
Standard naming and metadata labelling improve governance reporting, ownership clarity, and cost attribution.

## Project Folder Structure
- Tag policy: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/policy/opa/required-tags.rego&_a=contents
- Name policy: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/policy/opa/name-regex.rego&_a=contents

## Tasks and Implementation Steps
1. Defined lowercase kebab-case conventions.
2. Specified mandatory tag keys for governance.
3. Implemented policy checks in CI validation stages.

## Core Implementation Breakdown
Naming patterns are enforced through regex controls and required tag checks in OPA against plan JSON.

## IAM Role and Permissions
Tagging and naming controls are enforced at pipeline level and should be backed by least-privilege deployment identities.

## Project Features (Detailed Breakdown)
- Deterministic naming controls.
- Mandatory governance metadata.
- Pipeline-integrated enforcement.

## Design Decisions and Highlights
The standard prioritises machine-validated consistency to reduce drift across teams and environments.

## Errors Encountered and Resolved (optional)
Policy logic was adjusted to support nested child-module resources and plan-aware evaluation.

## Conclusion
These standards provide a practical governance baseline for scalable cloud platform delivery.