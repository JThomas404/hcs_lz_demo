output "key_id" {
  description = "Provider key identifier for the created KMS key."
  value       = hcs_kms_key.data_encryption.key_id
}

output "id" {
  description = "Resource ID of the created KMS key."
  value       = hcs_kms_key.data_encryption.id
}
