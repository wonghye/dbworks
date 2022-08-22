-- ��� 
-- jweb�� ��� employee_j�� �����߽��ϴ�.
CREATE TABLE employee_j(
    empid NUMBER(5) PRIMARY KEY,
    name  VARCHAR2(20) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    hiredate DATE NOT NULL   
);    
-- ���
CREATE TABLE job_history(
    jobid  VARCHAR2(10) PRIMARY KEY,
    jobtitle VARCHAR2(20) NOT NULL,
    startdate DATE NOT NULL,
    enddate DATE NOT NULL,
    empid NUMBER(5),
CONSTRAINT EM_FK FOREIGN KEY(empid) REFERENCES employee_j(empid)
);

-- �ڷ� ����
INSERT INTO employee_j VALUES (101,'��׷�','010-1234-5678',TO_DATE('2015-08-01','YYYY-MM-DD'));
INSERT INTO job_history VALUES('IT_PROG','�� ���α׷���',TO_DATE('2018-01-01','YYYY-MM-DD'),TO_DATE('2020-12-31','YYYY-MM-DD'),101);


-- �ڷ� ���Խ� ���� - �θ�Ű�� �����ϴ� 
INSERT INTO job_history VALUES('IT_PROG','����',TO_DATE('2018-01-01','YYYY-MM-DD'),TO_DATE('2020-12-31','YYYY-MM-DD'),105);


-- �ڷ� ������ ���� - �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�.
DELETE FROM employee_j WHERE empid = 101;


-- �ڷ� ����
DELETE FROM employee_j WHERE empid= 105;

SELECT * FROM employee_j;
SELECT * FROM job_history;