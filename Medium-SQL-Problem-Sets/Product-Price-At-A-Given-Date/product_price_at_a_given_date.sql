/* Write your PL/SQL query statement below */
WITH
    cte_max_price
    AS
        (SELECT DISTINCT
                product_id,
                MAX (change_date) OVER (PARTITION BY product_id)    new_change_date
           FROM products
          WHERE TRUNC (change_date) <= '2019-08-16')
SELECT DISTINCT product_id,
                NVL (
                    (SELECT new_price
                       FROM products prd1, cte_max_price cmp
                      WHERE     cmp.product_id = prd1.product_id
                            AND cmp.new_change_date = prd1.change_date
                            AND prd.product_id = prd1.product_id),
                    10)    price
  FROM products prd;
