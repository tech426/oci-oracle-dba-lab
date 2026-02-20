-- Blocking sessions (who is blocking whom)
-- Useful for: “Users are stuck” / concurrency incidents

col blocker format a20
col blocked format a20
col wait_event format a35

select
  bs.sid || ',' || bs.serial# as blocker,
  ws.sid || ',' || ws.serial# as blocked,
  ws.username,
  ws.event as wait_event,
  ws.seconds_in_wait,
  ws.sql_id
from v$session ws
join v$session bs
  on ws.blocking_session = bs.sid
where ws.blocking_session is not null
order by ws.seconds_in_wait desc;
