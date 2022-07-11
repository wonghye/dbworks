-- ex4의 테이블 생성
CREATE TABLE ex4(
    userId    VARCHAR2(10) PRIMARY KEY,   --기본키 선언
    passwd    VARCHAR2(10) NOT  NULL 
);

--테이블 이름 변경
ALTER TABLE ex4 RENAME TO member;

--가입일 칼럼 추가
ALTER TABLE member ADD regDate DATE;

--입사일 칼럼 추가
ALTER TABLE member ADD hireDate VARCHAR2(20);

--입사일 칼럼 수정
ALTER TABLE member MODIFY hireDate VARCHAR2(30);

--급여 칼럼 추가
ALTER TABLE member ADD salary NUMBER;

--데이터 삽입
INSERT INTO member (userId, passwd, regDate, salary, hireDate)
VALUES('cloud2022','abcd1234', SYSDATE , 1000000, '2022/05/09');
INSERT INTO member (userId, passwd, regDate, salary, hireDate)
VALUES('cloud2023','abcd1234', SYSDATE , 1000000, '2022/06/09');

INSERT INTO member (userId, passwd) VALUES ('sky2022','abcd123');
INSERT INTO member (userId, passwd) VALUES ('river2022','abcd1234');
INSERT INTO member (userId, passwd, regDate, salary) 
VALUES ('smile2022','abcd1234', SYSDATE, 1000000);

--데이터 수정 (update 테이블명 set 칼럼명 = 값 where 조건)
UPDATE member SET salary = 2000000 WHERE userId = 'smile2022';
UPDATE member SET salary = 1000000 WHERE userId = 'river2022';

--userid가 sky2022에 등록일과 급여 데이터 수정하기
UPDATE member SET regDate = SYSDATE, salary = 3000000  WHERE userId = 'sky2022';

--데이터 삭제(전체 데이터 삭제)
DELETE FROM member;

--데이터 1개 삭제
DELETE FROM member WHERE userId = 'river2022';

--커밋 수행
COMMIT;

--롤백 수행
ROLLBACK;

--데이터 조회
SELECT * FROM member;

--데이터 조회(정렬) order by -오름 차순 , desc - 내림차순
SELECT * FROM member ORDER BY salary DESC;

--특정 조건을 조회(select 칼럼명 from 테이블명 where 조건)
SELECT regDate FROM member WHERE userId = 'river2022';

--테이블 복사
CREATE TABLE member2 AS
SELECT * FROM member;

--테이블 삭제
DROP TABLE member2;

--테이블의구조
DESC member;