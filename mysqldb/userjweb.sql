-- user 생성
create user jweb@localhost identified by '54321';
-- db 생성
create database javaweb;
-- db권한주기
grant all privileges on javaweb.* to jweb@localhost with grant option;