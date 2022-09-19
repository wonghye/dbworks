-- ��� ���̺�
CREATE TABLE tbl_reply(
    rno NUMBER(5),
    bno NUMBER(5) NOT NULL,
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replydate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);

-- �ڵ� ����
CREATE SEQUENCE seq_reply;

--�⺻Ű
ALTER TABLE tbl_reply ADD CONSTRAINT pk_reply PRIMARY KEY(rno);
-- �⺻Ű ���
ALTER TABLE tbl_reply DROP CONSTRAINT pk_reply;


-- �ܷ�Ű
ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_board
FOREIGN KEY(bno)REFERENCES tbl_board(bno);

-- ���̵����� (���) �Է�
INSERT INTO tbl_reply(rno, bno, reply, replyer)
VALUES (seq_reply.nextval, 2 ,'�ȳ��ϼ���..','cloud');

--��� ��ȸ
SELECT * FROM tbl_reply WHERE bno =2;


-- �Խ��� ���̺�
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
 
-- �ڵ���ȣ
CREATE SEQUENCE seq;

-- ��� ���� Į�� �߰�
ALTER TABLE tbl_board ADD replycnt NUMBER DEFAULT 0;

-- ��� �� ������Ʈ 
UPDATE tbl_board 
SET replycnt = 
    (
    SELECT COUNT(rno) FROM tbl_reply
    WHERE tbl_reply.bno = tbl_board.bno
    );
 