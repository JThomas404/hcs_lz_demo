output "vpc_id" {
  value = try(hcs_vpc.this[0].id, null)
}

output "subnet_ids" {
  value = hcs_vpc_subnet.private[*].id
}
