-- System privileges granted to users/roles
-- Useful for: catching broad privileges (e.g., DBA, ALTER SYSTEM, etc.)

col grantee format a25
col privilege format a35

select
  grantee,
  privilege,
  admin_option
from dba_sys_privs
where grantee not in ('SYS', 'SYSTEM')
order by grantee, privilege;
