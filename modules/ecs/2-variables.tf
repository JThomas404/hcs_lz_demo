variable "name_prefix" {
  type        = string
  description = "Prefix used in ECS resource naming"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone where the ECS instance is deployed"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID attached to the ECS instance network interface"
}

variable "image_name" {
  type        = string
  description = "Image name to use for the ECS instance"
}

variable "flavor" {
  type        = string
  description = "Compute flavor ID for the ECS instance"
}

variable "keypair_name" {
  type        = string
  description = "Existing key pair name used for SSH access"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID to associate with the ECS instance"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources in this module"
  default     = {}
}
