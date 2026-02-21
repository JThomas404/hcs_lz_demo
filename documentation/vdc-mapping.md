# VDC Mapping and Stack Responsibilities

This document maps Level-1 `landing-zone` stacks and Level-2 VDC/resource-space stacks to their intended responsibilities and example `live/` paths.

Level-1 — Landing Zone (owner: platform/security)
- landing-zone/landing-zone-foundation: initial bootstrap resources (service accounts, initial VPCs for control plane)
  - Path: `live/tenants/tenant-absa-bank/<env>/landing-zone/landing-zone-foundation/terragrunt.hcl`
- landing-zone/guardrails: policy distribution, OPA bundles, Conftest integration
  - Path: `.../landing-zone/guardrails/terragrunt.hcl`
- landing-zone/logging-audit: central audit sinks, bucket configuration, retention
  - Path: `.../landing-zone/logging-audit/terragrunt.hcl`
- landing-zone/shared-obs: OBS buckets for terraform state, evidence packs and artifact storage
  - Path: `.../landing-zone/shared-obs/terragrunt.hcl`

Level-2 — VDCs / Resource-Spaces (owner: domain/platform teams)
- `vdc-core`: core platform services (IDP integration, central IAM roles, transit-lite components)
  - Example stack: `.../vdcs/vdc-core/network-base/terragrunt.hcl`
- `vdc-network`: networking components (transit gateways, Direct Connect attachments)
  - Example stack: `.../vdcs/vdc-network/transit/terragrunt.hcl`
- `vdc-security`: security constructs (central security groups, IDS/IPS, security automation)
  - Example stack: `.../vdcs/vdc-security/guardrails/terragrunt.hcl`
- `vdc-data`: data workloads (RDS instances, DSM migration controllers, backups)
  - Example stack: `.../vdcs/vdc-data/rds-primary/terragrunt.hcl`
- `vdc-shared`: shared runtime services consumed by multiple domains (DNS, observability, logging, migration dashboard)
  - Example stacks:
    - `.../vdcs/vdc-shared/dns/terragrunt.hcl`
    - `.../vdcs/vdc-shared/shared-obs/terragrunt.hcl`
    - `.../vdcs/vdc-shared/prometheus/terragrunt.hcl`

State key convention (Terragrunt)
- `<tenant>/<env>/<vdc>/<stack>/terraform.tfstate`

Notes
- Keep security-related controls (security groups, network ACLs) inside `vdc-security` or per-VDC security stacks — do not place DB security groups in `vdc-shared`.
- Central observability and DNS live in `vdc-shared` so evidence, metrics and DNS cutovers are centrally managed.
