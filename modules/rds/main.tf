resource "huaweicloud_rds_instance" "this" {
  name                = "${var.name_prefix}-rds"
  flavor              = var.flavor
  ha_replication_mode = "async"

  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id

  availability_zone = [var.primary_az, var.standby_az]


  db {
    type     = var.db_engine
    version  = var.db_engine_version
    password = var.db_password
  }

  volume {
    type = var.volume_type
    size = var.volume_size
  }

  backup_strategy {
    start_time = var.backup_start_time
    keep_days  = var.backup_keep_days
  }
}