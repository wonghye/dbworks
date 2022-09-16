-- 0914 ����
 CREATE TABLE tbl_board(
    bno NUMBER(5),
    title VARCHAR2(200) NOT NULL,
    writer VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
 );
 --�⺻Ű ���� ���� ����
 ALTER TABLE tbl_board ADD CONSTRAINT pk_board
 PRIMARY KEY(bno);
 
 -- ���� ������
 INSERT INTO tbl_board (bno, title, writer, content) VALUES (seq.NEXTVAL,'�׽�Ʈ ����','admin','�׽�Ʈ�����Դϴ�');
 
 --��� ����
 INSERT INTO tbl_board (bno, title, writer, content) SELECT seq.NEXTVAL, title, writer, content
 FROM tbl_board;
 
 
 --BNO�� �����Ǹ� ��ȣ�� �߰����� �����
 --ROWNUM ���� Į���� �ƴ����� (VIEW) ���� (����) �����͸� ī��Ʈ�Ͽ� �������
SELECT ROWNUM bno, title, writer, content FROM tbl_board
 ORDER BY bno DESC;
 
 --�ε��� (index)�� �����ϱ�
 --��Ʈ�ֱ�
SELECT /*+ INDEX(tbl_board pk board) */
    ROWNUM, bno, title, writer, content
FROM tbl_board;

--1������ ��������
SELECT /*+ INDEX(tbl_board pk board) */
    ROWNUM, bno, title, writer, content
FROM tbl_board
WHERE ROWNUM <=10 ;

-- 2������ �������� (0���� ũ�� �����ؾ߸� �����ü�����)
SELECT /*+ INDEX(tbl_board pk board) */
    ROWNUM, bno, title, writer, content
FROM tbl_board
WHERE ROWNUM > 10 AND ROWNUM <=20 ;

--�������� (�ζ��� ��)
-- ROWNUM�� Ű�����̹Ƿ� ��Ī ���
SELECT * FROM 
(
    SELECT /*+ INDEX(tbl_board pk board) */
    ROWNUM rn, bno, title, writer, content
    FROM tbl_board
    WHERE ROWNUM <=20
)
WHERE rn >0;
 
-- ������ ó�� sql 
-- 1�������� ��� 
SELECT * FROM 
(
    SELECT /*+ INDEX(tbl_board pk board) */
    ROWNUM rn, bno, title, writer, content, regdate, updatedate, cnt
    FROM tbl_board
    WHERE ROWNUM <= (1 * 10)
)
WHERE rn > (1 - 1) * 10;  -- 2�� page
 
 
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


SELECT * FROM tbl_board ORDER BY regdate DESC;
SELECT * FROM tbl_user;
SELECT * FROM tbl_member;

DROP TABLE tbl_board;
DROP SEQUENCE seq;

COMMIT;