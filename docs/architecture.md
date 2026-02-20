architecture.md # OCI components + DB layout + data flow
lab-walkthrough.md # 1-page lab walkthrough you can talk through in interviews
scripts/sql/
health/ # operational health checks
performance/ # performance diagnostics
security/ # privilege & role audits
templates/
env.example # safe local config template (no secrets)


## How I talk through this in interviews (60 seconds)
“I maintain an OCI Oracle DBA lab to keep my operational skills current in a cloud context. I provision the database on OCI compute (or compare against Autonomous), implement backup/recovery patterns, and run repeatable SQL-based health and performance checks. This repo contains the runbooks and scripts I use to validate session health, troubleshoot blocking, review system waits/top SQL, and audit privileges for least privilege.”

## How to use the SQL scripts
- Connect as a privileged user (or use read-only views where appropriate).
- Run scripts from SQL*Plus / SQLcl / SQL Developer.
- If you don’t have AWR licensing in your environment, use the non-AWR alternatives (noted in scripts).

> Note: This is a lab/portfolio repo. Do not commit real credentials, OCIDs, IPs, wallets, or private keys.
