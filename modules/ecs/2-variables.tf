variable "name_prefix" { type = string }
variable "availability_zone" { type = string }
variable "subnet_id" { type = string }
variable "image_name" { type = string }
variable "flavor" { type = string }
variable "keypair_name" { type = string }
variable "security_group_id" { 
  type = string 
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources in this module"
  default     = {}
}