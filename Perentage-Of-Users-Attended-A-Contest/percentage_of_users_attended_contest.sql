/* Write your PL/SQL query statement below */
WITH
    cte_attend
    AS
        (  SELECT r.contest_id,
                  ROUND (
                        (  COUNT (r.user_id)
                         / (SELECT COUNT (*) FROM users))
                      * 100,
                      2)    percentage
             FROM register r
         GROUP BY contest_id)
  SELECT contest_id, percentage
    FROM cte_attend
ORDER BY percentage DESC, contest_id;
