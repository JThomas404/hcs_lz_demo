output "kms_key_id" {
  value = try(module.drs_kms[0].key_id, null)
}

output "evidence_bucket_id" {
  value = try(module.drs_evidence_bucket[0].id, null)
}

output "evidence_bucket_name" {
  value = try(module.drs_evidence_bucket[0].bucket, null)
}
