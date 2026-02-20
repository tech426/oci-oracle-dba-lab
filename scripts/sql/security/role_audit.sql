-- Role grants to users (who has what)
-- Useful for: least privilege reviews

col grantee format a25
col granted_role format a30

select
  grantee,
  granted_role,
  admin_option,
  default_role
from dba_role_privs
where grantee not in ('SYS', 'SYSTEM')
order by grantee, granted_role;
