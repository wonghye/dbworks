-- ���� �Խ���
CREATE TABLE tbl_humor(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    likeNum NUMBER(5) DEFAULT 0
);

-- ���� �Խ���
CREATE TABLE tbl_horror(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    likeNum NUMBER(5) DEFAULT 0
);

--�ڵ� ��ȣ
CREATE SEQUENCE seq;
CREATE SEQUENCE humorSeq; --���� �ڵ� ��ȣ
CREATE SEQUENCE horrorSeq; -- ȣ�� �ڵ� ��ȣ

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

COMMIT;