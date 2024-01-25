/* Write your PL/SQL query statement below */
WITH
    cte_friends
    AS
        (  SELECT requester_id, COUNT (requester_id) no_of_req_accepted
             FROM requestaccepted
            WHERE accept_date IS NOT NULL
         GROUP BY requester_id
         UNION ALL
           SELECT accepter_id, COUNT (accepter_id) accepter_count
             FROM requestaccepted
            WHERE accept_date IS NOT NULL
         GROUP BY accepter_id),
    cte_friends_count
    AS
        (  SELECT requester_id id, SUM (no_of_req_accepted) num
             FROM cte_friends
         GROUP BY requester_id
         ORDER BY 2 DESC)
SELECT id, num
  FROM cte_friends_count
 WHERE ROWNUM <= 1;
