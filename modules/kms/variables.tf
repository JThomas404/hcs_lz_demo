variable "key_alias" {
  description = "Alias for the KMS key (for example, alias/app-key)."
  type        = string
}

variable "key_description" {
  description = "Human-readable description for the KMS key."
  type        = string
  default     = ""
}

variable "pending_days" {
  description = "Number of days to wait before scheduled key deletion."
  type        = number
  default     = 7
}

variable "is_enabled" {
  description = "Whether the KMS key is enabled after creation."
  type        = bool
  default     = true
}

variable "key_usage" {
  description = "Intended usage of the key."
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "tags" {
  description = "Common tags applied to the KMS key resource."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Optional environment label propagated from stacks (e.g., dev/non-prod/prod)."
  type        = string
  default     = null
}
