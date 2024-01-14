/* Write your PL/SQL query statement below */
WITH
    cte_start
    AS
        (SELECT machine_id, process_id, timestamp start_time
           FROM activity
          WHERE activity_type = 'start'),
    cte_end
    AS
        (SELECT machine_id, process_id, timestamp end_time
           FROM activity
          WHERE activity_type = 'end')
  SELECT cs.machine_id,
         ROUND (SUM (end_time - start_time) / COUNT (cs.process_id), 3)    processing_time
    FROM cte_start cs, cte_end ce
   WHERE cs.machine_id = ce.machine_id AND cs.process_id = ce.process_id
GROUP BY cs.machine_id
ORDER BY 1;
