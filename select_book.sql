--모든 도서의 이름과 가격을 검색하시오
SELECT bookname,price FROM book;

--모든 도서의 도서번호, 도서이름, 출판사,가격을 검색하시오
SELECT bookid, bookname, publisher, price FROM book;

--모든 출판사를 검색하시오. (중복 제거 - DISTINCT)
SELECT DISTINCT publisher FROM book;

--조건절 WHERE 사용
--가격이 20000원 미만인 도서를 검색
SELECT * 
FROM book 
WHERE price < 20000;

--가격이 10000원 이상 20000원 이하인 도서 검색
-- 범위: BETWEEN ~ AND 사용
SELECT * 
FROM book 
WHERE price BETWEEN 10000 AND  20000;

SELECT * 
FROM book 
WHERE price >= 10000 AND  price <=20000;

-- IN(A,B) : A 또는 B
--출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
SELECT *
FROM book
WHERE publisher IN('굿스포츠','대한미디어');

SELECT *
FROM book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

--출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오
SELECT *
FROM book
WHERE publisher NOT IN('굿스포츠','대한미디어');

--LIKE 연산자
-- '축구의 역사'를 출간한 출판사 검색
SELECT *
FROM book
WHERE bookname LIKE '축구의 역사';

--도서 이름에 '축구'가 포함되는 출판사 검색
--시작 하는 문장 : %단어 , 끝나는 문장 : 단어%
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%축구%';

--'축구'에 관한 도서 중 가격이 20000원 이상인 도서 검색
SELECT bookname, publisher ,price
FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

--도서를 이름순으로 정렬하시오
SELECT * 
FROM book
ORDER BY bookname DESC;

--도서를 가격의 내림차순으로 검색하고, 가격이 같으면 출판사를 오름차순 검색
SELECT * 
FROM book
ORDER BY price DESC, publisher ASC;
