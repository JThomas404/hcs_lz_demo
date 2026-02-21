variable "create" {
  description = "Controls whether demo DRS control-plane resources are created."
  type    = bool
  default = false
}

variable "create_kms" {
  description = "Controls whether a demo KMS key is created for encryption."
  type    = bool
  default = true
}

variable "name_prefix" {
  description = "Prefix used to build demo resource names."
  type    = string
  default = "absa-drs-demo"
}

variable "evidence_bucket_name" {
  description = "Optional explicit name for the demo evidence OBS bucket."
  type    = string
  default = null
}

variable "tags" {
  description = "Common tags applied to demo resources created by this module."
  type    = map(string)
  default = {}
}
