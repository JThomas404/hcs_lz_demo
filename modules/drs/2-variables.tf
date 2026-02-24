/*
variable "name_prefix" {
  type = string
}

# DRS network mode: "eip" for public source (Supabase), "vpc" for private-to-private
variable "net_type" {
  type = string
}

# Source (Supabase PostgreSQL)
variable "source_db_host" {
  type = string
}

variable "source_db_port" {
  type = number
}

variable "source_db_user" {
  type = string
}

variable "source_db_password" {
  type      = string
  sensitive = true
}

variable "source_db_name" {
  type = string
}

variable "source_db_ssl_enabled" {
  type = bool
}


# Destination (HuaweiCloud RDS PostgreSQL)
variable "destination_region" {
  type = string
}

variable "destination_instance_id" {
  type = string
}

variable "destination_subnet_id" {
  type = string
}

variable "destination_db_ip" {
  type = string
}

variable "destination_db_port" {
  type = number
}

variable "destination_db_user" {
  type = string
}

variable "destination_db_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources in this module"
  default     = {}
}
*/