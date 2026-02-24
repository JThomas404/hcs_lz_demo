resource "huaweicloud_vpc" "this" {
  name = "${var.name_prefix}-vpc-demo"
  cidr = var.vpc_cidr
  tags = var.tags
}

resource "huaweicloud_vpc_subnet" "this" {
  name       = "${var.name_prefix}-subnet"
  cidr       = var.subnet_cidr
  gateway_ip = cidrhost(var.subnet_cidr, 1)
  vpc_id     = huaweicloud_vpc.this.id

  availability_zone = var.availability_zone
  tags = var.tags
}

resource "huaweicloud_networking_secgroup" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Security group for ECS and RDS test build"
  tags = var.tags
}

resource "huaweicloud_networking_secgroup_rule" "ssh_in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.admin_ssh_cidr
  security_group_id = huaweicloud_networking_secgroup.this.id
  
}

resource "huaweicloud_networking_secgroup_rule" "db_in_vpc" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = var.db_port
  port_range_max    = var.db_port
  remote_ip_prefix  = var.vpc_cidr
  security_group_id = huaweicloud_networking_secgroup.this.id
}

resource "huaweicloud_networking_secgroup_rule" "egress_all" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = null
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.this.id
}