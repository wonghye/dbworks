
create table t_member2(
	memberid varchar(20),
    passwd   varchar(20) not null,
    name 	varchar(30) not null,
    gender varchar(10),
    joindate timestamp default now(),
    primary key(memberId)
);

create table t_board2(
	bnum int primary key auto_increment,
    title varchar(100) not null,
    content text,
    regdate timestamp default now(),
    hit int default 0,
    memberid varchar(20),
    constraint fk_member_board2 foreign key(memberid)
    references t_member2(memberid) on delete cascade
);

insert into t_member2 values ('cloud','m123456@','장그래','남',default);
insert into t_member2 values ('today','m123456@','장그래','남',default);
insert into t_board2 values (1, '제목입니다.', '글 내용입니다', default, 0, 'cloud');

select * from t_member2;
select * from t_board2;

use javaweb;


drop table t_member2;
drop table t_board2;