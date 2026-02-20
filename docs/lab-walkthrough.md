# Lab Walkthrough (1-page)

## Purpose
A repeatable OCI Oracle DBA lab used to demonstrate production-like operational tasks:
health checks, performance triage, security audits, and backup/recovery readiness.

---

## Step 1 — Environment setup (OCI)
- Create VCN + subnets (public for bastion optional, private for DB)
- Provision Compute instance (Oracle Linux) and attach Block Volumes
- Install/configure Oracle DB + listener (19c/21c)
- Ensure least-privilege access patterns (IAM + OS users)

**Validation**
- listener status, DB open mode, service registration
- connect locally + remotely (as allowed)

---

## Step 2 — Operational health checks
Run:
- `scripts/sql/health/sessions.sql`
- `scripts/sql/health/locks_blocking.sql`
- `scripts/sql/health/tablespace_usage.sql`

**What I look for**
- unexpected session spikes, long-running sessions
- blockers / waits on critical objects
- tablespace headroom & growth trends

---

## Step 3 — Performance triage
Run:
- `scripts/sql/performance/waits_system.sql`
- `scripts/sql/performance/top_sql_awr.sql`

**What I look for**
- wait class dominance (I/O vs concurrency vs commit)
- top SQL by elapsed time / CPU / buffer gets
- next steps: plan inspection, indexing, stats, SQL rewrite

---

## Step 4 — Security audit (least privilege)
Run:
- `scripts/sql/security/role_audit.sql`
- `scripts/sql/security/privilege_audit.sql`

**What I look for**
- direct grants that should be via roles
- excessive system privileges
- privilege drift after deployments/migrations

---

## Step 5 — Backup & recovery readiness (concept)
- RMAN backup strategy to FRA and/or Object Storage
- Periodic restore tests (table/tablespace/DB) to prove recoverability

**Validation**
- “restore works” beats “backup succeeded”

---

## How I present this in interviews (short)
“I built this lab to demonstrate cloud DBA operations end-to-end: monitoring and diagnosing session/lock issues, identifying system wait patterns, reviewing top SQL for tuning candidates, and auditing roles/privileges for least privilege. The goal is to prove repeatable operational discipline in an OCI context.”
