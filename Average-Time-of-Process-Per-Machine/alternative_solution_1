SELECT machine_id,
         SUM (end_time - start_time) / COUNT (process_id)     processing_time
    FROM (  SELECT machine_id,
                   process_id,
                   MAX (timestamp)     end_time,
                   MIN (timestamp)     start_time
              FROM xxbackup.activity
          GROUP BY machine_id, process_id
          ORDER BY machine_id, process_id) a
GROUP BY machine_id
