/* Write your PL/SQL query statement below */
SELECT employee_id, department_id
  FROM employee emp
 WHERE     (   1 = (  SELECT COUNT (*)
                        FROM employee emp1
                       WHERE emp.employee_id = emp1.employee_id
                    GROUP BY employee_id
                      HAVING COUNT (*) = 1)
            OR primary_flag = 'Y');
