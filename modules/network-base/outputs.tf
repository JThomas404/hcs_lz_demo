output "vpc_id" {
  description = "ID of the created VPC, or null when create is false."
  value       = try(hcs_vpc.landing_zone[0].id, null)
}

output "subnet_ids" {
  description = "List of created private subnet IDs."
  value       = hcs_vpc_subnet.private_subnet[*].id
}
