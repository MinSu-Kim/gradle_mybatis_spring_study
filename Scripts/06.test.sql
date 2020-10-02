-- 접속자 확인
SELECT USER FROM DUAL;

SELECT * 
  FROM USER_TABLES 
 WHERE table_name NOT IN ('DEPARTMENT', 'EMPLOYEE');
 
select stud_id as studId, name, email, dob, phone, gender 
  from students 
 where stud_id=1;
 
select stud_id, name, email, dob, phone, 
               substr(phone, 1, 3) as f, 
               substr(phone, 5, 3) as m, 
               substr(phone, 9, 4) as l
  from students where stud_id=1;
  
DELETE FROM students WHERE STUD_ID  = 4;

SELECT * FROM user_pics;

select course_id, name, description, start_date, end_date, tutor_id from courses WHERE tutor_id = 1;

select course_id, name, description, start_date, end_date, tutor_id 
  from courses 
 WHERE name like '%Java%';
 
select course_id, name, description, start_date, end_date, tutor_id from courses WHERE start_date >= '2013-02-01';

--
SELECT TUTOR_ID, NAME, EMAIL, PHONE, DOB, BIO, PIC, ADDR_ID FROM TUTORS;

INSERT INTO TUTORS(TUTOR_ID, NAME, EMAIL, PHONE, DOB, BIO, PIC, ADDR_ID) 
VALUES  (1,'John','john@gmail.com','111-222-3333','1980-05-20',NULL,NULL,1);



SELECT COURSE_ID, NAME, DESCRIPTION, START_DATE, END_DATE, TUTOR_ID FROM COURSES;
INSERT INTO COURSES(COURSE_ID, NAME, DESCRIPTION, START_DATE, END_DATE, TUTOR_ID) VALUES (1,'Quickstart Core Java','Core Java Programming','2013-03-01','2013-04-15',1) 

---

SELECT TUTOR_ID, NAME, EMAIL, PHONE, DOB, BIO, PIC, ADDR_ID FROM TUTORS;
SELECT COURSE_ID, NAME, DESCRIPTION, START_DATE, END_DATE, TUTOR_ID FROM COURSES;

