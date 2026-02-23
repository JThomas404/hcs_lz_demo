env    = "dev"
tenant = "tenant-absa-bank"
core_state_path = "../vdc-core/network-base/terraform.tfstate"

vdcs = {
  vdc-core = {
    name_prefix       = "absa-dev-core"
    vpc_cidr          = "10.10.0.0/16"
    subnet_cidr       = "10.10.1.0/24"
    availability_zone = "af-johannesburg-1a"
    admin_ssh_cidr    = "X.X.X.X/32"
  }

  vdc-data = {
    name_prefix       = "absa-dev-data"
    vpc_cidr          = "10.20.0.0/16"
    subnet_cidr       = "10.20.1.0/24"
    availability_zone = "af-johannesburg-1a"
    admin_ssh_cidr    = "X.X.X.X/32"
  }

  vdc-shared = {
    name_prefix       = "absa-dev-shared"
    vpc_cidr          = "10.30.0.0/16"
    subnet_cidr       = "10.30.1.0/24"
    availability_zone = "af-johannesburg-1a"
    admin_ssh_cidr    = "X.X.X.X/32"
  }
}

vdc-data = {
    name_prefix = "absa-dev-data"

    vpc_cidr    = "10.20.0.0/16"
    subnet_cidr = "10.20.1.0/24"
    vpc_az      = "af-johannesburg-1a"

    ecs_admin_cidr       = "X.X.X.X/32"
    allowed_postgres_ips = ["10.0.0.0/8"]
    db_port              = 5432

    ecs_flavor       = "s6.large.2"
    ecs_image_name   = "REPLACE_ME_IMAGE_NAME"
    ecs_keypair_name = "REPLACE_ME_KEYPAIR"

    rds_primary_az    = "af-johannesburg-1a"
    rds_standby_az    = "af-johannesburg-1b"
    db_engine         = "PostgreSQL"
    db_engine_version = "13"
    db_flavor         = "rds.pg.n1.large.2"
    db_password       = "DO_NOT_COMMIT_REAL_PASSWORD"
    db_volume_type    = "CLOUDSSD"
    db_volume_size    = 100
    backup_start_time = "02:00-03:00"
    backup_keep_days  = 7
  }