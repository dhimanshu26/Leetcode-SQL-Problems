/* Write your PL/SQL query statement below */
SELECT (SELECT mgr1.name
            FROM employee mgr1
           WHERE mgr1.id = mgr.id)    name
    FROM employee emp, employee mgr
   WHERE emp.managerid = mgr.id
GROUP BY mgr.id
  HAVING COUNT (emp.id) >= 5;
