resource "hcs_obs_bucket" "primary" {
  bucket     = var.bucket
  acl        = var.acl
  versioning = var.versioning

  kms_key_id = var.kms_key_id

  tags = var.tags
}
