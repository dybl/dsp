

<h1 align="center">mysql-review</h1>


# 知识点

## 1. 数据库概念

> - 数据(信息)：
>
>   `数据(信息)是数据库中存储的基本对象,是关于现实世界事物的存在方式或运动状态反应的描述`
>
> - 数据库:
>
>   `是一个长期存储在计算机内的、有组织的、可共享的、统一管理的数据集合`
>
> - 数据库系统：
>
>   `数据库系统是指在计算机系统中引入数据库后的系统`
>
> - - 组成：
>
>   `数据库、软件系统和用户`

## 2. 数据管理的三个阶段及特点

| 人工管理数据阶段                      | 文件管理数据阶段                | 数据库管理阶段            |
| ------------------------------------- | ------------------------------- | ------------------------- |
| (a)`数据一般不保存`                   | (a)`数据可长期保存`             | (a)`数据结构化`           |
| (b)`没有专门的软件对数据进行统一管理` | (b)`由文件系统对数据进行管理`   | (b)`数据共享性高、冗余小` |
| (c)`数据无法共享`                     | (c) `文件可多样化组织`          | (c)`数据独立性较高`       |
| (d)`数据不具有独立性`                 | (d)`程序与数据间有一定的独立性` | (d)`有统一的数据控制功能` |



| 文件管理与人工管理阶段比较未解决的根本性问题 |
| -------------------------------------------- |
| 1.`数据冗余度较大，数据一致性往往难以保证`   |
| 2.`数据间的联系较弱`                         |
| 3.`数据独立性差`                             |
| 4. `缺乏对数据的统一控制`                    |



## 3. 数据库系统结构图

```mermaid
graph TB
	subgraph 
    应用A-->外模式1
	应用B-->外模式1
	end
	subgraph 
    应用C-->外模式2
	end
	subgraph 
	应用D-->模式
	end
	subgraph 
    外模式1-->外模式/模式映像
	外模式2-->外模式/模式映像
	外模式/模式映像-->模式
	模式-->模式/内模式映像
	模式/内模式映像-->内模式
	内模式-->数据库
	end
```



| 结构与优点 |                                  |
| ---------- | -------------------------------- |
| 三级模式   | 概念模式、外模式、内模式         |
| 二级映像   | 外模式/模式映像、模式/内模式映像 |
| 优点       | (a)`保证了数据的独立性`          |
|            | (b) `有利于实现数据共享`         |
|            | (c) `减轻了程序设计者的编程负担` |
|            | (d) `提高了数据安全性`           |



## 4. 三个世界,两个抽象步骤

> - 客观世界
> - 信息世界
> - 计算机世界
>
> > ①将现实世界中客观对象抽象为概念模型。
> >
> > ②将概念模型抽象为某个DBMS所控制的数据模型。



## 5. ER图

> - **实体(entity)**: `用矩形表示，矩形框内写明实体名`
>
> > 即数据模型中的数据对象
> >
> > 每个实体都有自己的实体成员(entity member)或者说实体对象(entity instance)
>
> - **属性(attribute)**: `用椭圆形或圆角矩形表示，并用无向边将其与相应的实体连接起来；多值属性由双线连接；主属性名称下加下划线`
>
> > 即数据对象所具有的属性
> >
> > 属性分为唯一属性（ unique attribute）和非唯一属性，唯一属性指的是唯一可用来标识该实体实例或者成员的属性，用下划线表示，一般来讲实体都至少有一个唯一属性
>
> - **关系(relationship)**: `用菱形表示，菱形框内写明联系名，并用无向边分别与有关实体连接起来，同时在无向边旁标上联系的类型`
>
> > 表现数据对象与数据对象之间的联系
> >
> > - **1对1 (1:1)** ：1对1关系是指对于实体集A与实体集B，A中的每一个实体至多与B中一个实体有关系；反之，在实体集B中的每个实体至多与实体集A中一个实体有关系。
> > - **1对多 (1:N)** ：1对多关系是指实体集A与实体集B中至少有N(N>0)个实体有关系；并且实体集B中每一个实体至多与实体集A中一个实体有关系。
> > - **多对多(M:N)**：多对多关系是指实体集A中的每一个实体与实体集B中至少有M(M>0)个实体有关系，并且实体集B中的每一个实体与实体集A中的至少N(N>0)个实体有关系

