-- 조인 : 1개 이상의 테이블을 연결
-- 동등 조인 : 조인 조건이 정확히 일치하는 경우에는 결과를 출력
-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오.
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid;

--고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
SELECT  customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

--'안산' 고객의 주문내역을 검색하시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
AND customer.name = '안산';


-- 고객 이름별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT customer.name, SUM(saleprice) AS 총판매액
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name
ORDER BY customer.name;

-- 고객의 이름과 주문한 도서의 이름 및 가격을 검색하시오
SELECT customer.name, book.bookname, orders.saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND book.bookid = orders.bookid;


-- 가격이 20000원 도서를 주문한 고객의 이름과 주문한 도서의 이름을 검색하시오
SELECT customer.name, book.bookname, orders.saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND book.bookid = orders.bookid
AND book.price = 20000;


--외부 조인 (outer join) : 조인 조건이 정확히 일치하지 않아도 모든 결과를 출력
--도서를 구매하지 않은 고객을 포함하여 
-- 고객의 이름과 고객이 주문한 도서의 판매 가격을 구하시오
SELECT customer.name, orders.saleprice
FROM customer LEFT OUTER JOIN orders
    ON customer.custid = orders.custid;
