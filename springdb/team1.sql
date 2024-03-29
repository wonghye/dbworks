-- 유머 게시판
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

-- 공포 게시판
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

-- tbl_member 테이블 생성
CREATE TABLE tbl_member(
    userid      VARCHAR2(50) PRIMARY KEY,
    userpw       VARCHAR2(100) NOT NULL,
    username   VARCHAR2(100) NOT NULL,
    regdate       DATE DEFAULT SYSDATE,
    updatedate  DATE DEFAULT SYSDATE,
    enabled       CHAR(1) DEFAULT '1',
    email       VARCHAR2(50) NOT NULL
);

--권한 인증 테이블
CREATE TABLE tbl_member_auth(
    auth    VARCHAR2(50) NOT NULL,
    userid  VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY (userid)
    REFERENCES tbl_member(userid) ON DELETE CASCADE
);

--관리자 권한 변경
UPDATE tbl_member_auth SET auth='ROLE_ADMIN' WHERE userid='admin';

-- 외부 조인 : 특정 member의 회원정보와 권한 정보를 출력
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

--시퀀스 생성
CREATE SEQUENCE humorSeq;
CREATE SEQUENCE horrorSeq;


--게시글 추가
INSERT INTO tbl_board(bno, title, writer, content) 
VALUES (seq.nextval, '가입인사', '관리자', '잘 부탁드립니다.');

INSERT INTO tbl_humor(bno, title, writer, content) 
VALUES (humorSeq.nextval, '유머', '재밌음', '잘 부탁드립니다.');

INSERT INTO tbl_horror(bno, title, writer, content) 
VALUES (horrorSeq.nextval, '호러', '무서움', '잘 부탁드립니다.');

 -- 더미 데이터
 INSERT INTO tbl_humor (bno, title, writer, content) VALUES (humorSeq.nextval, '개웃겨','admin','테스트내용입니다');
  INSERT INTO tbl_horror (bno, title, writer, content) VALUES (horrorSeq.nextval, '충격실화 인신매매 당할뻔한 썰','','테스트내용입니다');
 --재귀 복사
 INSERT INTO tbl_humor (bno, title, writer, content) SELECT humorSeq.nextval, title, writer, content
 FROM tbl_humor;
 INSERT INTO tbl_horror (bno, title, writer, content) SELECT horrorSeq.nextval, title, writer, content
 FROM tbl_horror;


SELECT * FROM tbl_board;
SELECT * FROM tbl_humor;
SELECT * FROM tbl_horror;
SELECT * FROM tbl_member;

DELETE FROM tbl_humor;
DELETE FROM tbl_horror;

DROP TABLE tbl_humor;
DROP TABLE tbl_horror;

COMMIT;