![](img/2012011409445811.png)

## 6. 三个数据模型

> - 层次模型:
>
>   `用树形结构表示实体及其之间的联系(可以直接方便地表示一对一和一对多联系)`
>
> - 网状模型：
>
>   `用网状结构表示实体及其之间联系的模型(可以直接表示多对多联系，但其中的节点间关系更加复杂)`
>
> - 关系模型：
>
>   `用关系描述实体间的联系的数据模型(关系、元组、属性、域、分量、主码、关系模式)`



## 7. 完整性约束三个条件

> - `实体完整性规则`
>
>   > 指关系（所谓的关系就是表）的主码不能取空值
>
> - `参照完整性规则`
>
>   > 指参照关系中每个元素的外码要么为空(NULL)，要么等于被参照关系中的某个元素的主码
>
> - `用户自定义完整性规则`
>
>   > 指对关系中每个属性的取值作一个限制（或称为约束）的具体定义



## 8. 范式(Normal Form)

> - 非范式：
>
>   `没有除去数据重复的表格`
>
> - 第一范式：
>
>   `如果关系模式R中每个属性值都是一个不可分解的数据项，则称该关系模式满足第一范式，简称1NF，记为R∈1NF`
>
>   > 将表格分割为单纯的二元表格，即一栏中只有一个项目，每一列都是不可分割的基本数据项
>
> - 第二范式：
>
>   `如果一个关系模式R∈1NF，且它的所有非主属性都完全函数依赖于R的码，则R∈2NF`
>
>   > 按照通过可识别数据的键来确定其他列值的原则分割表格。这样，通过主键确定其他列的数值。
>   > `函数依赖`：通过某一列的值确定其他列的数值的原则
>
> - 第三范式：
>
>   `如果一个关系模式R∈2NF，且所有的非主属性都不传递函数依赖于码，则R∈3NF`
>
>   > 按照只能由主键确定其他列值的原则分割的表格。
>   > 在关系数据库的函数依赖中,通过某一列的值间接确定其他列的值,称之为传递依赖。第三范式是去除传递依赖而分割表格得到的



## 9. ACID原理

> - `A 原子(Atomiclty)`事务原子性
>
>   > 指每个事务都必须被看作是一个不可分割的单元
>
> - `C 一致(Consistency)`插入一张表数据，会影响其它(索引/其它表)等一致
>
>   > 一致性属性保证了数据库从不返回一个未处理完的事务
>
> - `I 隔离性(Isolation）`事务独立，封闭；隔离性强度
>
>   > 指每个事务在它自己的空间发生，和其他发生在系统中的事务隔离，而且事务的结果只有在它完全被执行时才能看到
>
> - `D 持久性(Durability)`数据永存
>
>   > 指即使系统崩溃，一个提交的事务仍然存在



## 10. CAP原理

> - `Consistency (一致性)`, 数据一致更新，所有数据变动都是同步的。
> - `Availability (可用性)`, 好的响应性能。
> - `Partition tolerance (分区容错性)` 可靠性。
>
> > - CA 系统是要求高可用用并且实时一致性。单点数据库是符合这种架构的，例如超市收银系统，图书管理系统。
> > - AP 满足可用性，分区容忍性的系统，通常可能对一致性要求低一些。例如博客系统。
> > - CP 系统是要求满足一致性，分区容忍性，通常性能不是特别高。例如火车售票系统。 



## 11.索引设计的原则

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



## 12. 不能更新视图的条件

| 不能更新视图的条件                                           |
| ------------------------------------------------------------ |
| 1  `视图中包含sum()、count()、MAX()和MIN()等函数`            |
| 2  `视图中包含UNION、UNION ALL、DISTINCT、GROUP BY和HAVING等关键字` |
| 3  `常量视图`                                                |
| 4  `视图中的SELECT中包含子查询`                              |
| 5  `由不可更新的视图导出的视图`                              |
| 6  `视图对应的表上存在没有默认值的列，而且该列没有包含在视图里` |



