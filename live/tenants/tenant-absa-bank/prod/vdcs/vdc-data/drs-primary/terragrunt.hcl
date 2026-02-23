include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../../../modules//drs"
}

locals {
  environment = "prod"  # set per stack: dev/non-prod/prod
}

inputs = {
  environment          = local.environment
  create               = true   # set false if you just want to validate
  create_kms           = true
  name_prefix          = "absa-drs-${local.environment}"
  evidence_bucket_name = "absa-drs-evidence-${local.environment}"
  tags                 = merge(include.root.locals.common_tags, { environment = local.environment })
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      required_providers {
        hcs = {
          source  = "huaweicloud/hcs"
          version = "~> 2.4.0"
        }
      }
    }

    provider "hcs" {
      region = include.root.locals.region
      # Credentials come from env vars in the shell pipeline:
      # HCS_ACCESS_KEY / HCS_SECRET_KEY / HCS_PROJECT_ID
    }
  EOF
}