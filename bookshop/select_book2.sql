--���� �Լ� : sum , count , avg 
--�ֹ� ���̺� �˻�
SELECT * FROM orders;
SELECT * FROM book;
SELECT * FROM customer;

-- ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) AS �Ѹ���
FROM orders;

--'�迬��' ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) AS �Ѹ���
FROM orders
WHERE custid = 2;

--���� �ֹ��� ������ �� �Ǹž�, ��հ��� ���Ͻÿ�.
SELECT SUM(saleprice) AS Total,
    AVG(saleprice)  AS Average
FROM orders;

--���� ������ ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
SELECT COUNT(*) AS ���ǸŰǼ�
FROM orders;

-- ������ �ֹ��� ������ �� ������ �Ǹž��� ���Ͻÿ�.
-- �׷� group by
SELECT COUNT(*) ��������, SUM(saleprice) �Ѿ�
FROM orders;

SELECT custid, COUNT(*) ��������, SUM(saleprice) �Ѿ�
FROM orders
GROUP BY custid;

-- having �� : group by ���� ��� ��Ÿ���� �׷��� �����ϴ� ����
-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- �� 2���̻� ������ ���� �˻��Ͻÿ�.
SELECT custid, COUNT(*) ��������
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;