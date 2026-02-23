// tenant-level terragrunt - provide tenant-scoped locals so children inherit without nested includes

locals {
  tenant = "tenant-absa-bank"

  # Tenant-scoped common tags (keeps child stacks self-contained and avoids nested include chains)
  common_tags = {
    project             = "HCS_DBaas_Migration"
    tenant              = "tenant-absa-bank"
    db_type             = "postgresql"
    data_classification = "internal"
    created_by          = "terragrunt"
    lifecycle           = "persistent"
    owner               = "RedM-CloudForgeX"
    owner_name          = "Jarred"
    ab_number           = "AB044XP"
  }
}
