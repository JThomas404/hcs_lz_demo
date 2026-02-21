# Policy-as-Code (OPA)

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
This directory contains OPA policies used by CI/CD validation stages to enforce naming standards, mandatory tagging, and network exposure restrictions.

## Real-World Business Value
Policy gates shift compliance and security checks left, reducing the risk and cost of post-deployment remediation.

## Project Folder Structure
- Policies root: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/tree/main/policy/opa
- Required tags policy: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/blob/main/policy/opa/required-tags.rego
- Name regex policy: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/blob/main/policy/opa/name-regex.rego
- Public ingress policy: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/blob/main/policy/opa/deny-public-ingress.rego
- Public egress policy: https://github.com/RedM-CloudEngineering/platform-landingzone-iac/blob/main/policy/opa/deny-public-egress.rego

## Tasks and Implementation Steps
1. Implemented baseline policy rules for governance and exposure control.
2. Integrated policy checks into validate stage execution.
3. Extended policy evaluation to recurse into child modules.

## Core Implementation Breakdown
Naming policy enforces deterministic resource naming patterns. Tagging policy enforces mandatory ownership and classification metadata. Ingress and egress policies block public exposure patterns.

## IAM Role and Permissions
Policies operate in CI and require no additional cloud privileges; enforcement is tied to pipeline execution permissions.

## Project Features (Detailed Breakdown)
- Plan-aware policy evaluation.
- Recursive module support.
- Guardrails aligned to platform governance principles.

## Design Decisions and Highlights
Chosen OPA/Conftest integration for portability, testability, and readable policy intent.

## Errors Encountered and Resolved (optional)
Adjusted policy structures to align with Terraform plan JSON shape and nested module traversal.

## Skills Demonstrated
- Policy-as-code design.
- CI security integration.

## Conclusion
The policy layer provides enforceable, repeatable governance controls that complement IaC and CI/CD practices.