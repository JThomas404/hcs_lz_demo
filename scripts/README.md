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
