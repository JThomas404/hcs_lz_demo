variable "name_prefix" { type = string }
variable "vpc_cidr" { type = string }
variable "subnet_cidr" { type = string }
variable "availability_zone" { type = string }

variable "admin_ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH into ECS"
}

variable "db_port" {
  type        = number
  description = "Database port to allow inbound within the VPC CIDR"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all supported resources"
  default     = {}
}