# MySQL

## 1. 数据库

```mysql
/* 登录（DOS环境）*/
mysql -u root -p123456

/* 创建 */
create database school;

/* 查看 */
show databases;

/* 备份（DOS环境）*/
mysqldump -u root -p --databases school > d:\1108.sql

/* 删除 */
drop database school;

/* 还原 （DOS环境）*/
mysql -u root -p<d:\1108.sql
```



## 2. 表

```sql
/* 创建student表 */
create table student(
    sno char(10) primary key,
    sname varchar(6) not null,
    sgender enum('m','f') default 'f',
    saddress varchar(10),
    sqq char(10) unique
);

/* 创建course表 */
create table course(
    cno char(6) primary key,
    cname char(3) not null,
    ccredit tinyint default 3
);

/* 创建sc表 */
create table sc(
    scno int primary key auto_increment,
    sno char(10),
    cno char(6),
    grade float(4,2),
    constraint fk_1 foreign key (sno) references   student(sno),
    constraint fk_2 foreign key (cno) references
    course(cno)
);

/* 查看student表结构 */
desc student;

/* 在student表里增加semail字段 */
alter table student add semail varchar(20);

/* 备份school数据库(DOS环境) */
mysqldump -u root -p --databases school > d:\1109.sql

/* 删除student表 */
alter table sc drop foreign key fk_1;
drop table student;

/* 还原数据库 */
mysql -u root -p < d:\1109.sql
```



## 3. 数据

```sql
/* 向student表插入数据 */
insert into student(sno,sname,sgender,saddress,sqq) values
    ('2018001','tom','m','chn','12345'),
    ('2018002','jim','m','usa',''),
    ('2018003','mary','f','chn','54321')
);

/* 修改cname的数据长度为6 */
alter table course change cname cname char(6) not null;

/* 向course表插入数据 */
insert into course(cno,cname,ccredit) values
    ('c001','math',3),
    ('c002','db',4),
    ('c003','os',2)
);

/* 向sc表插入数据 */
insert into sc(sno,cno,grade) values
    ('2018001','c001',88),
    ('2018001','c002',89),
    ('2018001','c003',90),
    ('2018002','c002',66),
    ('2018003','c001',70)
);

/* 修改tom的数学成绩为70.6分 */
update sc set grade=70.6 
where sno in (select sno from student where sname='tom')
and cno = (select cno from course where cname='math');

/* 增加jim的数学成绩为60.8分 */
insert into sc(sno,cno,grade) values('2018002','c001',60.8);

/* 删除mary的数学成绩 */
delete from sc where sno='2018003' and cno='c001';

/* 备份数据库 */
mysqldump -u root -p --databases school > /home/1112.sql

/* 删除tom的学生信息 */
delete from sc where sno='2018001';
delete from student where sno='2018001';
```



## 4.查询

### 单表查询

```mysql

```



### 多表查询

```mysql

```



### 复杂查询

```mysql


```



## 5. 视图



```mysql


```



### 不能更新视图的条件

| 不能更新视图的条件                                           |
| ------------------------------------------------------------ |
| 1  `视图中包含sum()、count()、MAX()和MIN()等函数`            |
| 2  `视图中包含UNION、UNION ALL、DISTINCT、GROUP BY和HAVING等关键字` |
| 3  `常量视图`                                                |
| 4  `视图中的SELECT中包含子查询`                              |
| 5  `由不可更新的视图导出的视图`                              |
| 6  `视图对应的表上存在没有默认值的列，而且该列没有包含在视图里` |



## 6. 索引



```mysql


```



### 索引设计的原则

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



## 7. 权限：创建用户、授权、收权

```mysql
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
```



## 8. 触发器

```mysql

```



## 9. 存储过程、存储函数

### 存储过程

```mysql

```



### 存储函数

```mysql

```

