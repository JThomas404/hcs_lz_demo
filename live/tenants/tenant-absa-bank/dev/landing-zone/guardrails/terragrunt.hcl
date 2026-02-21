include "../../../../../terragrunt.backend.hcl"

locals {
  tenant = "tenant-absa-bank"
  env    = "dev"
  vdc    = "landing-zone"
  stack  = "guardrails"
  state_key = "${local.tenant}/${local.env}/${local.vdc}/${local.stack}/terraform.tfstate"
}

terraform {
  source = "../../../../../../modules//network-base"
}

