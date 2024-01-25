/* Write your PL/SQL query statement below */
DELETE FROM person
      WHERE id NOT IN (  SELECT MIN (id)
                           FROM person
                       GROUP BY email);
