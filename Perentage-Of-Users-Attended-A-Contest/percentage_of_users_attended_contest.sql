/* Write your PL/SQL query statement below */
SELECT r.contest_id,
         ROUND (
             (COUNT (r.user_id) / (SELECT COUNT (*) FROM xxbackup.users)) * 100,
             2)    percentage
    FROM xxbackup.register r
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
