variable "name_prefix" { type = string }
variable "primary_az" { type = string }
variable "standby_az" { type = string }
variable "vpc_id" { type = string }
variable "subnet_id" { type = string }
variable "security_group_id" { type = string }
variable "db_engine" { type = string }
variable "db_engine_version" { type = string }
variable "flavor" { type = string }
variable "db_password" { type = string }
variable "volume_type" { type = string }
variable "volume_size" { type = number }
variable "backup_start_time" { type = string }
variable "backup_keep_days" { type = number }

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources in this module"
  default     = {}
}