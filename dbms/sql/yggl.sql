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


/* 查询每个雇员的所有数据 */
select * from employees;

/*查询每个雇员的姓名、电话和地址*/
select name,address,phonenumber from employees;

/*查询EmployeeID为000001的雇员的地址和电话*/
select address,phonenumber from employees where employeeid="000001";

/*查询Employees表中女雇员的地址和电话,
使用AS子句将结果中各列的标题分别指定为地址、电话*/
select address as "地址",phonenumber as "电话" from employees where sex = "0";

/*查询Employees表中员工的姓名和性别,
要求gender值为1时显示为‘男’，为0时显示为‘女’*/
select name as "姓名",
 case 
  when sex="1" then "男"
  when sex="0" then "女"
 end as gender
from employees;

/*计算每个员工的实际收入*/
select employeeid,income-outcome as "实际收入" from salary;

/*获得员工总数*/
select count(*) from employees;

/*找出所有王姓员工的部门号*/
select departmentid from employees where name like "王%";

/*找出所有收入在2000~3000元之间的员工号码*/
select employeeid from salary where income between 2000 and 3000;



/* 查找在财务部工作的雇员的情况 */
select * from employees where departmentid = (select departmentid from departments where departmentname="财务部");

/* 查找研发部年龄不低于市场部所有雇员年龄的雇员的姓名 */
select name from employees where departmentid in (select departmentid from departments where departmentname="研发部") and birthday <= all(select birthday from employees where departmentid in(select departmentid from departments where departmentname="市场部"));

/* 查找比财务部所有的雇员收入都高的雇员的姓名 */
select name from employees where employeeid in (select employeeid from salary where income > all(select income from salary where employeeid in (select employeeid from employees where departmentid = (select departmentid from departments where departmentname="财务部"))));



/* 查询每个雇员的情况及其薪水的情况 */
select employees.*,salary.* from employees,salary where employees,salary where employees.employeeid=salary.employeeid;

/* 使用内连接的方法查询名字为“王林”的员工所在的部门 */
select departmentname from departments join employees on departments.departmentid=employees.departmentid where employees.name="王林";

/* 查找财务部收入在2000元以上的雇员姓名及其薪水详情 */
select name,income,outcome from employees,salary,departments where employees.employeeid=salary.employeeid and employees.departmentid=departments.departmentid and departmentname="财务部" and income>=2000;


/* 查找Employees中男性和女性的人数 */
select sex,count(sex) from employees group by sex;

/* 查找员工数超过2人的部门名称和员工数量 */
select departmentname,count(*) as "人数" from employees,departments where employees.departmentid=departments.departmentid group by employees.departmentid having count(*)>2;

/* 将Employees表中的员工号码由大到小排列 */
select employeeid from employees order by employeeid desc;

/* 返回Employees表中的前5位员工的信息 */
select * from employees limit 5;



/* 创建YGGL数据库上的视图DS_VIEW，视图包含Departments表的全部列 */
create view ds_view as select * from departments;

/* 创建YGGL数据库上的视图Employees_view，视图包含员工号码、姓名和实际收入 */
create view employees_view(employeeid,name,realincome) as select employees.employeeid,name,income-outcome from employees,salary where employees.employeeid=salary.employeeid;


/* 从视图DS_VIEW中查询出部门号为3的部门名称 */
select departmentname from ds_view where departmentid = "3";

/* 从视图Employees_view查询出姓名为"王林"的员工的实际收入 */
select realincome from employees_view where name="王林";


/* 向视图DS_VIEW中插入一行数据：6，财务部，财务管理 */
insert into ds_view values("6","财务部","财务管理");

/* 修改视图DS_VIEW，将部门号为5的部门名称修改为“生产车间” */
update ds_view set departmentname="生产车间" where departmentid="5";

/* 修改视图Employees_view中号码为000001的雇员的姓名为“王浩” */
update employees_view set name="王浩" where employeeid="000001";

/* 删除视图DS_VIEW中部门号为“1”的数据 */
delete from ds_view where departmentid="1";

/* 删除视图DS_VIEW */
drop view ds_view;



/*
| 不能更新视图的条件                                           |
| ------------------------------------------------------------ |
| 1  `视图中包含sum()、count()、MAX()和MIN()等函数`            |
| 2  `视图中包含UNION、UNION ALL、DISTINCT、GROUP BY和HAVING等关键字` |
| 3  `常量视图`                                                |
| 4  `视图中的SELECT中包含子查询`                              |
| 5  `由不可更新的视图导出的视图`                              |
| 6  `视图对应的表上存在没有默认值的列，而且该列没有包含在视图里` |
*/

/* 对YGGL数据库的Employees表中的DepartmentID列建立索引 */
create index depart_ind on employees(departmentid);

/*在Employees表的Name列和Address列上建立复合索引 */
create index ad_ind on employees(name,address);

/* 对Departments表上的DepartmentName列建立唯一性索引 */
create unique index dep_ind on departments(departmentname);

/* 向Employees表中的出生日期列添加一个唯一性索引，姓名列和性别列上添加一个复合索引 */
alter table employees add unique index date_ind(birthday),add index na_ind(name,sex);

/* 假设Departments表中没有主键，使用Alter Table语句将DepartmentID列设为主键 */
alter table employees add primary key(departmentid);


