-- NEW USER 만들때 시스템에서 
-- USER - C##SPRING 생성 비밀번호 - SPRING

CREATE USER c##spring IDENTIFIED BY spring
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 권한 설정
GRANT CONNECT, DBA TO c##spring;
