variable "name_prefix" {
  type        = string
  description = "Prefix used in VPC, subnet, and security group resource names"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the subnet created in the VPC"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone where the subnet resources are provisioned"
}

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
  description = "Tags applied to all resources in this module"
  default     = {}
}
