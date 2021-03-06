-- 접속자 확인
SELECT USER FROM DUAL;

/* 주소 */
DROP TABLE addresses CASCADE CONSTRAINTS;

/* 과목 */
DROP TABLE courses   CASCADE CONSTRAINTS;

/* 수강등록 */
DROP TABLE course_enrollment CASCADE CONSTRAINTS;

/* 학생 */
DROP TABLE students CASCADE CONSTRAINTS;

/* 교수 */
DROP TABLE tutors CASCADE CONSTRAINTS;


/* 주소 */
CREATE TABLE addresses (
    addr_id NUMBER NOT NULL, /* 주소코드 */
    street VARCHAR2(50) NOT NULL, /* 도로 */
    city VARCHAR2(50) NOT NULL, /* 시 */
    state VARCHAR2(50) NOT NULL, /* 구 */
    zip VARCHAR2(10), /* 우편번호 */
    country VARCHAR2(50) NOT NULL /* 읍 */
);
ALTER TABLE ADDRESSES ADD  CONSTRAINT PK_ADDRESS_ID  PRIMARY KEY (addr_id);


/* 과목 */
CREATE TABLE courses (
    course_id NUMBER NOT NULL, /* 과목코드 */
    name VARCHAR2(100) NOT NULL, /* 과목명 */
    description VARCHAR2(512), /* 설명 */
    start_date DATE, /* 시작일 */
    end_date DATE, /* 종료일 */
    tutor_id NUMBER NOT NULL /* 교수번호 */
);
ALTER TABLE courses ADD CONSTRAINT PK_COURSE_ID PRIMARY KEY (course_id);

/* 수강등록 */
CREATE TABLE course_enrollment (
    course_id NUMBER NOT NULL, /* 과목코드 */
    stud_id NUMBER NOT NULL /* 학생코드 */
);
ALTER TABLE course_enrollment ADD CONSTRAINT PK_COURSE_ENROLL_CID_SID PRIMARY KEY (course_id, stud_id);

/* 학생 */
CREATE TABLE students (
    stud_id NUMBER NOT NULL, /* 학생코드 */
    name VARCHAR2(50) NOT NULL, /* 이름 */
    email VARCHAR2(50) NOT NULL, /* 이메일 */
    phone NCHAR(13), /* 연락처 */
    dob DATE, /* 생일 */
    bio CLOB, /* 자기소개 */
    pic BLOB, /* 사진 */
    addr_id NUMBER /* 주소코드 */
);

ALTER TABLE students ADD CONSTRAINT PK_STUDENT_ID PRIMARY KEY (stud_id);

/* 교수 */
CREATE TABLE tutors (
    tutor_id NUMBER NOT NULL, /* 교수번호 */
    name VARCHAR2(50) NOT NULL, /* 이름 */
    email VARCHAR2(50) NOT NULL, /* 이메일 */
    phone NCHAR(13), /* 연락처 */
    dob DATE, /* 생일 */
    bio CLOB, /* 자기소개 */
    pic BLOB, /* 사진 */
    addr_id NUMBER /* 주소코드 */
);

ALTER TABLE tutors ADD CONSTRAINT PRIMARY PRIMARY KEY (tutor_id);
ALTER TABLE courses ADD CONSTRAINT FK_COURSE_TUTOR FOREIGN KEY (tutor_id)  REFERENCES tutors (tutor_id);
ALTER TABLE course_enrollment ADD CONSTRAINT FK_ENROLLMENT_COURSE FOREIGN KEY (course_id) REFERENCES courses (course_id);
ALTER TABLE course_enrollment ADD CONSTRAINT FK_ENROLLMENT_STUD FOREIGN KEY (stud_id) REFERENCES students (stud_id);
ALTER TABLE students ADD CONSTRAINT FK_STUDENTS_ADDR FOREIGN KEY ( addr_id ) REFERENCES addresses (addr_id);
ALTER TABLE tutors ADD CONSTRAINT FK_TUTORS_ADDR FOREIGN KEY (addr_id) REFERENCES addresses ( addr_id );

-- 주석
COMMENT ON TABLE addresses IS '주소';
COMMENT ON COLUMN addresses.addr_id IS '주소코드';
COMMENT ON COLUMN addresses.street IS '도로';
COMMENT ON COLUMN addresses.city IS '시';
COMMENT ON COLUMN addresses.state IS '구';
COMMENT ON COLUMN addresses.zip IS '우편번호';
COMMENT ON COLUMN addresses.country IS '읍';

COMMENT ON TABLE courses IS '과목';
COMMENT ON COLUMN courses.course_id IS '과목코드';
COMMENT ON COLUMN courses.name IS '과목명';
COMMENT ON COLUMN courses.description IS '설명';
COMMENT ON COLUMN courses.start_date IS '시작일';
COMMENT ON COLUMN courses.end_date IS '종료일';
COMMENT ON COLUMN courses.tutor_id IS '교수번호';

COMMENT ON TABLE course_enrollment IS '수강등록';
COMMENT ON COLUMN course_enrollment.course_id IS '과목코드';
COMMENT ON COLUMN course_enrollment.stud_id IS '학생코드';

COMMENT ON TABLE students IS '학생';
COMMENT ON COLUMN students.stud_id IS '학생코드';
COMMENT ON COLUMN students.name IS '이름';
COMMENT ON COLUMN students.email IS '이메일';
COMMENT ON COLUMN students.phone IS '연락처';
COMMENT ON COLUMN students.dob IS '생일';
COMMENT ON COLUMN students.bio IS '자기소개';
COMMENT ON COLUMN students.pic IS '사진';
COMMENT ON COLUMN students.addr_id IS '주소코드';

COMMENT ON TABLE tutors IS '교수';
COMMENT ON COLUMN tutors.tutor_id IS '교수번호';
COMMENT ON COLUMN tutors.name IS '이름';
COMMENT ON COLUMN tutors.email IS '이메일';
COMMENT ON COLUMN tutors.phone IS '연락처';
COMMENT ON COLUMN tutors.dob IS '생일';
COMMENT ON COLUMN tutors.bio IS '자기소개';
COMMENT ON COLUMN tutors.pic IS '사진';
COMMENT ON COLUMN tutors.addr_id IS '주소코드';


-- userpics
CREATE TABLE USER_PICS (
  ID   NUMBER NOT NULL ,
  NAME VARCHAR2(50) NOT NULL,
  PIC  BLOB ,
  BIO  CLOB ,
  PRIMARY KEY (ID)
);

CREATE SEQUENCE USER_PICS_ID_SEQ
    START WITH 1
    INCREMENT BY 1;


CREATE OR REPLACE TRIGGER TRI_USER_PICS_ID_SEQ
BEFORE INSERT ON USER_PICS
FOR EACH ROW 
BEGIN 
    IF Inserting AND :NEW.ID IS NULL THEN 
        SELECT USER_PICS_ID_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
END; 

