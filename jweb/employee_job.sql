-- 사원 
-- jweb이 없어서 employee_j로 수정했습니다.
CREATE TABLE employee_j(
    empid NUMBER(5) PRIMARY KEY,
    name  VARCHAR2(20) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    hiredate DATE NOT NULL   
);    
-- 경력
CREATE TABLE job_history(
    jobid  VARCHAR2(10) PRIMARY KEY,
    jobtitle VARCHAR2(20) NOT NULL,
    startdate DATE NOT NULL,
    enddate DATE NOT NULL,
    empid NUMBER(5),
CONSTRAINT EM_FK FOREIGN KEY(empid) REFERENCES employee_j(empid)
);

-- 자료 삽입
INSERT INTO employee_j VALUES (101,'장그래','010-1234-5678',TO_DATE('2015-08-01','YYYY-MM-DD'));
INSERT INTO job_history VALUES('IT_PROG','웹 프로그래머',TO_DATE('2018-01-01','YYYY-MM-DD'),TO_DATE('2020-12-31','YYYY-MM-DD'),101);


-- 자료 삽입시 오류 - 부모키가 없습니다 
INSERT INTO job_history VALUES('IT_PROG','과장',TO_DATE('2018-01-01','YYYY-MM-DD'),TO_DATE('2020-12-31','YYYY-MM-DD'),105);


-- 자료 삭제시 오류 - 자식 레코드가 발견되었습니다.
DELETE FROM employee_j WHERE empid = 101;


-- 자료 삭제
DELETE FROM employee_j WHERE empid= 105;

SELECT * FROM employee_j;
SELECT * FROM job_history;