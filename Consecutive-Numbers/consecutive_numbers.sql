/* Write your PL/SQL query statement below */
WITH
    cte_repeat
    AS
        (SELECT id,
                num,
                LAG (num) OVER (ORDER BY id)      lag_num,
                LEAD (num) OVER (ORDER BY id)     lead_num
           FROM logs)
SELECT DISTINCT num ConsecutiveNums
  FROM cte_repeat
 WHERE lag_num = num and num = lead_num;
