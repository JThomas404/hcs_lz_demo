// Root Terragrunt settings shared by all stacks
locals {
  region      = "jnb"
  tenant      = "tenant-absa-bank"
  obs_bucket  = "absa-terraform-state-jnb"
  project     = "HCS_DBaas_Migration"

  common_tags = {
    project             = local.project
    tenant              = local.tenant
    db_type             = "postgresql"
    data_classification = "internal"
    created_by          = "terragrunt"
    lifecycle           = "persistent"
    owner               = "RedM-CloudForgeX"
    owner_name          = "Jarred"
    ab_number           = "AB044XP"
  }
}

remote_state {
  backend = "s3"
  config = {
    bucket                    = local.obs_bucket
    key                       = "${path_relative_to_include()}/terraform.tfstate"
    region                    = local.region
    encrypt                   = true
    skip_credentials_validation = true
  }
}
