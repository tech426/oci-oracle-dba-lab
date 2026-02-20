# Architecture (OCI Oracle DBA Lab)

## Goal
Demonstrate senior Oracle DBA operational responsibilities mapped to OCI building blocks:
- reliability (backup/restore), security (least privilege), performance (waits/top SQL), and observability (monitoring/alerts)

## Reference architecture (Compute-based DB)
**OCI Components**
- **VCN** with:
  - Public subnet (optional) for bastion / controlled admin access
  - Private subnet for DB host
  - NSGs / Security Lists restricted to required ports (22, 1521 as needed)
- **Compute Instance** (Oracle Linux) hosting:
  - Oracle DB (19c/21c) + listener
  - OS-level monitoring (CPU/mem/disk)
- **Block Volume**:
  - Datafiles / redo / FRA (depending on layout)
- **Object Storage**:
  - RMAN backup destination (recommended for cloud patterns)
- **IAM**:
  - Least privilege for admins, DBAs, automation identities

## Data flow (high-level)
1. Admin connects via SSH (preferably via bastion) to DB host.
2. DBA connects to DB via SQL*Plus/SQLcl (local or remote).
3. Health/perf/security scripts run against v$ views / DBA_* views.
4. Backup:
   - RMAN writes backup pieces to FRA or directly to Object Storage (via OCI tooling / plugin approach).
5. Monitoring:
   - OCI Monitoring (host metrics) + DB views (session/lock/wait) inform alerting.

## What I validate in the lab
- **Availability:** DB up, listener registered, sessions stable
- **Capacity:** tablespace usage trends, FRA usage, block volume headroom
- **Performance:** wait events, top SQL, session history patterns
- **Security:** privileged accounts, unexpected grants, role hygiene
- **Recovery readiness:** ability to restore a table/tablespace/DB in a controlled scenario

## Notes for Autonomous Database (ADB) comparison
If using ADB:
- OS access is limited; focus on:
  - DB-level metrics, SQL performance views, service configuration
  - OCI-native monitoring and audit logs
- Many scripts still apply but may require permissions/alternative views.

## Interview-ready sound bites
- “I map DBA responsibilities to cloud primitives: network isolation, least privilege IAM, durable storage, and object-based backups.”
- “I validate recovery readiness via repeatable restore tests, not just ‘backup succeeded’ messages.”
