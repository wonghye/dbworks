show databases;

create database hidb;

-- 권한 주기
grant all privileges on hidb.* to root@localhost with grant option;

use hidb;
show tables;

select * from member;

SELECT * FROM hidb.member;