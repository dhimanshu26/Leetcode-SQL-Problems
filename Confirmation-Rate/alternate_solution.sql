/* Write your PL/SQL query statement below */
SELECT s.user_id,
         ROUND (AVG (CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END), 2)    confirmation_rate
    FROM signups s, confirmations c
   WHERE s.user_id = c.user_id(+)
GROUP BY s.user_id
