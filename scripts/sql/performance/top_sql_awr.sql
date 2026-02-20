-- Top SQL from AWR history (requires AWR access/diagnostics pack)
-- If AWR is not available, use V$SQL alternatives.

col sql_id format a15

select *
from (
  select
    s.sql_id,
    sum(s.elapsed_time_delta)/1e6 as elapsed_s,
    sum(s.cpu_time_delta)/1e6     as cpu_s,
    sum(s.buffer_gets_delta)      as buffer_gets,
    sum(s.disk_reads_delta)       as disk_reads,
    sum(s.executions_delta)       as execs
  from dba_hist_sqlstat s
  group by s.sql_id
  order by sum(s.elapsed_time_delta) desc
)
where rownum <= 20;
