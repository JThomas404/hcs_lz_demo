locals {
  tags = merge(
    {
      db_type             = "postgresql"
      data_classification = "internal"
      owner               = "RedM-CloudForgeX"
      owner_name          = var.owner_name
      ab_number           = var.ab_number
      environment         = var.environment
    },
  )
}

data "terraform_remote_state" "core_network" {
  backend = "local"
  config = {
    path = "../../vdc-core/network-base/terraform.tfstate"
  }
}

module "rds" {
  source = "../../../../../../../modules/rds"

  name_prefix = var.name_prefix
  primary_az  = var.rds_primary_az
  standby_az  = var.rds_standby_az

  vpc_id            = data.terraform_remote_state.core_network.outputs.vpc_id
  subnet_id         = data.terraform_remote_state.core_network.outputs.subnet_id
  security_group_id = data.terraform_remote_state.core_network.outputs.security_group_id

  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  flavor            = var.db_flavor
  db_password       = var.db_password
  volume_type       = var.db_volume_type
  volume_size       = var.db_volume_size
  backup_start_time = var.backup_start_time
  backup_keep_days  = var.backup_keep_days
  tags              = local.tags
}

module "ecs" {
  source = "../../../../../../../modules/ecs"

  name_prefix       = var.name_prefix
  availability_zone = var.vpc_az

  subnet_id         = data.terraform_remote_state.core_network.outputs.subnet_id
  security_group_id = data.terraform_remote_state.core_network.outputs.security_group_id

  image_name   = var.ecs_image_name
  flavor       = var.ecs_flavor
  keypair_name = var.ecs_keypair_name
  tags         = local.tags

}