/* Write your PL/SQL query statement below */
WITH
    cte_numbers
    AS
        (SELECT num, COUNT (1) OVER (PARTITION BY num) rank_num
           FROM mynumbers)
SELECT MAX (num) num
  FROM cte_numbers
 WHERE rank_num = 1;
