-- 테이블 만들기
CREATE TABLE ex1(
    column1 CHAR(10),  -- 고정길이
    column2 VARCHAR2(10),  -- 가변길이
    column3 NUMBER  -- 
)

--데이터 입력
INSERT INTO ex1 (column1, column2, column3) VALUES ('abc','abc',10);
INSERT INTO ex1 (column1, column2) VALUES ('우리','우리');

--자료의 삽입, 삭제, 수정 등이 변경이 있을 때 필수 실행
COMMIT;

--데이터 검색(전체 검색)
SELECT * FROM ex1;

--특정 칼럼(열) 검색
SELECT column1, column2 FROM ex1;

--CHAR 과 VARCHAR2 의 크기 비교
--칼럼에 별칭 만드는 방법 : 칼럼명 AS 별명 
SELECT column1, LENGTH(column1) AS len1,
    column2, LENGTH(column2) AS len2
    FROM ex1;
