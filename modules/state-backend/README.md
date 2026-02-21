# State Backend module (OBS S3-compatible)

This folder contains documentation and examples for configuring Terragrunt/Terraform remote state to use Huawei OBS (S3-compatible) with object lock (WORM) semantics.

Key points:
- Use an OBS bucket dedicated for Terraform state and pipeline artifacts.
- Configure object lock (WORM) on the bucket or object prefixes to prevent deletion/overwrite of historical state versions.
- Access model: pipeline identity = write (PUT), engineers = read-only (GET/LIST).
- Do NOT store AK/SK in repository. Inject AK/SK into pipeline runtime via secure variable groups or service connections.

See `../../documentation/state-backend.md` for more implementation notes and Terragrunt examples.
