-- 유머 게시판
CREATE TABLE tbl_humor(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    likeNum NUMBER(5) DEFAULT 0
);

-- 공포 게시판
CREATE TABLE tbl_horror(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    likeNum NUMBER(5) DEFAULT 0
);

--자동 번호
CREATE SEQUENCE seq;
CREATE SEQUENCE humorSeq; --유머 자동 번호
CREATE SEQUENCE horrorSeq; -- 호러 자동 번호

--게시글 추가
INSERT INTO tbl_board(bno, title, writer, content) 
VALUES (seq.nextval, '가입인사', '관리자', '잘 부탁드립니다.');

INSERT INTO tbl_humor(bno, title, writer, content) 
VALUES (humorSeq.nextval, '유머', '재밌음', '잘 부탁드립니다.');

INSERT INTO tbl_horror(bno, title, writer, content) 
VALUES (horrorSeq.nextval, '호러', '무서움', '잘 부탁드립니다.');


SELECT * FROM tbl_board;
SELECT * FROM tbl_humor;
SELECT * FROM tbl_horror;
SELECT * FROM tbl_member;

DROP TABLE tbl_humor;

COMMIT;