**State & Backend Implementation Notes**

- Use an OBS bucket with object lock (WORM) to enforce append-only state history. Configure prefixes per tenant/env/vdc/stack.
- Terragrunt key convention:

  <tenant>/<env>/<vdc>/<stack_path>/terraform.tfstate

- Terragrunt example (include shared backend then compute key per-stack):

  include "../../terragrunt.backend.hcl"

  locals {
    tenant = "tenant-absa-bank"
    env    = "prod"
    vdc    = "vdc-data"
    stack  = "rds-primary"
    state_key = "${local.tenant}/${local.env}/${local.vdc}/${local.stack}/terraform.tfstate"
  }

  remote_state {
    backend = "s3"
    config = {
      bucket = "absa-terraform-state-jnb"
      key    = local.state_key
      region = "jnb"
      encrypt = true
    }
  }

- WORM semantics: Configure OBS object lock to append-only and immutable retention. Terraform writes new state versions (PUT). WORM prevents deletion or modification of previous versions, while allowing new versions to be added.

Recommended access controls:
- Create a pipeline service account (AK/SK) scoped to the OBS prefixes used by Terraform. Grant PUT/GET/LIST to those prefixes.
- Create an engineers read-only role that has GET/LIST only.
- Keep an admin break-glass credential in an audited vault and require just-in-time elevation.

Notes on Terraform and WORM:
- Terraform writes state by PUTting object versions. WORM prevents deletion or modification of previous versions, while allowing new versions to be added. Keep lifecycle and retention policy aligned with compliance.
