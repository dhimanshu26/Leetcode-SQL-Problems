/* Write your PL/SQL query statement below */
SELECT ROUND (SUM (tiv_2016), 2)     tiv_2016
  FROM insurance ins
 WHERE     tiv_2015 IN (SELECT tiv_2015
                          FROM insurance ins_sub
                         WHERE ins_sub.pid <> ins.pid)
       AND ins.lat || ins.lon NOT IN (SELECT ins_sub2.lat || ins_sub2.lon
                                        FROM insurance ins_sub2
                                       WHERE ins_sub2.pid <> ins.pid);
