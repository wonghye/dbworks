-- spring ������Ʈ ���
 CREATE TABLE tbl_board(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
 );
 
  -- �ڵ���ȣ
 CREATE SEQUENCE seq;
 
  -- users ���̺� ����
 CREATE TABLE tbl_user(
    id VARCHAR2(8) PRIMARY KEY,
    passwd VARCHAR2(8) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    role VARCHAR2(5)
 );
 
 -- �Խñ� �߰�
INSERT INTO tbl_board(bno, title, writer, content)
VALUES (seq.nextval, '�����λ�','������','�� ��Ź�帳�ϴ�.');

-- ȸ�� �߰�
INSERT INTO tbl_user
VALUES ('test','test123','������','Admin');
INSERT INTO tbl_user
VALUES ('user1','user123','��׷�','User');

SELECT * FROM tbl_board;
SELECT * FROM tbl_user;


SELECT * FROM tbl_board AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '1'HOUR) WHERE bno=4;

INSERT INTO tbl_board SELECT * FROM tbl_board AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '1'HOUR)WHERE bno=4;


COMMIT;