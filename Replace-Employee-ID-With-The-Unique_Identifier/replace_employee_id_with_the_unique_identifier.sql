SELECT euni.unique_id, emp.name
  FROM employees emp, employeeuni euni
WHERE emp.id = euni.id(+);
