variable "create" {
  type    = bool
  default = false
}

variable "create_kms" {
  type    = bool
  default = true
}

variable "name_prefix" {
  type    = string
  default = "absa-drs-demo"
}

variable "evidence_bucket_name" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
