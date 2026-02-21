output "bucket" {
  description = "Name of the created OBS bucket."
  value       = hcs_obs_bucket.evidence.bucket
}

output "id" {
  description = "Resource ID of the created OBS bucket."
  value       = hcs_obs_bucket.evidence.id
}
