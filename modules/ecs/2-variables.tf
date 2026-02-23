variable "name_prefix" { type = string }
variable "availability_zone" { type = string }
variable "subnet_id" { type = string }
variable "image_name" { type = string }
variable "flavor" { type = string }
variable "keypair_name" { type = string }

# Change this from security_group_name to security_group_id
variable "security_group_id" { 
  type = string 
}