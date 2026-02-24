output "vpc_id" {
  value = hcs_vpc.this.id
}

output "subnet_id" {
  value = hcs_vpc_subnet.this.id
}

output "security_group_id" {
  value = hcs_networking_secgroup.this.id
}

output "security_group_name" {
  value = hcs_networking_secgroup.this.name
}