/* Write your PL/SQL query statement below */
WITH
    cte_ratings_count
    AS
        (  SELECT COUNT (1) ratings_count, u.user_id, u.name
             FROM users u, movierating mr
            WHERE u.user_id = mr.user_id
         GROUP BY u.user_id, u.name
         ORDER BY 1 DESC, name),
    cte_average_rating
    AS
        (  SELECT AVG (mr.rating) avg_rating, m.movie_id, m.title
             FROM movies m, movierating mr
            WHERE     m.movie_id = mr.movie_id
                  AND created_at BETWEEN '2020-02-01'
                                             AND '2020-02-29'
         GROUP BY m.movie_id, m.title
         ORDER BY 1 DESC, m.title)
    SELECT FIRST_VALUE (name) OVER ()     results
      FROM cte_ratings_count
     WHERE ROWNUM <= 1
    UNION ALL
    SELECT FIRST_VALUE (title) OVER ()     results
      FROM cte_average_rating
     WHERE ROWNUM <= 1;
