-- 내장 함수  함수이름(매개변수) 
-- 숫자관련 함수
-- dual은 오라클에서만 사용하는 가상 테이블
-- 절대값 구하기
SELECT ABS(-10)
FROM dual;

--3.875를 소수 첫째자리까지 반올림한 값을 구하시오
SELECT ROUND(3.876, 1) AS 결과1,  -- 소수 첫째자리
        ROUND(3.876, 0) 결과2,  -- 정수
        ROUND(13.876, -1) 결과3,  -- 일의 자리
        ROUND(516.876, -2) 결과4  -- 십의 자리
FROM dual;


-- salary를 30일로 나눈 후 소수 자리수에 따라 절삭(버린)한 값 출력
SELECT salary, 
        salary/30 일급,
        TRUNC(salary/30,1) 결과1,
        TRUNC(salary/30,0) 결과2,
        TRUNC(salary/30,-1) 결과3,
        TRUNC(salary/30,-2) 결과4
FROM employee;


-- 고객별 평균 주문금액을 백원 단위로 반올림한 값을 구하시오
SELECT custid, 
        ROUND (AVG(saleprice),-2) 평균금액 
FROM orders
GROUP BY custid;


--문자 관련 함수
SELECT LPAD('cloud',10,'*') FROM dual;
SELECT RPAD('cloud',10,'*') FROM dual;


-- 부서 이름에서 처음부터 시작해서 두 개의 문자 출력
--SUBSTR(칼럼명, 시작인덱스, 글자수)
SELECT SUBSTR(deptname, 1, 2) 팀명
FROM department;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경하여 검색하시오.
SELECT bookid, 
        REPLACE(bookname, '야구','농구') bookname
FROM book;


-- 굿스포츠에서 출판한 도서의 제목과 글자수(BYTE수)를 검색하시오.
SELECT bookname 제목, 
        LENGTH(bookname) 글자수
FROM book
WHERE publisher = '굿스포츠';


-- 고객 이름에서 같은 성을 가진 사람의 인원수 구하시오.
--GROUP BY 절에 함수도 포함할 수 있음
SELECT SUBSTR(name, 1, 1) 성,
        COUNT(*) 인원
FROM customer
GROUP BY SUBSTR (name, 1 ,1);
