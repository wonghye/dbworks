-- ����Ͻ� ������Ʈ(BoardWeb) board ���̺�
CREATE TABLE board2(
    bno  NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);

-- �ڵ� ��ȣ
CREATE SEQUENCE seq2;

-- users ���̺� ����
CREATE TABLE users2(
    id  VARCHAR2(8) PRIMARY KEY,
    passwd  VARCHAR2(8) NOT NULL,
    name  VARCHAR2(20) NOT NULL,
    role  VARCHAR2(5)
);

-- �Խñ� �߰�
INSERT INTO board2(bno, title, writer, content)
VALUES (seq2.nextval, '�����λ�', '������', '�� ��Ź�帳�ϴ�.');

-- ȸ�� �߰�
INSERT INTO users2
VALUES ('test', 'test123', '������', 'Admin');
INSERT INTO users2
VALUES ('user1', 'user123', '��׷�', 'User');

SELECT * FROM board2 ORDER BY bno DESC;
SELECT * FROM users2;

DELETE FROM board2 WHERE bno=21;

COMMIT;

