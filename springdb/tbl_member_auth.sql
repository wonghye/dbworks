-- spring board2 ȸ�� ���̺� ����
CREATE TABLE tbl_member(
    userid VARCHAR2(50) PRIMARY KEY,
    userpw VARCHAR2(100) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    regdate  DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    enabled CHAR(1) DEFAULT '1'
);

-- ���� ���� ���̺�
CREATE TABLE tbl_member_auth(
    auth VARCHAR2(50) NOT NULL,
    userid  VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY (userid)
    REFERENCES tbl_member(userid)
);

-- �ܺ� ���� : Ư�� member�� ȸ�������� ���� ������ ���
SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth
FROM tbl_member mem 
    LEFT OUTER JOIN tbl_member_auth auth
    ON mem.userid = auth.userid
WHERE mem.userid = 'admin10';    


SELECT * FROM tbl_member ORDER BY regdate DESC;
SELECT * FROM tbl_member_auth;

DELETE tbl_member WHERE userid = 'cloud';
DELETE tbl_member_auth WHERE userid = 'cloud';

DROP TABLE tbl_member;
DROP TABLE tbl_member_auth;