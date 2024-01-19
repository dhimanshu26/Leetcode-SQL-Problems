/* Write your PL/SQL query statement below */
SELECT TO_CHAR (activity_date, 'YYYY-MM-DD') day, COUNT (DISTINCT user_id) active_users
    FROM activity
   WHERE activity_date between '2019-06-28' and '2019-07-27'
GROUP BY activity_date;
