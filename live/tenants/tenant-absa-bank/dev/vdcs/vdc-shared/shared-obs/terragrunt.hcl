include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../../../modules//obs-bucket"
}

locals {
  environment = "dev"  # set per stack: dev/non-prod/prod
}

inputs = {
  environment = local.environment
  bucket      = "absa-drs-evidence-${local.environment}"
  acl         = "private"
  versioning  = true
  kms_key_id  = null  # set later from KMS if desired
  tags        = merge(include.root.locals.common_tags, { environment = local.environment })
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