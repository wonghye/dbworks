 -- 비지니스 컴포넌트 boardWeb board 테이블
 CREATE TABLE boardWeb(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
 );
 
 -- 자동번호
 CREATE SEQUENCE seq;
 
 -- users 테이블 생성
 CREATE TABLE users(
    id VARCHAR2(8) PRIMARY KEY,
    passwd VARCHAR2(8) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    role VARCHAR2(5)
 );
 
 -- 게시글 추가
INSERT INTO boardWeb(bno, title, writer, content)
VALUES (seq.nextval, '가입인사','관리자','잘 부탁드립니다.');

-- 회원 추가
INSERT INTO users
VALUES ('test','test123','관리자','Admin');
INSERT INTO users
VALUES ('user1','user123','장그래','User');

SELECT * FROM boardWeb;
SELECT * FROM users;