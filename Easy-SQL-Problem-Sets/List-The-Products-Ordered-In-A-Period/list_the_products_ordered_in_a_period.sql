/* Write your PL/SQL query statement below */
SELECT p.product_name, SUM (unit) unit
    FROM products p, orders o
   WHERE     p.product_id = o.product_id
         AND TO_CHAR (o.order_date, 'MON-YYYY') = 'FEB-2020'
GROUP BY p.product_name
  HAVING SUM (unit) >= 100;
