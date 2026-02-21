output "kms_key_id" {
  description = "KMS key ID created for DRS demo encryption, or null when disabled."
  value       = try(module.drs_kms[0].key_id, null)
}

output "evidence_bucket_id" {
  description = "Resource ID of the DRS demo evidence OBS bucket."
  value       = try(module.drs_evidence_bucket[0].id, null)
}

output "evidence_bucket_name" {
  description = "Name of the DRS demo evidence OBS bucket."
  value       = try(module.drs_evidence_bucket[0].bucket, null)
}
