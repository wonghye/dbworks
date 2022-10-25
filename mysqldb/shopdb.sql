-- shop db 생성
create database shopdb;

-- shop db 권한 주기
grant all privileges on shopdb.* to root@localhost with grant option;

show databases;

use shopdb;

show tables;

select * from member;
select * from item;
select * from item_img;