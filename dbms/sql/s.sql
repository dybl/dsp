create database s;
use s;

create table student(
    sno char(10) primary key,
    sname varchar(6) not null,
    sbirth year not null,
    sgender enum('m','f') default 'f',
    saddress varchar(10),
    sqq char(10) unique
)engine=InnoDB,charset=utf8;


create table course(
    cno char(6) primary key,
    cname char(6) not null,
    ccredit tinyint default 3
)engine=InnoDB,charset=utf8;


create table sc(
    scno int primary key auto_increment,
    sno char(10),
    cno char(6),
    grade float(4,2),
    constraint fk_1 foreign key (sno) references student(sno),
    constraint fk_2 foreign key (cno) references course(cno)
)engine=InnoDB,charset=utf8;

create table ship(
    ssno int primary key auto_increment,
    ssclass char(6) not null,
    score float not null unique
)engine=InnoDB,charset=utf8;

create table log(
    lno int not null primary key auto_increment,
    ltime datetime not null,
    lop char(10)
)engine=InnoDB,charset=utf8;

insert into student values
    ('2018001','tom','1998','m','chn','12345'),
    ('2018002','jim','1999','m','usa',''),
    ('2018003','mary','1999','f','chn','54321'),
    ('2018004','tom2','2000','m','usa','55555'),
    ('2018005','jack','1999','m','esp','112233'),
    ('2018006','lily','1998','f','chn','223344'),
    ('2018009','t2','1998','f','chn','556677'),
    ('2018010','ja','2000','f','jp','889900');

insert into course(cno,cname,ccredit) values
    ('c001','math',3),
    ('c002','db',4),
    ('c003','os',2),
    ('c004','eng',3),
    ('c005','java',4);

insert into sc(sno,cno,grade) values
    ('2018001','c001',88),
    ('2018001','c002',89),
    ('2018001','c003',90),
    ('2018002','c002',66),
    ('2018003','c001',70);

insert into ship(ssclass,score) values('first','90'),('second','85'),('third','80');