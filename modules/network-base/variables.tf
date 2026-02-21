variable "create" {
  description = "Controls whether VPC and subnets are created."
  type    = bool
  default = false
}

variable "name" {
  description = "Name of the VPC when create is true."
  type    = string
  default = null
}

variable "cidr" {
  description = "CIDR block for the VPC when create is true."
  type    = string
  default = null
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks to create inside the VPC."
  type    = list(string)
  default = []
}

variable "tags" {
  description = "Common tags applied to all resources in this module."
  type    = map(string)
  default = {}
}
