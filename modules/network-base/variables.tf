variable "create" {
  type    = bool
  default = false
}

variable "name" {
  type    = string
  default = null
}

variable "cidr" {
  type    = string
  default = null
}

variable "private_subnets" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
