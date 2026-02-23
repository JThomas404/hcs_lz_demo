module "drs_kms" {
  count           = var.create && var.create_kms ? 1 : 0
  source          = "../kms"
  key_alias       = "alias/${var.name_prefix}"
  key_description = "DRS demo key for ${var.name_prefix}"
  pending_days    = 7
  is_enabled      = true
  key_usage       = "ENCRYPT_DECRYPT"
  tags            = var.tags
}

module "drs_evidence_bucket" {
  count  = var.create ? 1 : 0
  source = "../obs-bucket"

  bucket     = var.evidence_bucket_name != null ? var.evidence_bucket_name : "${var.name_prefix}-drs-evidence"
  acl        = "private"
  versioning = true
  kms_key_id = var.create_kms ? module.drs_kms[0].key_id : null
  tags       = var.tags
}
