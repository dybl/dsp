# 实验四 视图与索引
## 目的与要求
- 熟悉视图的概念和作用
- 熟悉视图的创建方法
- 掌握如何查询和修改视图
- 了解索引的作用与分类
- 掌握索引的创建方法

## 实验内容：视图
### 创建视图
- 创建YGGL数据库上的视图DS_VIEW，视图包含Departments表的全部列
- 创建YGGL数据库上的视图Employees_view，视图包含员工号码、姓名和实际收入
### 查询视图
- 从视图DS_VIEW中查询出部门号为3的部门名称
- 从视图Employees_view查询出姓名为"王林"的员工的实际收入
### 更新视图
- 向视图DS_VIEW中插入一行数据：6，财务部，财务管理
- 修改视图DS_VIEW，将部门号为5的部门名称修改为“生产车间”
- 修改视图Employees_view中号码为000001的雇员的姓名为“王浩”
- 删除视图DS_VIEW中部门号为“1”的数据
> 思考：更新视图的限制条件

### 删除视图
- 删除视图DS_VIEW

## 实验内容：索引
### 创建索引
- 使用Create Index语句创建索引
  - 对YGGL数据库的Employees表中的DepartmentID列建立索引
  - 在Employees表的Name列和Address列上建立复合索引
  - 对Departments表上的DepartmentName列建立唯一性索引
- 使用Alter Table语句向表中添加索引
  - 向Employees表中的出生日期列添加一个唯一性索引，姓名列和性别列上添加一个复合索引
  - 假设Departments表中没有主键，使用Alter Table语句将

DepartmentID列设为主键
- 在创建表时创建索引
  - 创建与Departments表相同结构的表Departments1，将DepartmentName设为主键，DepartmentID建立一个索引。

### 删除索引
- 使用Drop Index语句删除表Employees上的索引
- 使用Alter Table语句删除Departments上的主键和索引

> 思考：索引设计的原则

## 实验代码：视图
```sql
create view ds_view as select * from departments;
create view employees_view(employeeid,name,realincome) as select employees.employeeid,name,income-outcome from employees,salary where employees.employeeid=salary.employeeid;
select departmentname from ds_view where departmentid = "3";
select realincome from employees_view where name="王林";
insert into ds_view values("6","财务部","财务管理");
update ds_view set departmentname="生产车间" where departmentid="5";
update employees_view set name="王浩" where employeeid="000001";
delete from ds_view where departmentid="1";
drop view ds_view;
```

## 实验代码：索引
```sql
create index depart_ind on employees(departmentid);
create index ad_ind on employees(name,address);
create unique index dep_ind on departments(departmentname);
alter table employees add unique index date_ind(birthday),add index na_ind(name,sex);
alter table employees add primary key(departmentid);
create table departments1
(
	departmentid char(3),
	departmentname char(20),
	note text,
	primary key(departmentname),
	index did_ind(departmentid)
);
drop index depart_ind on employees;
alter table departments drop primary key,drop index dep_ind;
```