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
    REFERENCES tbl_member(userid) ON DELETE CASCADE
);

-- 외부 조인 : 특정 member의 회원정보와 권한 정보를 출력
SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth
FROM tbl_member mem 
    LEFT OUTER JOIN tbl_member_auth auth
    ON mem.userid = auth.userid
WHERE mem.userid = 'admin10';    

-- 전체검색
SELECT mem.userid, mem.username, mem.regdate, auth.auth
FROM tbl_member mem, tbl_member_auth auth
WHERE mem.userid = auth.userid;  -- 기본키과 외래키로 찾음


SELECT * FROM tbl_member ORDER BY regdate DESC;
SELECT * FROM tbl_member ORDER BY userpw;
SELECT * FROM tbl_member_auth;

--관리자 권한 변경
UPDATE tbl_member_auth SET auth='ROLE_ADMIN' WHERE userid='cloud';
UPDATE tbl_member_auth SET auth='ROLE_USER' WHERE userid='admin';

DELETE tbl_member WHERE userid = 'admin';
DELETE tbl_member_auth WHERE userid = 'cloud';

DROP TABLE tbl_member;
DROP TABLE tbl_member_auth;