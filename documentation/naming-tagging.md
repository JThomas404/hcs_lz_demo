# Naming & Tagging Policy

This document defines the canonical naming and tagging conventions for ABSA's HCS DBaaS migration project. Implement these rules in modules, Terragrunt inputs, and enforce via OPA/Conftest in CI.

Global rules
- Style: lowercase, kebab-case (dash `-`). Allowed chars: a–z, 0–9, `-`.
- Regex (canonical): ^[a-z0-9]+(-[a-z0-9]+)*$
- Resource name limit: prefer ≤ 63 chars for cross-service compatibility.

Environment & tenant
- Tenant short code: `absa` or `absa-bank` for folder/ids.
- Environments: `dev`, `non-prod`, `preprod`, `prod`.
- Region code: `jnb` (Johannesburg).

VDC and stack naming
- VDCs (examples): `vdc-core`, `vdc-network`, `vdc-security`, `vdc-data`, `vdc-shared`.
- Stack path: `live/tenants/<tenant>/<env>/vdcs/<vdc>/<stack>/terragrunt.hcl`.

Resource name patterns
- Canonical: `<org>-<env>-<vdc>-<component>-<instance>`
  - Example: `absa-prod-data-rds-01`
- Use 2-digit numeric suffixes where needed (`01`,`02`).

Tagging
- Required tags (enforce via OPA):
  - `owner` : team or contact (example: `platform-core`)
  - `cost_center` : finance code (example: `CC1234`)
  - `environment` : `dev|non-prod|preprod|prod`
  - `project` : project id (example: `db-migration-dsm`)
  - `data_classification` : `public|internal|confidential|restricted`
  - `created_by` : `git-username` or pipeline id
  - `lifecycle` : `ephemeral|persistent|migration-temp`

OBS / state & artifact naming
- Terragrunt state key: `<tenant>/<env>/<vdc>/<stack_path>/terraform.tfstate`
- Plan artifact: `plans/<tenant>/<env>/<vdc>/<stack>/plan-<run-id>.bin`
- Evidence pack: `evidence/<tenant>/<env>/<vdc>/<stack>/<run-id>/`.

Per-service limits
- Keep a table in this doc for service-specific limits (example: RDS name ≤ 63, OBS object key length limits).

Automated checks
- Implement Conftest/OPA checks in PR validation:
  - Resource names match regex
  - Required tags present
  - No public DB ingress on DB ports
