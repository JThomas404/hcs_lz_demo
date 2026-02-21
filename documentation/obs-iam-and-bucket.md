# OBS Bucket & IAM Checklist (WORM for Terraform state)

Purpose: checklist and example IAM policy for creating an OBS bucket used for Terraform remote state with Object Lock (WORM) semantics.

Bucket creation checklist
- Create bucket: `absa-terraform-state-jnb` in region `jnb`.
- Enable Object Lock (WORM) at bucket-level if supported. If bucket-level Object Lock cannot be set, plan for object-level retention on created keys.
- Define lifecycle/retention rules according to compliance (e.g., retain state versions for N years).
- Create prefixes per tenant/env/vdc/stack: `tenant-absa-bank/prod/vdc-data/rds-primary/`.
- Enable server-side encryption for the bucket.
- Enable access logging to a separate secure bucket for audit trail.

Access model and accounts
- Pipeline service account (AK/SK): scope to `absa-terraform-state-jnb/<tenant>/*` with PUT/GET/LIST permissions.
- Engineers role: GET/LIST on same prefixes (read-only).
- Admin break-glass: separate credentials with MFA and JIT activation; all actions logged.

Example OBS IAM-like policy (conceptual JSON)
{
  "Version": "2023-01-01",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::PIPELINE_ACCOUNT" },
      "Action": ["s3:PutObject", "s3:PutObjectAcl", "s3:ListBucket", "s3:GetObject"],
      "Resource": [
        "arn:aws:s3:::absa-terraform-state-jnb/tenant-absa-bank/*",
        "arn:aws:s3:::absa-terraform-state-jnb"
      ]
    },
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::ENGINEER_ROLE" },
      "Action": ["s3:GetObject", "s3:ListBucket"],
      "Resource": ["arn:aws:s3:::absa-terraform-state-jnb/tenant-absa-bank/*"]
    }
  ]
}

Notes:
- Replace ARN formats above with the OBS/Huawei equivalent when creating policies. The JSON shows the intent: pipeline principal = write, engineers = read-only.
- Confirm OBS provides object-lock (WORM) before enabling; document retention windows.
