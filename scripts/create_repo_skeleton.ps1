param(
  [string]$RootPath = "C:\Users\Jarred Thomas\.vscode\hcs_lz_demo",
  [switch]$Force
)

function Ensure-Dir { param($p) if (-not (Test-Path $p)) { New-Item -ItemType Directory -Path $p | Out-Null } }

Write-Host "Generating repo skeleton at: $RootPath"

$paths = @(
  'modules/network-base',
  'modules/ecs',
  'landing-zone/landing-zone-foundation',
  'landing-zone/guardrails',
  'landing-zone/logging-audit',
  'landing-zone/shared-obs',
  'resource-space/network-base',
  'resource-space/connectivity',
  'workloads/ecs',
  'workloads/rds',
  'workloads/drs',
  'data-sources',
  'live/tenants/tenant-absa-bank/dev/landing-zone/landing-zone-foundation',
  'live/tenants/tenant-absa-bank/dev/landing-zone/guardrails',
  'live/tenants/tenant-absa-bank/dev/landing-zone/logging-audit',
  'live/tenants/tenant-absa-bank/dev/landing-zone/shared-obs',
  'live/tenants/tenant-absa-bank/dev/vdcs/core-service',
  'pipelines',
  'templates',
  'policy/opa',
  'documentation',
  'runbooks'
)

foreach ($rel in $paths) {
  $full = Join-Path $RootPath $rel
  Ensure-Dir $full
  Write-Host "Ensured directory: $full"
}

function New-SafeFile($filePath, $content) {
  if ((Test-Path $filePath) -and (-not $Force)) {
    Write-Host "Skipping existing file: $filePath"
    return
  }
  $dir = Split-Path $filePath
  Ensure-Dir $dir
  Set-Content -Path $filePath -Value $content -Encoding UTF8
  Write-Host "Created file: $filePath"
}

# Create skeleton files
New-SafeFile -filePath (Join-Path $RootPath 'modules/network-base/main.tf') -content "// network-base module skeleton`n"
New-SafeFile -filePath (Join-Path $RootPath 'modules/network-base/variables.tf') -content "// variables`n"
New-SafeFile -filePath (Join-Path $RootPath 'modules/network-base/outputs.tf') -content "// outputs`n"
New-SafeFile -filePath (Join-Path $RootPath 'modules/network-base/versions.tf') -content "terraform { required_version = \">= 1.5.0, < 1.7.0\" }`n"
New-SafeFile -filePath (Join-Path $RootPath 'modules/network-base/README.md') -content "network-base module skeleton`n"

New-SafeFile -filePath (Join-Path $RootPath 'live/terragrunt.hcl') -content "// root terragrunt.hcl`n"
New-SafeFile -filePath (Join-Path $RootPath 'live/tenants/tenant-absa-bank/terragrunt.hcl') -content "// tenant terragrunt`n"

New-SafeFile -filePath (Join-Path $RootPath 'pipelines/azure-pipelines-per-stack.yml') -content "# azure pipelines per-stack skeleton`n"
New-SafeFile -filePath (Join-Path $RootPath 'pipelines/azure-pipelines-run-all.yml') -content "# azure pipelines run-all skeleton`n"

New-SafeFile -filePath (Join-Path $RootPath 'templates/stage-validate.yml') -content "# validate stage template`n"
New-SafeFile -filePath (Join-Path $RootPath 'templates/stage-plan.yml') -content "# plan stage template`n"
New-SafeFile -filePath (Join-Path $RootPath 'templates/stage-apply.yml') -content "# apply stage template`n"
New-SafeFile -filePath (Join-Path $RootPath 'templates/stage-evidence.yml') -content "# evidence stage template`n"

New-SafeFile -filePath (Join-Path $RootPath 'policy/opa/required-tags.rego') -content "# OPA required tags skeleton`n"
New-SafeFile -filePath (Join-Path $RootPath 'policy/opa/deny-public-ingress.rego') -content "# OPA deny public ingress skeleton`n"
New-SafeFile -filePath (Join-Path $RootPath 'policy/opa/deny-public-egress.rego') -content "# OPA deny public egress skeleton`n"

New-SafeFile -filePath (Join-Path $RootPath 'documentation/overview.md') -content "# Overview`n"
New-SafeFile -filePath (Join-Path $RootPath 'documentation/state-backend.md') -content "# State & backend`n"
New-SafeFile -filePath (Join-Path $RootPath 'runbooks/drs-wave-runbook.md') -content "# DRS Wave Runbook`n"
New-SafeFile -filePath (Join-Path $RootPath '.gitignore') -content "# gitignore`n"

Write-Host "Repository skeleton creation complete. Review files in $RootPath"
