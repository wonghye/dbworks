 -- �����Ͻ� ������Ʈ boardWeb board ���̺�
 CREATE TABLE boardWeb(
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
 CREATE TABLE users(
    id VARCHAR2(8) PRIMARY KEY,
    passwd VARCHAR2(8) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    role VARCHAR2(5)
 );
 
 -- �Խñ� �߰�
INSERT INTO boardWeb(bno, title, writer, content)
VALUES (seq.nextval, '�����λ�','������','�� ��Ź�帳�ϴ�.');

-- ȸ�� �߰�
INSERT INTO users
VALUES ('test','test123','������','Admin');
INSERT INTO users
VALUES ('user1','user123','��׷�','User');

SELECT * FROM boardWeb;
SELECT * FROM users;