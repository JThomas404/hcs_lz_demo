variable "create" {
  type    = bool
  default = false
}

variable "name" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "security_group_id" {
  type    = string
  default = null
}

variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "engine" {
  type    = string
  default = "PostgreSQL"
}

variable "engine_version" {
  type    = string
  default = "12"
}

variable "password" {
  type      = string
  default   = null
  sensitive = true
}

variable "flavor" {
  type    = string
  default = "rds.pg.n1.large.2"
}

variable "volume_type" {
  type    = string
  default = "ULTRAHIGH"
}

variable "volume_size" {
  type    = number
  default = 100
}

variable "backup_start_time" {
  type    = string
  default = "08:00-09:00"
}

variable "backup_keep_days" {
  type    = number
  default = 7
}

variable "tags" {
  type    = map(string)
  default = {}
}
