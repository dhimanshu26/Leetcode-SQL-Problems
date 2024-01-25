/* Write your PL/SQL query statement below */
WITH
    top_three_salary
    AS
        (SELECT dept.name                                               department,
                emp.name                                                employee,
                salary,
                DENSE_RANK ()
                    OVER (PARTITION BY dept.id ORDER BY salary DESC)    salary_order
           FROM employee emp, department dept
          WHERE emp.departmentid = dept.id)
SELECT department, employee, salary
  FROM top_three_salary
 WHERE salary_order <= 3;
