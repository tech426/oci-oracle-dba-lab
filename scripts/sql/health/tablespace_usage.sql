-- Tablespace usage with percent used
-- Useful for: capacity planning and avoiding “tablespace full” incidents

col tablespace_name format a25

select
  df.tablespace_name,
  round(df.total_mb, 1) as total_mb,
  round(fs.free_mb, 1)  as free_mb,
  round((df.total_mb - fs.free_mb), 1) as used_mb,
  round(((df.total_mb - fs.free_mb) / df.total_mb) * 100, 1) as pct_used
from
  (select tablespace_name, sum(bytes)/1024/1024 total_mb
   from dba_data_files
   group by tablespace_name) df
join
  (select tablespace_name, sum(bytes)/1024/1024 free_mb
   from dba_free_space
   group by tablespace_name) fs
on df.tablespace_name = fs.tablespace_name
order by pct_used desc;
