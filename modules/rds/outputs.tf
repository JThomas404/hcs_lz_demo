output "id" {
  description = "Resource ID of the created RDS instance, or null when create is false."
  value       = try(hcs_rds_instance.primary[0].id, null)
}

output "private_ips" {
  description = "Private IP addresses of the created RDS instance."
  value       = try(hcs_rds_instance.primary[0].private_ips, [])
}

output "status" {
  description = "Provisioning status of the RDS instance."
  value       = try(hcs_rds_instance.primary[0].status, null)
}
