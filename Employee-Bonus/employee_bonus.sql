/* Write your PL/SQL query statement below */
SELECT emp.name, bn.bonus
    FROM employee emp, bonus bn
   WHERE emp.empid = bn.empid(+) AND NVL (bn.bonus, 1) < 1000
ORDER BY emp.empid;
