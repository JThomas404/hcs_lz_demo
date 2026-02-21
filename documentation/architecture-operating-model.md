**Architecture & Operating Model**

Overview
- Target: ABSA DBaaS Landing Zone on Huawei Cloud Stack (HCS), Region: Johannesburg, multi-AZ.
- IaC: Terraform (provider: huaweicloud/hcs) managed by Terragrunt.
- CI/CD: Azure DevOps Pipelines (per-stack and run-all patterns). Applies executed only by pipelines (pipeline identity has write state).
- Remote state: OBS (S3-compatible) bucket with WORM (append-only, immutable versions).

1) Landing-zone layers

- Level-1: Tenant Baseline
  - Foundation: VPC/VDC bootstrapping, core networking constructs, AZ mapping.
  - Guardrails: Policy enforcement points, OPA rules, baseline network-security groups.
  - Logging / Audit: Central OBS sinks, audit trails, retention policies and evidence packaging.
  - Shared Services: DNS; shared OBS; central NTP; monitoring (Prometheus pushgateway / scrape targets).

- Level-2: VDCs / Resource-Spaces
  - Domain partitions: each business domain gets isolated VPC/resource-space.
  - Topology: Default to independent VPCs per domain (independent VPC topology). Hub/spoke is an option; pending confirmation.
  - Each VDC contains networking, connectivity (Direct Connect), egress patterns, and per-VDC guardrails.

2) State & backend model (OBS S3 + WORM)

- Backend: OBS bucket with path layout used as Terragrunt key naming convention:

  <tenant>/<env>/<stack_path>/terraform.tfstate

- WORM semantics: Configure OBS object lock to append-only and immutable retention. Terraform writes new state versions (PUT). Deletions or direct overwrites are prevented by WORM policy.
- Access model:
  - Pipeline identity: PUT/POST to OBS prefixes (write new state versions), LIST/GET for plan artifacts.
  - Engineers: GET / LIST only for the state prefixes (read-only access). No direct apply capability.
  - Admin/Break-glass: Separate credential with strict logging and time-limited access policies.
- Audit & evidence:
  - Each pipeline run publishes an evidence pack (plan artifact, plan output, apply logs, state snapshot metadata). State versions are immutable and can be referenced as evidence.

3) CI/CD operating model (GitFlow + PR plan + gated apply)

- Branching: GitFlow (feature branches → develop → release → main). Protect `main`.
- PR Validation:
  - Steps: `terraform fmt` → `terragrunt hclfmt` → terraform validate → security/static-lint → policy-as-code (OPA/Conftest) → terragrunt plan → publish plan artifact.
  - PR must include a plan artifact for review. Plans are generated in the ephemeral pipeline agent.
- Main branch / Release apply:
  - Approval Gate: Azure DevOps Environment approval (configurable approvers per env).
  - Locking: Pipeline-level exclusive execution (see pipeline-level locking below). Only pipeline identity performs `apply` using the published plan artifact.
- Pipeline patterns:
  - Per-stack (recommended at scale): Pipelines run per `live/.../<stack>` directory, triggered by path filters. Small blast radius, parallelizable.
  - Run-all (coordinated): Pipeline that runs a pre-configured set of stacks (bootstrap, global changes) — used for infra-wide breaking changes and controlled windows.

4) Guardrails

- Enforceable guardrails via policy-as-code (OPA) and CI checks:
  - Required tags & naming: fail PR if missing required tags (cost center, owner, environment, classification).
  - Security group baseline: default deny; explicit allow rules require an exception ticket + approval.
  - Public exposure: deny public ingress for DB ports by default.
  - IAM separation: pipeline identities (write), engineers (read-only), admins (break-glass). Use scoped AK/SK injection at pipeline runtime.
  - Change control: PRs with plan artifacts, reviewers + approvers, approvals in pipeline environment before `apply`.

- Policy lifecycle: start warn-only in dev → blocking in non-prod/prod.

5) Observability

- Components: Prometheus (internal) for metrics collection; Alertmanager + Grafana for dashboards & alerts.
- Integration points:
  - Exporters per DB engine (Postgres exporter, MySQL exporter) on migration workers and target RDS hosts.
  - DRS replication metrics (CDC lag) scraped and alerted.
  - Prometheus job per VDC; central federation or remote-write to central Prometheus for cross-VDC queries.
- Baseline dashboards & alerts:
  - DB health: CPU, memory, connections, free space.
  - Replication: CDC lag, apply delay.
  - Migration pipeline: per-migration job status, failures, audit trail.
