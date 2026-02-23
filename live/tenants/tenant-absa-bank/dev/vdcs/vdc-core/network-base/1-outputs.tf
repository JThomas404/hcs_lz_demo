output "vpc_id" {
  value = module.network_base.vpc_id
}

output "subnet_id" {
  value = module.network_base.subnet_id
}

output "security_group_id" {
  value = module.network_base.security_group_id
}

output "security_group_name" {
  value = module.network_base.security_group_name
}