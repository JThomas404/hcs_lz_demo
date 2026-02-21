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
1. Defined naming split: Terraform identifiers use snake_case, deployed resource names use kebab-case.
2. Standardised descriptive Terraform resource local names (avoid generic labels like this/main/default).
3. Specified mandatory tag keys for governance.
4. Implemented policy and pipeline guardrail checks in CI validation stages.

## Core Implementation Breakdown
Naming patterns are enforced through regex controls and required tag checks in OPA against plan JSON, plus a CI guardrail script for Terraform identifier conventions.

Terraform identifier standard (snake_case):
- Applies to resource local names, module names, variable names, and output names.
- Rule of thumb:
	- Single core resource in module: primary is acceptable.
	- Resource has business meaning: use that meaning (better than main).
	- Multiple same-type resources: include scope/role (for example: private_app, private_data, replica_dr).
- Examples:
	- resource "hcs_vpc" "landing_zone"
	- resource "hcs_vpc_subnet" "private_app"
	- resource "hcs_rds_instance" "primary"
	- resource "hcs_obs_bucket" "evidence"
	- resource "hcs_kms_key" "data_encryption"

Deployed resource naming standard (kebab-case):
- Applies to runtime values such as name, bucket, and key_alias suffixes.
- Expected pattern: lowercase letters and numbers separated by hyphens.

## IAM Role and Permissions
Tagging and naming controls are enforced at pipeline level and should be backed by least-privilege deployment identities.

## Project Features (Detailed Breakdown)
- Deterministic naming controls.
- Mandatory governance metadata.
- Pipeline-integrated enforcement.
- Guardrails for both code-level naming and deployed resource naming.

## Design Decisions and Highlights
The standard prioritises machine-validated consistency to reduce drift across teams and environments.

## Errors Encountered and Resolved (optional)
Policy logic was adjusted to support nested child-module resources and plan-aware evaluation, and CI guardrails were added to block non-compliant Terraform identifiers.

## Conclusion
These standards provide a practical governance baseline for scalable cloud platform delivery.