-- Sessions overview (active vs inactive) + key attributes
-- Useful for: “What’s happening right now?” baseline health check

col username format a20
col status format a10
col machine format a30
col program format a35
col event format a35

select
  s.sid,
  s.serial#,
  s.username,
  s.status,
  s.osuser,
  s.machine,
  s.program,
  s.module,
  s.logon_time,
  s.last_call_et,
  s.event
from v$session s
where s.username is not null
order by
  case when s.status = 'ACTIVE' then 0 else 1 end,
  s.last_call_et desc;
