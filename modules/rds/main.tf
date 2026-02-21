resource "hcs_rds_instance" "this" {
  count             = var.create ? 1 : 0
  name              = var.name
  flavor            = var.flavor
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  availability_zone = var.availability_zones

  db {
    type     = var.engine
    version  = var.engine_version
    password = var.password
  }

  volume {
    type = var.volume_type
    size = var.volume_size
  }

  backup_strategy {
    start_time = var.backup_start_time
    keep_days  = var.backup_keep_days
  }

  tags = var.tags

  lifecycle {
    precondition {
      condition = !var.create || (
        var.name != null &&
        var.vpc_id != null &&
        var.subnet_id != null &&
        var.security_group_id != null &&
        var.password != null
      )
      error_message = "When create=true, name, vpc_id, subnet_id, security_group_id, and password must be provided."
    }
  }
}
