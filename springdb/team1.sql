-- ���� �Խ���
CREATE TABLE tbl_humor(
    bno NUMBER(5),
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    likeNum NUMBER(5) DEFAULT 0
);

ALTER TABLE tbl_humor ADD CONSTRAINT pk_humor PRIMARY KEY(bno);

-- ���� �Խ���
CREATE TABLE tbl_horror(
    bno NUMBER(5),
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    likeNum NUMBER(5) DEFAULT 0
);

ALTER TABLE tbl_horror ADD CONSTRAINT pk_horror PRIMARY KEY(bno);

-- tbl_member ���̺� ����
CREATE TABLE tbl_member(
    userid      VARCHAR2(50) PRIMARY KEY,
    userpw       VARCHAR2(100) NOT NULL,
    username   VARCHAR2(100) NOT NULL,
    regdate       DATE DEFAULT SYSDATE,
    updatedate  DATE DEFAULT SYSDATE,
    enabled       CHAR(1) DEFAULT '1',
    email       VARCHAR2(50) NOT NULL
);

--���� ���� ���̺�
CREATE TABLE tbl_member_auth(
    auth    VARCHAR2(50) NOT NULL,
    userid  VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY (userid)
    REFERENCES tbl_member(userid) ON DELETE CASCADE
);

--������ ���� ����
UPDATE tbl_member_auth SET auth='ROLE_ADMIN' WHERE userid='admin';

-- �ܺ� ���� : Ư�� member�� ȸ�������� ���� ������ ���
SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth FROM tbl_member mem
    LEFT OUTER JOIN tbl_member_auth auth
    ON mem.userid = auth.userid
WHERE mem.userid = 'admin90';


SELECT * FROM tbl_member;
SELECT * FROM tbl_member_auth;

DROP TABLE tbl_member;
DROP TABLE tbl_member_auth;

COMMIT;

DROP SEQUENCE horrorSeq;

--������ ����
CREATE SEQUENCE humorSeq;
CREATE SEQUENCE horrorSeq;


--�Խñ� �߰�
INSERT INTO tbl_board(bno, title, writer, content) 
VALUES (seq.nextval, '�����λ�', '������', '�� ��Ź�帳�ϴ�.');

INSERT INTO tbl_humor(bno, title, writer, content) 
VALUES (humorSeq.nextval, '����', '�����', '�� ��Ź�帳�ϴ�.');

INSERT INTO tbl_horror(bno, title, writer, content) 
VALUES (horrorSeq.nextval, 'ȣ��', '������', '�� ��Ź�帳�ϴ�.');


SELECT * FROM tbl_board;
SELECT * FROM tbl_humor;
SELECT * FROM tbl_horror;
SELECT * FROM tbl_member;

DROP TABLE tbl_humor;
DROP TABLE tbl_horror;

COMMIT;