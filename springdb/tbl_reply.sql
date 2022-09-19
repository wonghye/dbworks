-- 댓글 테이블
CREATE TABLE tbl_reply(
    rno NUMBER(5),
    bno NUMBER(5) NOT NULL,
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replydate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);

-- 자동 순번
CREATE SEQUENCE seq_reply;

--기본키
ALTER TABLE tbl_reply ADD CONSTRAINT pk_reply PRIMARY KEY(rno);
-- 기본키 드랍
ALTER TABLE tbl_reply DROP CONSTRAINT pk_reply;


-- 외래키
ALTER TABLE tbl_reply
ADD CONSTRAINT fk_reply_board
FOREIGN KEY(bno)REFERENCES tbl_board(bno);

-- 더미데이터 (댓글) 입력
INSERT INTO tbl_reply(rno, bno, reply, replyer)
VALUES (seq_reply.nextval, 2 ,'안녕하세요..','cloud');

--댓글 조회
SELECT * FROM tbl_reply WHERE bno =2;


-- 게시판 테이블
CREATE TABLE tbl_board(
    bno NUMBER(5),
    title VARCHAR2(200) NOT NULL,
    writer VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
 );
 --기본키 제약 조건 설정
 ALTER TABLE tbl_board ADD CONSTRAINT pk_board
 PRIMARY KEY(bno);
 
-- 자동번호
CREATE SEQUENCE seq;

-- 댓글 개수 칼럼 추가
ALTER TABLE tbl_board ADD replycnt NUMBER DEFAULT 0;

-- 댓글 수 업데이트 
UPDATE tbl_board 
SET replycnt = 
    (
    SELECT COUNT(rno) FROM tbl_reply
    WHERE tbl_reply.bno = tbl_board.bno
    );
 