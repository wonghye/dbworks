-- shop db 생성
create database shopdb;

-- shop db 권한 주기
grant all privileges on shopdb.* to root@localhost with grant option;

show databases;

use shopdb;

show tables;

select * from member;
select * from orders;
select * from cart;
select * from cart_item;
select * from item order by reg_time desc;
select * from item_img order by reg_time desc;
select * from orders order by reg_time desc;
select * from order_item order by reg_time desc;