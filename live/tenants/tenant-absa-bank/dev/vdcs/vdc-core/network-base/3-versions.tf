terraform {
  required_version = ">= 1.5.0"

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/hcs"
      version = "~> 1.86.0"
    }
  }
}