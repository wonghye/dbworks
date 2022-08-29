-- 비즈니스 컴포넌트(BoardWeb) board 테이블
CREATE TABLE board2(
    bno  NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);

-- 자동 번호
CREATE SEQUENCE seq2;

-- users 테이블 생성
CREATE TABLE users2(
    id  VARCHAR2(8) PRIMARY KEY,
    passwd  VARCHAR2(8) NOT NULL,
    name  VARCHAR2(20) NOT NULL,
    role  VARCHAR2(5)
);

-- 게시글 추가
INSERT INTO board2(bno, title, writer, content)
VALUES (seq2.nextval, '가입인사', '관리자', '잘 부탁드립니다.');

-- 회원 추가
INSERT INTO users2
VALUES ('test', 'test123', '관리자', 'Admin');
INSERT INTO users2
VALUES ('user1', 'user123', '장그래', 'User');

SELECT * FROM board2 ORDER BY bno DESC;
SELECT * FROM users2;

DELETE FROM board2 WHERE bno=21;

COMMIT;

