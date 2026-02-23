variable "region" {
  type        = string
  description = "Huawei Cloud region, e.g. af-south-1"
}

variable "project_id" {
  type        = string
  description = "Huawei Cloud Project ID"
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
  description = "Availability zone for subnet, e.g. af-south-1a"
}

variable "ecs_admin_cidr" {
  type        = string
  description = "CIDR allowed to SSH to the ECS instance, e.g. your_public_ip/32"
}

variable "db_port" {
  type        = number
  description = "Database port, e.g. 5432"
}

# Optional for later (silences warnings if present in tfvars)
variable "allowed_postgres_ips" {
  type        = list(string)
  description = "Guardrail list for DB access (not wired yet in network-base module)"
  default     = []
}
