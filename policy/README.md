# Policy-as-code

This folder contains starter OPA policies for guardrails. Recommended flow:

- Run policies in PR validation (warn-only in dev)
- Fail in non-prod/prod
- Keep policies in source control and version them alongside modules
- Enforce no-public-egress-by-default (exceptions only via approved policy override)
