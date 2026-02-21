variable "key_alias" {
  type = string
}

variable "key_description" {
  type    = string
  default = ""
}

variable "pending_days" {
  type    = number
  default = 7
}

variable "is_enabled" {
  type    = bool
  default = true
}

variable "key_usage" {
  type    = string
  default = "ENCRYPT_DECRYPT"
}

variable "tags" {
  type    = map(string)
  default = {}
}
