/* Write your PL/SQL query statement below */
SELECT id,
         NVL (
             CASE
                 WHEN MOD (id, 2) <> 0 THEN LEAD (student) OVER (ORDER BY id)
                 ELSE LAG (student) OVER (ORDER BY id)
             END,
             student)    AS student
    FROM seat
ORDER BY id;
