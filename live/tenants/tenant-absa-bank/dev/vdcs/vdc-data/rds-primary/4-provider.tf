provider "hcs" {
  region = var.region

  # Credentials (placeholders allowed for now)
  ak = var.access_key != "" ? var.access_key : null
  sk = var.secret_key != "" ? var.secret_key : null

  # Private cloud IAM endpoint (placeholder allowed for now)
  auth_url = var.auth_url != "" ? var.auth_url : null

  # Prefer ID when available, else fall back to name
  project_id   = var.project_id != "" ? var.project_id : null
  project_name = var.project_id == "" && var.project_name != "" ? var.project_name : null

  # Domain is often needed for name-based scope in private HCS
  domain_name = var.domain_name != "" ? var.domain_name : null
}
