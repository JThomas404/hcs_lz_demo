output "vpc_id" {
  value = huaweicloud_vpc.this.id
}

output "subnet_id" {
  value = huaweicloud_vpc_subnet.this.id
}

output "security_group_id" {
  value = huaweicloud_networking_secgroup.this.id
}

output "security_group_name" {
  value = huaweicloud_networking_secgroup.this.name
}