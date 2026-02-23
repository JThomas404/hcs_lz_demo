param(
  [string]$RootPath = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
  [switch]$Force
)

function Ensure-Dir {
  param($Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    New-Item -ItemType Directory -Path $Path -Force | Out-Null
  }
}

function New-SafeFile {
  param(
    [string]$FilePath,
    [string]$Content = ""
  )

  if ((Test-Path -LiteralPath $FilePath) -and (-not $Force)) {
    Write-Host "Skipping existing file: $FilePath"
    return
  }

  $dir = Split-Path -Path $FilePath -Parent
  if ($dir) { Ensure-Dir -Path $dir }
  Set-Content -LiteralPath $FilePath -Value $Content -Encoding UTF8
  Write-Host "Created file: $FilePath"
}

Write-Host "Generating repo skeleton at: $RootPath"

# Manifest of all files to create (empty content by default)
$fileManifest = @(
  '.editorconfig',
  '.gitignore',
  '.pre-commit-config.yaml',
  '.yamllint',
  '.vscode/extensions.json',
  '.vscode/settings.json',
  'README.md',
  'documentation/architecture-operating-model.md',
  'documentation/azure-devops-integration.md',
  'documentation/migration-factory.md',
  'documentation/naming-tagging.md',
  'documentation/obs-iam-and-bucket.md',
  'documentation/repo-structure-and-generator.md',
  'documentation/state-backend.md',
  'documentation/vdc-mapping.md',
  'documentation/reference-docs/002 ABSA--LandingZone Design Principle.pdf',
  'documentation/reference-docs/ABSA_DBaaS_Delivery_Platform_Design__V9.docx',
  'documentation/reference-docs/ABSA_Laptop_VDI_Test_Report.docx',
  'documentation/reference-docs/HCS_DevOps_Requirements_and_DB_Blueprint_ABSA_v0_2 2.docx',
  'documentation/reference-docs/Hybrid Migration Assessment.docx',
  'live/root.hcl',
  'live/terragrunt.backend.hcl',
  'live/tenants/tenant-absa-bank/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/landing-zone/guardrails/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/landing-zone/landing-zone-foundation/terraform.tfvars',
  'live/tenants/tenant-absa-bank/dev/landing-zone/landing-zone-foundation/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/landing-zone/logging-audit/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/landing-zone/shared-obs/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/core-service/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/vdc-core/network-base/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/vdc-data/drs-primary/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/vdc-data/rds-primary/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/vdc-shared/dns/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/vdc-shared/prometheus/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/dev/vdcs/vdc-shared/shared-obs/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/landing-zone/guardrails/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/landing-zone/landing-zone-foundation/terraform.tfvars',
  'live/tenants/tenant-absa-bank/non-prod/landing-zone/landing-zone-foundation/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/landing-zone/logging-audit/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/landing-zone/shared-obs/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/core-service/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/vdc-core/network-base/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/vdc-data/drs-primary/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/vdc-data/rds-primary/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/vdc-shared/dns/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/vdc-shared/prometheus/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/non-prod/vdcs/vdc-shared/shared-obs/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/landing-zone/guardrails/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/landing-zone/landing-zone-foundation/terraform.tfvars',
  'live/tenants/tenant-absa-bank/prod/landing-zone/landing-zone-foundation/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/landing-zone/logging-audit/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/landing-zone/shared-obs/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/core-service/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/vdc-core/network-base/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/vdc-data/drs-primary/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/vdc-data/rds-primary/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/vdc-shared/dns/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/vdc-shared/prometheus/terragrunt.hcl',
  'live/tenants/tenant-absa-bank/prod/vdcs/vdc-shared/shared-obs/terragrunt.hcl',
  'modules/README.md',
  'modules/versions.tf',
  'modules/drs/backend.tf',
  'modules/drs/main.tf',
  'modules/drs/outputs.tf',
  'modules/drs/README.md',
  'modules/drs/variables.tf',
  'modules/drs/versions.tf',
  'modules/ecs/main.tf',
  'modules/kms/main.tf',
  'modules/kms/outputs.tf',
  'modules/kms/variables.tf',
  'modules/kms/versions.tf',
  'modules/network-base/main.tf',
  'modules/network-base/outputs.tf',
  'modules/network-base/README.md',
  'modules/network-base/variables.tf',
  'modules/network-base/versions.tf',
  'modules/obs-bucket/main.tf',
  'modules/obs-bucket/outputs.tf',
  'modules/obs-bucket/variables.tf',
  'modules/obs-bucket/versions.tf',
  'modules/rds/main.tf',
  'modules/rds/outputs.tf',
  'modules/rds/variables.tf',
  'modules/rds/versions.tf',
  'modules/state-backend/README.md',
  'pipelines/README.md',
  'pipelines/azure-pipelines-drs-demo.yml',
  'pipelines/azure-pipelines-per-stack.yml',
  'pipelines/azure-pipelines-run-all.yml',
  'pipelines/azure-pipelines-stack-wrapper.yml',
  'policy/README.md',
  'policy/opa/deny-public-egress.rego',
  'policy/opa/deny-public-ingress.rego',
  'policy/opa/name-regex.rego',
  'policy/opa/required-tags.rego',
  'runbooks/drs-wave-runbook.md',
  'scripts/create_repo_skeleton.ps1',
  'scripts/validate_tf_identifier_naming.sh',
  'templates/stage-apply.yml',
  'templates/stage-evidence.yml',
  'templates/stage-plan.yml',
  'templates/stage-validate.yml',
  'workloads/README.md'
)

# Ensure directories first for clarity
$directories = $fileManifest | ForEach-Object { Split-Path -Path $_ -Parent } | Where-Object { $_ } | Sort-Object -Unique
foreach ($dir in $directories) {
  Ensure-Dir -Path (Join-Path $RootPath $dir)
  Write-Host "Ensured directory: $(Join-Path $RootPath $dir)"
}

# Create all files (empty by default)
foreach ($file in $fileManifest) {
  $target = Join-Path $RootPath $file
  New-SafeFile -FilePath $target -Content ""
}

Write-Host "Repository skeleton creation complete. Review files in $RootPath"
