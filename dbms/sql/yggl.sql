create database yggl;
use yggl;

create table departments(
departmentid char(3) not null primary key,
departmentname char(20) not null,
note text(16)
)engine=InnoDB,charset=utf8;

create table salary(
employeeid char(6) not null primary key,
income float(8) not null,
outcome float(8) not null
)engine=InnoDB,charset=utf8;

create table employees(
employeeid char(6) not null primary key,
name char(10) not null,
education char(4) not null,
brithday date not null,
gender char(2) not null,
workyear tinyint(1),
address varchar(20),
phonenumber char(12),
departmentid char(3) not null,
constraint fk_id foreign key (departmentid) references departments(departmentid)
)engine=InnoDB,charset=utf8;


insert into departments values('1', '财务部','NULL');
insert into departments values('2', '人力资源部','NULL');
insert into departments values('3', '经理办公室','NULL');
insert into departments values('4', '研发部','NULL');
insert into departments values('5', '市场部','NULL');

insert into salary values('000001','2100.8','123.09');
insert into salary values('010008','1582.62', '88.03');
insert into salary values('102201','2569.88', '185.65');
insert into salary values('111006','1987.01', '79.58');
insert into salary values('504209','2066.15', '108.0');
insert into salary values('302566','2980.7','210.2');
insert into salary values('108991','3259.98', '281.52');
insert into salary values('020010','2860.0','198.0');
insert into salary values('020018','2347.68', '180.0');
insert into salary values('308759','2531.98', '199.08');
insert into salary values('210678','2240.0','121.0');
insert into salary values('102208','1980.0','100.0');

insert into employees values('000001', '王林 ','大专','1966-01-23','1','8','中山路32-1-508','83355668','2');
insert into employees values('010008', '伍容华','本科','1976-03-28', '1', '3', '北京东路100-2','83321321','1');
insert into employees values('020010', '王向容', '硕士', '1982-12-09', '1', '2','四牌楼10-0-108','83792361','1');
insert into employees values('020018', '李丽 ','大专','1960-07-30', '0', '6', '中山东路102-2','83413301','1');
insert into employees values('102201', '刘明 ','本科','1972-10-18', '1', '3', '虎踞路100-2','83606608','5');
insert into employees values('102208', '朱俊 ','硕士','1965-09-28', '1', '2', '牌楼项5-3-106','84708817','5');
insert into employees values('108991', '钟敏 ','硕士', '1979-08-10', '0', '4', '中山路10-3-105','83346722','3');
insert into employees values('111006', '张石兵', '本科', '1974-10-01', '1','1', '解放路34-1-203','84563418','5');
insert into employees values('210678', '林涛 ','大专', '1977-04-02', '1', '2', '中山北路24-35','83467336','3');
insert into employees values('302566', '李玉明', '本科', '1968-09-20', '1', '3', '热河路209-3','58765991','4');
insert into employees values('308759', '叶凡 ','本科','1978-11-18', '1', '2', '北京西路3-7-52','83308901','4');
insert into employees values('504209', '陈琳琳', '大专', '1969-09-03', '0', '5', '汉中路120-4-12','84468158','4');
