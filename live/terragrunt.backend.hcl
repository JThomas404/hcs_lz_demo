// Terragrunt backend configuration example for OBS (S3-compatible)
// Usage: include this file from per-stack `terragrunt.hcl` to standardize backend settings.

locals {
  obs_bucket = "absa-terraform-state-jnb"
  tenant     = "tenant-absa-bank"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = local.obs_bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "jnb"
    # key is derived from stack path relative to this include file.
    # Example: tenants/tenant-absa-bank/prod/vdcs/vdc-data/rds-primary/terraform.tfstate
    # Do NOT hardcode AK/SK here. Provide AK/SK at runtime via environment variables in pipelines.
    encrypt        = true
    skip_credentials_validation = true
  }
}

# Operational notes:
# - Ensure OBS bucket has Object Lock (WORM) enabled for required prefixes.
# - Configure OBS lifecycle/retention to keep state versions immutable according to compliance.
# - Use object prefixes matching the Terragrunt key convention so evidence packs and state are co-located.
