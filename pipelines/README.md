# Pipelines

This folder contains pipeline YAML for two core patterns:
- `azure-pipelines-per-stack.yml` — per-stack pipeline (recommended)
- `azure-pipelines-run-all.yml` — aggregated run-all pattern for bootstrapping/coordinated changes

Templates are used for reusable stages: validate, plan, apply, evidence.

Per-stack wrapper
- `azure-pipelines-stack-wrapper.yml` — copy this file and adjust `trigger.paths` and the default `stack_path` parameter per stack. It calls the shared stage templates and uses the `hcs-credentials` variable group.

Creating a pipeline for a stack (example)
1. In Azure DevOps, create a new pipeline and point it to your repo.
2. Select `Existing Azure Pipelines YAML file` and provide the path to your copied wrapper (for example `pipelines/azure-pipelines-stack-wrapper.yml`).
3. Configure an Azure DevOps Variable Group named `hcs-credentials` with `TF_VAR_hcs_access_key` and `TF_VAR_hcs_secret_key` (marked secret).
4. Create Environments (e.g., `dev`, `non-prod`, `prod`) and add approvers for non-prod/prod. Set environment concurrency to 1 for exclusive apply.
