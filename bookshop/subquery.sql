--���� ���� (�μ�����)
--WHERE������ ���
--���� ��� ������ �̸��� �˻��Ͻÿ�
SELECT bookname , price
FROM book
WHERE price = (SELECT MAX(price)FROM book);

--������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT name 
FROM customer
WHERE custid IN (SELECT custid 
                FROM orders);
                
--������ ���� �ֹ������� �˻��Ͻÿ�
SELECT * 
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '������');
                
                
-- �̻� �̵��� ������ ������ ������ ���� �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE custid IN (SELECT custid
                FROM orders
                WHERE bookid IN (SELECT bookid
                                FROM book
                                WHERE publisher ='�̻�̵��'));
                                
--���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ �˻��Ͻÿ�
-- Ʃ�� ���� : ���̺��� �̸��� ��Ī
SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
                FROM book b2
                WHERE b2.publisher = b1.publisher);

-- ���ǻ纰 ��� �ݾ�
SELECT AVG(price)
FROM book
GROUP BY publisher;

-- �ζ��� �� :from �μ� ����
-- �� ��ȣ�� 2������ ���� �Ǹž��� �˻��Ͻÿ�


                
SELECT * FROM book;                