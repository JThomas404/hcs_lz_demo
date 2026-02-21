output "id" {
  value = try(hcs_rds_instance.this[0].id, null)
}

output "private_ips" {
  value = try(hcs_rds_instance.this[0].private_ips, [])
}

output "status" {
  value = try(hcs_rds_instance.this[0].status, null)
}
