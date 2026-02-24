resource "hcs_vpc" "this" {
  name = "${var.name_prefix}-vpc"
  cidr = var.vpc_cidr
}

resource "hcs_vpc_subnet" "this" {
  name       = "${var.name_prefix}-subnet"
  cidr       = var.subnet_cidr
  gateway_ip = cidrhost(var.subnet_cidr, 1)
  vpc_id     = hcs_vpc.this.id

  # Note: HCS subnet resource supports DNS settings (optional).
  # If you want DNS later, we can add primary_dns/secondary_dns or dns_list.
}

resource "hcs_networking_secgroup" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Security group for ECS and RDS"
}

resource "hcs_networking_secgroup_rule" "ssh_in" {
  security_group_id = hcs_networking_secgroup.this.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.admin_ssh_cidr
}

resource "hcs_networking_secgroup_rule" "db_in_vpc" {
  security_group_id = hcs_networking_secgroup.this.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = var.db_port
  port_range_max    = var.db_port

  # Current behaviour: DB accessible from anywhere within the VPC CIDR.
  remote_ip_prefix  = var.vpc_cidr
}

resource "hcs_networking_secgroup_rule" "egress_all" {
  security_group_id = hcs_networking_secgroup.this.id
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = null
  remote_ip_prefix  = "0.0.0.0/0"
}