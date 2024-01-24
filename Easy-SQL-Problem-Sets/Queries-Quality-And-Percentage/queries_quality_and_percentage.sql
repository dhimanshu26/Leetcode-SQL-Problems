/* Write your PL/SQL query statement below */
SELECT q.query_name,
         ROUND (AVG (q.rating / q.position), 2)                           quality,
         ROUND (AVG ((CASE WHEN q.rating < 3 THEN 1 ELSE 0 END) * 100), 2)    poor_query_percentage
    FROM queries q
   WHERE query_name IS NOT NULL
GROUP BY q.query_name;
