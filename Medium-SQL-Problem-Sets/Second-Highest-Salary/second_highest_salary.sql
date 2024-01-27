/* Write your PL/SQL query statement below */
SELECT MAX (salary)     secondhighestsalary
  FROM employee
 WHERE     salary <> (SELECT MAX (salary)
                        FROM employee);
