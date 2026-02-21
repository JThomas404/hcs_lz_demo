variable "create" {
  description = "Controls whether the RDS instance is created."
  type    = bool
  default = false
}

variable "name" {
  description = "Name of the RDS instance when create is true."
  type    = string
  default = null
}

variable "vpc_id" {
  description = "VPC ID where the RDS instance is deployed."
  type    = string
  default = null
}

variable "subnet_id" {
  description = "Subnet ID where the RDS instance is deployed."
  type    = string
  default = null
}

variable "security_group_id" {
  description = "Security group ID attached to the RDS instance."
  type    = string
  default = null
}

variable "availability_zones" {
  description = "Availability zone list for the RDS instance deployment."
  type    = list(string)
  default = []
}

variable "engine" {
  description = "Database engine type."
  type    = string
  default = "PostgreSQL"
}

variable "engine_version" {
  description = "Database engine version."
  type    = string
  default = "12"
}

variable "password" {
  description = "Administrator password for the database instance."
  type      = string
  default   = null
  sensitive = true
}

variable "flavor" {
  description = "RDS compute flavor to provision."
  type    = string
  default = "rds.pg.n1.large.2"
}

variable "volume_type" {
  description = "Storage volume type used by the RDS instance."
  type    = string
  default = "ULTRAHIGH"
}

variable "volume_size" {
  description = "Storage size in GB for the RDS instance volume."
  type    = number
  default = 100
}

variable "backup_start_time" {
  description = "Backup window start time range."
  type    = string
  default = "08:00-09:00"
}

variable "backup_keep_days" {
  description = "Number of days to retain automated backups."
  type    = number
  default = 7
}

variable "tags" {
  description = "Common tags applied to the RDS instance resource."
  type    = map(string)
  default = {}
}
