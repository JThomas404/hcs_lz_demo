# Demo DRS stack deploys control-plane artifacts for migration workflow validation.
include "../../../../../../terragrunt.backend.hcl"

locals {
  tenant = "tenant-absa-bank"
  env    = "prod"
  vdc    = "vdc-data"
  stack  = "drs-primary"
  state_key = "${local.tenant}/${local.env}/${local.vdc}/${local.stack}/terraform.tfstate"
}

terraform {
  source = "../../../../../../../modules//drs"
}

inputs = {
  create               = true
  create_kms           = true
  name_prefix          = "absa-prod-data-drs"
  evidence_bucket_name = "absa-prod-data-drs-evidence"
  tags = {
    owner               = "platform-core"
    cost_center         = "CC1234"
    environment         = "prod"
    project             = "db-migration-dsm"
    data_classification = "internal"
    created_by          = "azdo-pipeline"
    lifecycle           = "migration-temp"
  }
}
