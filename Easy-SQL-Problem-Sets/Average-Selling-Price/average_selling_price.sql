/* Write your PL/SQL query statement below */
SELECT prc.product_id,
         NVL (ROUND (SUM (uns.units * prc.price) / SUM (uns.units), 2), 0)    average_price
    FROM prices prc, unitssold uns
   WHERE     prc.product_id = uns.product_id(+)
         AND uns.purchase_date(+) BETWEEN prc.start_date AND prc.end_date
GROUP BY prc.product_id;
