/* Write your PL/SQL query statement below */SELECT st.student_id,
         st.student_name,
         su.subject_name,
         (SELECT COUNT (*)
            FROM examinations ex
           WHERE     ex.student_id = st.student_id
                 AND ex.subject_name = su.subject_name)    attended_exams
    FROM students st, subjects su
   WHERE 1 = 1
ORDER BY st.student_id, su.subject_name;
