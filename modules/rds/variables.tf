variable "name_prefix" {
  type        = string
  description = "Prefix used in RDS resource naming"
}

variable "primary_az" {
  type        = string
  description = "Primary availability zone for the RDS instance"
}

variable "standby_az" {
  type        = string
  description = "Standby availability zone for high availability"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the RDS instance is deployed"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID used by the RDS instance"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID associated with the RDS instance"
}

variable "db_engine" {
  type        = string
  description = "Database engine type, for example PostgreSQL or MySQL"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version, for example 13"
}

variable "flavor" {
  type        = string
  description = "RDS flavor name"
}

variable "db_password" {
  type        = string
  description = "Administrator password for the database instance"
}

variable "volume_type" {
  type        = string
  description = "Storage volume type for the RDS instance"
}

variable "volume_size" {
  type        = number
  description = "Storage volume size in GB"
}

variable "backup_start_time" {
  type        = string
  description = "Backup window start time range, for example 02:00-03:00"
}

variable "backup_keep_days" {
  type        = number
  description = "Number of days to retain backups"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources in this module"
  default     = {}
}
