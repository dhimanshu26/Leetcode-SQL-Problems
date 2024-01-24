WITH
    cte_temperature
    AS
        (SELECT id,
                temperature,
                recordDate,
                LAG (temperature) OVER (ORDER BY recordDate)
                    yesterday_temperature,
                LAG (recordDate) OVER (ORDER BY recordDate)
                    previous_date
           FROM weather)
SELECT id
  FROM cte_temperature ct
 WHERE     ct.temperature > ct.yesterday_temperature
       AND ct.recordDate = ct.previous_date + 1;
