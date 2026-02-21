include "../../../../../../terragrunt.backend.hcl"

locals {
  tenant = "tenant-absa-bank"
  env    = "non-prod"
  vdc    = "vdc-shared"
  stack  = "shared-obs"
  state_key = "${local.tenant}/${local.env}/${local.vdc}/${local.stack}/terraform.tfstate"
}

terraform {
  source = "../../../../../../../modules//network-base"
}

