variable "region" {
  type        = string
  description = "HCS region name, e.g. sa-global-1"
}

variable "cloud" {
  type        = string
  description = "HCS cloud endpoint/domain, e.g. db.absa.co.za"
}

variable "auth_url" {
  type        = string
  description = "IAM (Keystone) v3 URL, e.g. https://iam-apigateway-proxy.<region>.<cloud>/v3"
  default     = ""
}

variable "project_name" {
  type        = string
  description = "HCS project name (scope for resources)"
}

variable "domain_name" {
  type        = string
  description = "HCS domain/tenant name"
  default     = ""
}

# Prefer environment variables for AK/SK.
variable "access_key" {
  type        = string
  description = "HCS access key (avoid committing this; prefer HCS_ACCESS_KEY env var)"
  sensitive   = true
  default     = ""
}

variable "secret_key" {
  type        = string
  description = "HCS secret key (avoid committing this; prefer HCS_SECRET_KEY env var)"
  sensitive   = true
  default     = ""
}

variable "name_prefix" {
  type        = string
  description = "Prefix used in resource names"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR, e.g. 10.10.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR, e.g. 10.10.1.0/24"
}

variable "vpc_az" {
  type        = string
  description = "Availability zone for subnet, e.g. sa-global-1a"
}

variable "ecs_admin_cidr" {
  type        = string
  description = "CIDR allowed to SSH to the ECS instance, e.g. your_public_ip/32"
}

variable "db_port" {
  type        = number
  description = "Database port, e.g. 5432 for PostgreSQL"
}

# Tag inputs
variable "environment" {
  type        = string
  description = "Environment name, e.g. dev, non-prod, prod"
}

variable "owner_name" {
  type        = string
  description = "Owner's first name"
}

variable "ab_number" {
  type        = string
  description = "Owner AB number"
}