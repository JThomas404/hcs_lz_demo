provider "hcs" {
  region       = var.region
  project_name = var.project_name
  cloud        = var.cloud

  # Optional in newer provider versions (defaults exist), but in private HCS you will often need it.
  auth_url = var.auth_url != "" ? var.auth_url : null

  # Prefer environment variables; these are fallbacks.
  access_key = var.access_key != "" ? var.access_key : null
  secret_key = var.secret_key != "" ? var.secret_key : null

  # Optional, only if your environment requires it.
  domain_name = var.domain_name != "" ? var.domain_name : null
}