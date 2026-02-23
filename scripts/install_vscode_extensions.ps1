param(
  [string]$ExtensionsFile = "vscode-extensions.txt",
  [switch]$WithVersions
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$path = Join-Path $scriptDir $ExtensionsFile
if (-not (Test-Path $path)) { Write-Error "Extensions file not found: $path"; exit 1 }

$lines = Get-Content $path | Where-Object { $_ -and -not ($_ -match '^#') }
foreach ($line in $lines) {
  $id = if ($WithVersions) { $line } else { ($line -split '@')[0] }
  Write-Host "Installing: $id"
  & code --install-extension $id
}

Write-Host "Done. Some extensions require sign-in or reload to activate."