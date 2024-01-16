/* Write your PL/SQL query statement below */
SELECT prj.project_id, ROUND (AVG (emp.experience_years), 2) average_years
    FROM employee emp, project prj
   WHERE emp.employee_id(+) = prj.employee_id
GROUP BY prj.project_id;
