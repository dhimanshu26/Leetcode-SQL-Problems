/* Write your PL/SQL query statement below */
WITH
    cte_total_amount
    AS
        (  SELECT visited_on,
                  SUM (amount)                             amount,
                  FIRST_VALUE (visited_on + 6) OVER ()     previous_date
             FROM customer
         GROUP BY visited_on
         ORDER BY 1),
    cte_final_amount
    AS
        (SELECT visited_on,
                previous_date,
                SUM (amount)
                    OVER (ORDER BY visited_on
                          ROWS BETWEEN 6 PRECEDING AND 0 FOLLOWING)    amount
           FROM cte_total_amount)
SELECT to_char(visited_on, 'YYYY-MM-DD') visited_on, amount, ROUND (amount / 7, 2) average_amount
  FROM cte_final_amount
 WHERE visited_on >= previous_date;
