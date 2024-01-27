/* Write your PL/SQL query statement below */
WITH
    cte_products
    AS
        (SELECT DISTINCT sell_date, product
           FROM activities)
  SELECT to_char(sell_date, 'YYYY-MM-DD') sell_date,
         COUNT (1)                                                  num_sold,
         LISTAGG (product, ',') WITHIN GROUP (ORDER BY product)     products
    FROM cte_products
GROUP BY sell_date
ORDER BY sell_date;
