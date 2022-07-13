-- 학교 데이터베이스
-- 학과 테이블 생성

CREATE TABLE major(
    dname   VARCHAR2(30),  -- 학과명
    dtel    VARCHAR2(20),  -- 전화번호
    location VARCHAR2(20),  -- 사무실 위치
    PRIMARY KEY(dname)
);

-- 교수 테이블 생성
CREATE TABLE professor(
    pnumber NUMBER(3),   -- 교수번호
    pname  VARCHAR2(20),  -- 교수이름
    major   VARCHAR2(30),  -- 전공분야
    PRIMARY KEY(pnumber)
);

--학생 테이블 생성
CREATE TABLE student(
    snumber   NUMBER(10) PRIMARY KEY,
    sname    VARCHAR2(20) NOT NULL,
    age      NUMBER(3),
    gender   VARCHAR2(4),
    address  VARCHAR2(30),
    dname  VARCHAR2(30) NOT NULL,
    pnumber  NUMBER(3) NOT NULL,
    CONSTRAINT FK_maj_std FOREIGN KEY(dname)
    REFERENCES major(dname),  -- 외래키 -  학과명
    --CONSTRAINT FK_pro_std FOREIGN KEY(pnumber)
    --REFERENCES professor(pnumber)  -- 외래키 -  교수번호
);

-- 학과자료
INSERT INTO major VALUES ('소프트웨어학과','02-123-4567','B동 3층');
INSERT INTO major VALUES ('화학공학과','02-123-5678','B동 4층');
INSERT INTO major VALUES ('전기전자공학과','02-123-6789','B동 5층');

-- 교수 자료
INSERT INTO professor VALUES (301,'박은종','JAVA 프로그래밍');
INSERT INTO professor VALUES (402,'송미영','JSP 웹프로그래밍');
INSERT INTO professor VALUES (501,'오용철','데이터베이스');

--학생자료
INSERT INTO student
VALUES (20221234,'이강',22,'여','서울시 구로구' , '소프트웨어학과',301);
INSERT INTO student
VALUES (20221235,'박대양',25,'남','서울시 성동구' , '전기전자공학과',501);
INSERT INTO student
VALUES (20221236,'한비야',23,'여','서울시 강남구' , '소프트웨어학과',301);
INSERT INTO student
VALUES (20221237,'정산들',27,'여','경기도 수원시' , '화학공학과',501);


COMMIT;

SELECT * FROM student;

DELETE FROM professor WHERE pnumber = 301;

--제약조건 삭제(변경)
ALTER TABLE student DROP CONSTRAINT FK_pro_std;

--제약조건 추가
ALTER TABLE student ADD CONSTRAINT FK_pro_std
FOREIGN KEY(pnumber) REFERENCES professor(pnumber);

DESC student;