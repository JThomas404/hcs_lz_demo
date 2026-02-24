locals {
  tags = {
    db_type             = "postgresql"
    data_classification = "internal"
    owner               = "RedM-CloudForgeX"
    owner_name          = var.owner_name
    ab_number           = var.ab_number
    environment         = var.environment
  }
}

module "network_base" {
  source = "../../../../../../../modules/network-base"

  name_prefix       = var.name_prefix
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.vpc_az

  admin_ssh_cidr = var.ecs_admin_cidr
  db_port        = var.db_port

  tags = local.tags
}