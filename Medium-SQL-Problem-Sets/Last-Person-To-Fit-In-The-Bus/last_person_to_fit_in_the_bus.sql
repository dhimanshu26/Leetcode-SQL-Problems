WITH
    cte_last_person
    AS
        (SELECT person_id,
                person_name,
                weight,
                SUM (weight) OVER (ORDER BY turn)     running_weight,
                turn
           FROM queue)
SELECT DISTINCT
       FIRST_VALUE (person_name) OVER (ORDER BY turn DESC)     person_name
  FROM cte_last_person
 WHERE running_weight <= 1000;
