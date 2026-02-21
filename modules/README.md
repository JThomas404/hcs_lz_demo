# Modules directory

Each module is versioned and stored in this `modules/` directory. Individual modules contain skeleton `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`, and a `README.md`. Pin module versions when consumed by `live/`.

Notes:
- The `internet-egress` module has been retired for this private-cloud baseline.
- Default pattern is no-public-egress; enforce exceptions through policy and approved change control.
