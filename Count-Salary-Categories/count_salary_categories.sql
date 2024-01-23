/* Write your PL/SQL query statement below */
SELECT 'Low Salary' category, COUNT (1) accounts_count
  FROM accounts
 WHERE income < 20000
UNION
SELECT 'Average Salary' category, COUNT (1) accounts_count
  FROM accounts
 WHERE income >= 20000 AND income <= 50000
UNION
SELECT 'High Salary' category, COUNT (1) accounts_count
  FROM accounts
 WHERE income > 50000;
