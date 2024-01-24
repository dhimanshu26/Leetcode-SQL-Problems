/* Write your PL/SQL query statement below */
WITH
    cte_first_order
    AS
        (  SELECT MIN (order_date) first_order_date, customer_id
             FROM delivery
         GROUP BY customer_id)
SELECT ROUND (
           AVG (CASE WHEN dl.delivery_id IS NOT NULL THEN 1 ELSE 0 END) * 100,
           2)    immediate_percentage
  FROM cte_first_order cfo, delivery dl
 WHERE     cfo.customer_id = dl.customer_id(+)
       AND cfo.first_order_date = dl.customer_pref_delivery_date(+);
