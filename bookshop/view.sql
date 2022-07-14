-- 뷰
--하나 이상의 테이블을 합하여 만드는 가상의 테이블로써 실제테이블처럼 
--사용할 수 있는 데이터베이스 개체.
--사용 이유 : 필요한 사용자에게 적절한 데이터를 제공(보고서)

-- 주소 '대한민국'을 포함하는 고객들로 구성된 뷰를 만드시오.
CREATE VIEW vw_Customer
AS SELECT * 
    FROM    customer
    WHERE address LIKE '%대한민국%';
    
-- 뷰 이름으로 검색
SELECT * FROM vw_Customer;

-- 고객의 이름과 주문 도서의 이름과 가격을 검색하시오
CREATE VIEW vw_Orders AS
SELECT customer.name, book.bookname , orders.saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND book.bookid = orders.bookid;

--뷰 검색
SELECT * FROM vw_Orders;

