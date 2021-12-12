use myschool;

select * from 교수;
select * from 강의;
select * from student;
select * from 전체성적;
select * from 석차와성적;
select * from 학생정보와성적;
select * from 수강신청;
select * from 성적;
select * from 성적정보 where code='1111';

create table 수강신청(
	강의번호 varchar(10) not null,
	교수번호 varchar(10) not null
);
insert into 수강신청 values ('C041','C029');
insert into 수강신청 values ('K031','K041');
insert into 수강신청 values ('MN09','MN23');


create table 성적(
	code varchar(10) not null primary key,
	컴파일러 int not null,
	한국어의미의이해 int not null,
	마케팅원론 int not null
);

insert into 성적 values ('1111',60,73,87);
insert into 성적 values ('2222',82,73,57);
insert into 성적 values ('3333',73,92,88);


create view 전체성적 as
	select *,(컴파일러+한국어의미의이해+마케팅원론) as 총점, ((컴파일러+한국어의미의이해+마케팅원론)/3) as 평균 from 성적;

select * from 전체성적;
--
create view 석차와성적 as
	select *,(select count(*)+1 from 전체성적 as a where a.평균 > b.평균) as 석차 from 전체성적 as b order by 평균 desc;

select * from 석차와성적;
--
create view 학생정보와성적 as 
	select a.*, b.컴파일러, b.한국어의미의이해, b.마케팅원론, b.총점, b.평균, b.석차 from student a 
		join 석차와성적 b where a.code=b.code;

select * from 학생정보와성적 where code='1111';

select * from 학생정보와성적;
--
create view 컴파일러 as
	select a.강의번호, b.교수이름 from 수강신청 a
		join 교수 b on a.교수번호=b.교수번호 where 강의번호='C041' ;
create view 한국어의미의이해 as
	select a.강의번호, b.교수이름 from 수강신청 a
		join 교수 b on a.교수번호=b.교수번호 where 강의번호='K031';
create view 마케팅원론 as
	select a.강의번호, b.교수이름 from 수강신청 a
		join 교수 b on a.교수번호=b.교수번호 where 강의번호='MN09';

select * from 컴파일러;
select * from 한국어의미의이해;
select * from 마케팅원론;
--
create view 강의정보 as
	select a.강의번호, a.교수번호, b.교수이름 from 수강신청 a
		join 교수 b on a.교수번호=b.교수번호;
select * from 강의정보;
select * from 강의정보 where 강의번호='C041';
--
create view 성적정보 as
	select a.*, b.* from 학생정보와성적 a
		join 강의정보 b ;
select * from 성적정보 order by code asc;
--

