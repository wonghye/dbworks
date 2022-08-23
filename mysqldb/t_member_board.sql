use javaweb;
show tables;

create table t_member(
	memberid varchar(20),
    passwd   varchar(20) not null,
    name 	varchar(30) not null,
    gender varchar(10),
    joindate timestamp default now(),
    primary key(memberId)
);

create table t_board(
	bnum int primary key auto_increment,
    title varchar(100) not null,
    content text,
    regdate timestamp default now(),
    hit int default 0,
    memberid varchar(20),
    constraint fk_member_board foreign key(memberid)
    references t_member(memberid) on delete cascade
);

insert into t_member values('winter','m12345','겨울','남',default);
insert into t_board values(1,'제목','글내용',default, 0, 'winter');

select * from t_board;

-- 게시글 총 개수
select count(*) total from t_board;

-- 특정한 행 조회 limit 행번호 , 개수 
select * from t_board order by bnum desc limit 0 , 5;

