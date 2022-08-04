use jspdb;

select * from user;
select * from user where uid=129;
-- 손흥민을 추신수로 변경
update user set name='추신수' where uid=120;

-- 타입버전 
desc user;
-- 필드(열) 추가
alter table user add phone varchar(20);

create table user(
	id int not null,
    pwd varchar(20) not null,
    name varchar(20),
    primary key(id)
);

-- 정보 추가
insert into user(id, pwd, name) values (120, 'skyblue','손흥민');
insert into user(id, pwd, name) values (158, 'river','남한강');

-- 남한강전화번호 업데이트
update user set phone='010-1234-5678' where id=158;

commit;