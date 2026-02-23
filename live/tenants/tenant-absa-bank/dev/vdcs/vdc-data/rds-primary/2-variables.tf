# Provider inputs
variable "region" {
  type        = string
  description = "Huawei Cloud region, for example af-south-1"
}

variable "project_id" {
  type        = string
  description = "Huawei Cloud Project ID for the target region"
}

variable "access_key" {
  type        = string
  description = "Huawei Cloud Access Key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Huawei Cloud Secret Key"
  sensitive   = true
}

# Naming
variable "name_prefix" {
  type        = string
  description = "Prefix used in resource names"
}

# AZs
variable "rds_primary_az" {
  type        = string
  description = "Primary AZ for RDS"
}

variable "rds_standby_az" {
  type        = string
  description = "Standby AZ for RDS"
}

# RDS settings
variable "db_engine" {
  type        = string
  description = "For example PostgreSQL or MySQL"
}

variable "db_engine_version" {
  type        = string
  description = "For example 13 (PostgreSQL) or 8.0 (MySQL)"
}

variable "db_flavor" {
  type        = string
  description = "RDS flavour name from console"
}

variable "db_password" {
  type        = string
  description = "Admin password for the database instance"
  sensitive   = true
}

variable "db_volume_type" {
  type        = string
  description = "For example CLOUDSSD"
}

variable "db_volume_size" {
  type        = number
  description = "Volume size in GB"
}

variable "backup_start_time" {
  type        = string
  description = "For example 02:00-03:00"
}

variable "backup_keep_days" {
  type        = number
  description = "Backup retention in days"
}

variable "vpc_az" {
  type        = string
  description = "Availability zone for ECS, e.g. af-south-1a"
}

variable "ecs_image_name" {
  type        = string
  description = "ECS image name, e.g. Ubuntu 24.04 server 64bit"
}

variable "ecs_flavor" {
  type        = string
  description = "ECS flavour, e.g. s6.large.2"
}

variable "ecs_keypair_name" {
  type        = string
  description = "Existing keypair name in this region"
}