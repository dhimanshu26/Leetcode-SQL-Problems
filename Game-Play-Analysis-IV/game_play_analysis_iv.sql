/* Write your PL/SQL query statement below */
WITH
    cte_first_login
    AS
        (SELECT player_id,
                MIN (event_date) OVER (PARTITION BY player_id, event_date)
                    first_login,
                LEAD (event_date)
                    OVER (PARTITION BY player_id ORDER BY event_date)
                    consecutive_login,
                RANK () OVER (PARTITION BY player_id ORDER BY event_date)
                    player_rank
           FROM activity)
SELECT ROUND (
           AVG (
               CASE
                   WHEN consecutive_login = first_login + 1 THEN 1
                   ELSE 0
               END),
           2)    fraction
  FROM cte_first_login cfl
 WHERE player_rank = 1;
