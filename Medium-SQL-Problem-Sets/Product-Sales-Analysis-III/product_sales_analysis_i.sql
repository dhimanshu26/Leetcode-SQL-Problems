/* Write your PL/SQL query statement below */
WITH
    first_year_sales
    AS
        (SELECT prd.product_id,
                sl.year first_year,
                sl.quantity,
                sl.price,
                RANK () OVER (PARTITION BY prd.product_id ORDER BY year)    product_rank
           FROM product prd, sales sl
          WHERE prd.product_id = sl.product_id)
SELECT product_id,
       first_year,
       quantity,
       price
  FROM first_year_sales
 WHERE product_rank = 1;