/* 创建与Departments表相同结构的表Departments1，将DepartmentName设为主键,DepartmentID建立一个索引 */
create table departments1
(
	departmentid char(3),
	departmentname char(20),
	note text,
	primary key(departmentname),
	index did_ind(departmentid)
);


/* 使用Drop Index语句删除表Employees上的索引 */
drop index depart_ind on employees;

/* 使用Alter Table语句删除Departments上的主键和索引 */
alter table departments drop primary key,drop index dep_ind;


/*
| 索引设计的原则                                 |
| ---------------------------------------------- |
| `选择唯一性索引`                               |
| `重复值越少，可以添加索引`                     |
| `为经常需要排序、分组和联合操作的字段建立索引` |
| `为常作为查询条件的字段建立索引`               |
| `限制索引的数目`                               |
| `尽量使用数据量少的索引`                       |
| `尽量使用前缀来索引`                           |
| `删除不在使用或者很少使用的索引`               |
*/

/* 使用root用户创建exam1用户，初始密码设置为123456 */
create user "exam1"@"localhost" identified by "123456";

/* 授权exam1用户对所有数据库拥有Select、Create、Drop和Grant权限 */
grant select,create,drop on *.* to "exam1"@"localhost" with grant option;

/* 查看exam1的权限 */
show grants for "exam1"@"localhost";
select * from mysql.user where user="exam1" and host="localhost";

/* 创建exam2，该用户没有初始密码 */
create user "exam2"@"localhost";

/* 用exam2登录，将其密码设置为787878 */
set password=password("787878");

/* 用exam1登录，为exam2授权为YGGL数据库的Employees表查看Name字段的权限 */
grant select(name) on yggl.employees to "exam2"@"localhost";

/* 用root登录，收回exam1和exam2的所有权限 */
revoke all privileges,grant option from "exam1"@"localhost","exam2"@"localhost";



/* 创建触发器，在Employees表中删除员工信息的同时将Salary表中该员工的信息删除，以确保数据完整性 */

create trigger delete_em after delete 
	on employees for each row
	delete from salary
		where employeeid=old.employeeid;
		
/* 假设Department2表和Department表的结构和内容都相同，在Departments上创建一个触发器，如果添加一个新的部门，该部门也会添加到Departments2表中 */

delimiter $$
create trigger departments_ins after insert
	on departments for each row
	begin
		insert into departments2 values(new.departmentid,new.departmentname,new.note);
	end$$
delimiter ;

/* 当修改表Employees时，若将Employees表中员工的工作时间增加1年，则将收入增加500，增加2年则增加1000，依次增加。若工作时间减少则无变化 */

delimiter $$
create trigger add_salary after update
	on employees for each row
	begin
		declare years integer;
		set years=new.workyear-old.workyear;
		if years>0 then
			update salary set income=income+500*years 
				where employeeid=new.employeeid;
		end if;
	end$$
delimiter ;
	


/* 创建存储过程，使用Employees表中的员工人数来初始化一个局部变量，并调用这个存储过程 */

delimiter $$
create procedure test(out number1 int)
begin
	declare number2 int;
	set number2=(select count(*) from employees);
	set number1=number2;
end$$
delimiter;
call test(@number);
select @number;

/* 创建存储过程，比较两个员工的实际收入，若前者比后者高就输出0，否则输出1 */

delimiter $$
create procedure compa(in id1 char(6),in ide2 char(6),out bj int)
begin
	declare sr1,sr2 float(8);
	select income-outcome into sr1 from salary where employeeid=id1;
	select income-outcome into sr2 from salary where employeeid=id2;
	if id1>id2 then set bj=0;
	else set bj=1;
	end if;
end $$
delimiter;
call compa('00001','108991',@bj);
select @bj;

/* 创建存储过程，使用游标确定一个员工的实际收入是否排在前三名。结果为TRUE表示是，结果为FALSE表示否 */

delimter $$
create procedure top_three(in em_id char(6),out ok boolean)
begin
	declare x_em_id char(6);
	declare act_in,seq int;
	declare found boolean;
	declare salary_dis cursor for 
		select employeeid,income-outcome from salary order by 2 desc;
	declare continue handle for not found set found=false;
	set seq=0;
	set found=true;
	set ok=false;
	open salary_dis;
	fetch salary_dis into x_em_id,act_in;
	while found and seq<3 and ok=false do
		set seq=seq+1;
		if x_em_id=em_id then set ok=true;
		end if;
		fetch salary_dis into x_em_id,act_in;
	end while;
	close salary_dis;
end $$
delimiter;



/* 创建一个存储函数，返回员工的总人数 */

create function em_num()
	returns int
	return (select count(*) from employees);
select em_num();

/* 创建一个存储函数，删除在Salary表中有但在Employees表中不存在的员工号。若在Employees表中存在返回FALSE，若不存在则删除该员工号并返回TRUE */

delimiter $$
create function delete_em(em_id char(6))
	returns boolean
begin
	declare em_name char(10);
	select name into em_name from employees where employeeid=em_id;
	if em_name is null then
		delete from salary where employeeid=em_id;
		return true;
	else 
		return false;
	end if;
end $$
delimiter ;
select delete_em('000001');
