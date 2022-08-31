-- spring board2 회원 테이블 생성
CREATE TABLE tbl_member(
    userid VARCHAR2(50) PRIMARY KEY,
    userpw VARCHAR2(100) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    regdate  DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    enabled CHAR(1) DEFAULT '1'
);

-- 권한 인증 테이블
CREATE TABLE tbl_member_auth(
    auth VARCHAR2(50) NOT NULL,
    userid  VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY (userid)
    REFERENCES tbl_member(userid)
);

-- 외부 조인 : 특정 member의 회원정보와 권한 정보를 출력
SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth
FROM tbl_member mem 
    LEFT OUTER JOIN tbl_member_auth auth
    ON mem.userid = auth.userid
WHERE mem.userid = 'admin90';    


SELECT * FROM tbl_member;
SELECT * FROM tbl_member_auth;

DROP TABLE tbl_member;