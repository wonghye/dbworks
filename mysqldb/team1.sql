use javaweb;
show tables;

CREATE TABLE tbl_member(
    userid      VARCHAR(50) PRIMARY KEY,
    userpw       VARCHAR(100) NOT NULL,
    username   VARCHAR(100) NOT NULL,
    regdate      DATE DEFAULT current_timestamp,
    updatedate  DATE DEFAULT current_timestamp,
    enabled       CHAR(1) DEFAULT '1',
    email       varchar(50) NOT NULL
);

create table tbl_board_f(
	bno int PRIMARY KEY,
    title VARCHAR(200),
    writer VARCHAR(20),
    content VARCHAR(2000),
    regdate DATE DEFAULT current_timestamp,
    cnt int DEFAULT 0,
    hit int default 0
);

create table tbl_board_h(
	bno int PRIMARY KEY,
    title VARCHAR(200),
    writer VARCHAR(20),
    content VARCHAR(2000),
    regdate DATE DEFAULT current_timestamp,
    cnt int DEFAULT 0,
    hit int default 0
);

