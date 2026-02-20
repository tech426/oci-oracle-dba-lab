-- System wait events summary
-- Useful for: first-pass performance triage (I/O vs concurrency vs commit)

col event format a45

select
  event,
  total_waits,
  time_waited/100 as time_waited_s,
  average_wait/100 as avg_wait_s
from v$system_event
where wait_class <> 'Idle'
order by time_waited desc;
