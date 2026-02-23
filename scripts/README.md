# Script Usage

This folder contains helper scripts. To generate the full repository skeleton with `create_repo_skeleton.ps1`, use the instructions below.

## Requirements
- Windows PowerShell 5.1+ (no external modules required)
- Permission to create directories/files under your chosen output path
- If execution policy blocks script runs, start the shell with `-ExecutionPolicy Bypass`

## Usage
- From repo root (default root path is the repo root):
  - `powershell -NoProfile -File scripts/create_repo_skeleton.ps1`
- Target a different path:
  - `powershell -NoProfile -File scripts/create_repo_skeleton.ps1 -RootPath "D:\path\to\skeleton"`
- Overwrite existing placeholders (forces overwrite of existing files in the manifest):
  - `powershell -NoProfile -File scripts/create_repo_skeleton.ps1 -RootPath "D:\path\to\skeleton" -Force`

## Behavior
- Creates every directory and file from the manifest (empty content by default)
- Skips existing files unless `-Force` is supplied
- Default `RootPath` resolves to the repo root relative to the script location

## VS Code extensions export and install

- Exported installed extensions are included as `scripts/vscode-extensions.txt`.
- Install on a target machine using the provided PowerShell installer script:

```powershell
powershell -NoProfile -File scripts/install_vscode_extensions.ps1 -ExtensionsFile 'vscode-extensions.txt'
```

- To install with exact pinned versions (if preferred):

```powershell
powershell -NoProfile -File scripts/install_vscode_extensions.ps1 -ExtensionsFile 'vscode-extensions.txt' -WithVersions
```

- To create a recommendations file for VS Code UI (no versions):

```powershell
$ids = Get-Content .\scripts\vscode-extensions.txt | ForEach-Object { ($_ -split '@')[0] }
@{ recommendations = $ids } | ConvertTo-Json -Depth 3 | Set-Content .vscode\extensions.json
```

- Notes:
  - `.vscode/extensions.json` only surfaces recommendations; users must accept/install recommended extensions in the UI or via `code --install-extension`.
  - Ensure the `code` CLI is available in PATH on the target machine.
  - Some extensions require sign-in (e.g., Copilot, GitHub PRs) after install.


Install extensions (PowerShell)
``` powershell

# ensure 'code' CLI is available; then:
powershell -NoProfile -File .\scripts\install_vscode_extensions.ps1 -ExtensionsFile 'vscode-extensions.txt'
# or install without pinned versions:
Get-Content .\scripts\vscode-extensions.txt | ForEach-Object { ($_ -split '@')[0] } | ForEach-Object { code --install-extension $_ }

```

Install extensions (bash)

``` bash

# ensure 'code' is in PATH
cut -d'@' -f1 scripts/vscode-extensions.txt | xargs -L 1 code --install-extension

```

List installed extensions (confirm successful installation)

``` powershell

code --list-extensions --show-versions

```