# Network Base Module

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
This module provides foundational VPC and private subnet provisioning capabilities for landing-zone and VDC stack composition.

## Real-World Business Value
Network baseline standardisation prevents ad-hoc topology divergence and reduces security and routing misconfiguration risk.

## Project Folder Structure
- Module path: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/network-base&version=GBjarred/lz-hardening-20260221&_a=contents
- Main implementation: https://dev.azure.com/RedM-CloudEngineering/RedM-CloudForgeX/_git/platform-landingzone-iac?path=/modules/network-base/main.tf&version=GBjarred/lz-hardening-20260221&_a=contents

## Tasks and Implementation Steps
1. Defined VPC and subnet resources.
2. Added input controls and safe defaults.
3. Added outputs for integration and visibility.

## Core Implementation Breakdown
- VPC creation is controlled via create for safer demos.
- Subnet creation supports list-based private subnet modelling.
- Preconditions enforce key input presence when creation is enabled.

## IAM Role and Permissions
Requires only network resource permissions needed for VPC/subnet operations in target projects and environments.

## Project Features (Detailed Breakdown)
- Safe-by-default execution model.
- Tagged resources for governance.
- Reusable outputs for downstream modules.

## Design Decisions and Highlights
- Implemented create=false default to avoid accidental infrastructure changes during validation workflows.

## Errors Encountered and Resolved (optional)
- Resolved plan failures caused by missing required inputs by adding guarded creation logic.

## Skills Demonstrated
- Terraform resource modelling.
- Input validation and lifecycle preconditions.

## Conclusion
The module provides a robust baseline network primitive suitable for controlled environment rollout and future extension.