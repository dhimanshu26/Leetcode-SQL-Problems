/* Write your PL/SQL query statement below */
SELECT user_id,
       ROUND (
           NVL ((  (SELECT COUNT (*)
                      FROM confirmations c
                     WHERE c.user_id = s.user_id AND c.action = 'confirmed')
                 / NULLIF ( (SELECT COUNT (*)
                               FROM confirmations c
                              WHERE c.user_id = s.user_id),
                           0)),
                0),
           2)    confirmation_rate
  FROM signups s;
