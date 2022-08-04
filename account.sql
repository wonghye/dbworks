-- account 테이블 생성
CREATE TABLE account(
    ano     VARCHAR2(20) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('111-222-1234', '최혜원', 1000);

COMMIT;

SELECT * FROM account;