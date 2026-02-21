resource "hcs_kms_key" "this" {
  key_alias       = var.key_alias
  key_description = var.key_description
  pending_days    = var.pending_days
  is_enabled      = var.is_enabled
  key_usage       = var.key_usage
  tags            = var.tags
}
