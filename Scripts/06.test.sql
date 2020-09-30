-- 접속자 확인
SELECT USER FROM DUAL;

SELECT * 
  FROM USER_TABLES 
 WHERE table_name NOT IN ('DEPARTMENT', 'EMPLOYEE');
 
select stud_id as studId, name, email, dob, phone 
  from students 
 where stud_id=1;