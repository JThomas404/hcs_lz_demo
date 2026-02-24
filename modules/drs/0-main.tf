/*
resource "hcs_drs_job" "this" {
  name        = "${var.name_prefix}-drs"
  type        = "sync"
  engine_type = "postgresql"
  direction   = "up"
  net_type    = var.net_type

  # Optional but recommended for public-to-cloud jobs.
  migration_type = "FULL_INCR_TRANS"

  description = "DRS PostgreSQL sync (Supabase -> HuaweiCloud RDS) via Terraform"

  source_db {
    engine_type = "postgresql"
    ip          = var.source_db_host
    port        = var.source_db_port
    user        = var.source_db_user
    password    = var.source_db_password
    ssl_enabled = var.source_db_ssl_enabled
  }

  destination_db {
    engine_type = "postgresql"
    region      = var.destination_region
    ip          = var.destination_db_ip
    port        = var.destination_db_port
    user        = var.destination_db_user
    password    = var.destination_db_password
    instance_id = var.destination_instance_id
    subnet_id   = var.destination_subnet_id
    tags = var.tags
  }

  # Sync exactly one database (DRS "sync" requires a level selection).
  databases = [var.source_db_name]

  # Prevent accidental secret drift from forcing replacement.
  lifecycle {
    ignore_changes = [
      source_db[0].password,
      destination_db[0].password,
    ]
  }
}
*/
