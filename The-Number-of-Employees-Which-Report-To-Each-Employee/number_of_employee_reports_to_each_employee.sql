/* Write your PL/SQL query statement below */
SELECT mgr.employee_id,
         mgr.name,
         COUNT (emp.employee_id)     reports_count,
         ROUND (AVG (emp.age))       average_age
    FROM employees emp, employees mgr
   WHERE mgr.employee_id = emp.reports_to
GROUP BY mgr.employee_id, mgr.name
ORDER BY mgr.employee_id;
