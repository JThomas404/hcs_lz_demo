**Migration Factory: DRS-based, Wave Model (~2000 DBs)**

Purpose: Define an industrialized approach to migrate ~2000 databases to HCS RDS using Huawei DRS (Data Replication Service). The factory provides standardized templates, validations, runbooks and evidence packs.

1) Standard migration lifecycle

- Pre-checks (automated):
  - Network reachability (source → target), DNS resolution, NTP sync, required privileges, storage sizing, schema compatibility checks.
  - Security groups & routing: open only required internal ports; no public exposure.

- Full load: Using DRS full copy of data to the HCS target; monitor throughput and error rates.

- CDC enablement & monitoring: Enable CDC on source, track apply lag and queued transactions.

- Validation gate:
  - Row counts, checksums (table-level), schema/tables presence validation.
  - App-level smoke tests: connectivity, sanity queries.

- Cutover steps (in approved window):
  - Final sync & drain writes at source, switch DNS to new endpoint (DNS TTL planning), enable write on target.
  - Maintain rollback window and steps.

- Post-cutover hypercare: enhanced monitoring, retention of evidence pack, rollback readiness.

2) Wave planning & governance

- Wave 0: Pilot (5–10 low-risk DBs) to validate tooling, evidence pack, and runbooks.
- Wave sizing: batch by bandwidth, DRS concurrency limits, validation capacity, and business change windows (prefer smaller batches during business-critical windows).
- Migration inventory: central CSV/YAML with metadata (db_id, engine, size, owner, business_window, prechecks, status, evidence location).
- Evidence packs: per-migration artifact containing prechecks, plan, DRS logs, validation results, cutover notes, and state pointers.

3) Templates & evidence

- Standard templates per engine (Postgres/MySQL): precheck script, validation script, smoke tests, rollback checklist.
- Evidence pack contents:
  - Precheck outputs
  - Full-load & CDC logs
  - Validation results & checksums
  - Plan & apply artifacts
  - Cutover approval and timestamped actions

4) Runbooks (operations)

- DRS wave execution:
  - Scheduling, concurrency control, central tracker, communications playbook.

- Cutover & rollback:
  - Automated steps for final sync, DNS swap, health checks, and rollback triggers.

- Restore tests for RDS:
  - Periodic restore validation runbook and automated smoke tests.
