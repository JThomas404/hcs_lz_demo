variable "bucket" {
  description = "Name of the OBS bucket to create."
  type        = string
}

variable "acl" {
  description = "Canned ACL to apply to the OBS bucket."
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enables versioning on the OBS bucket."
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "Optional KMS key ID for bucket encryption."
  type        = string
  default     = null
}

variable "tags" {
  description = "Common tags applied to the OBS bucket resource."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Optional environment label propagated from stacks (e.g., dev/non-prod/prod)."
  type        = string
  default     = null
}
