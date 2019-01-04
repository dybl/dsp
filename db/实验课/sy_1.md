# 实验一 数据库与表的操作

## 实验目的
- 了解MySQL数据库的存储引擎的分类
- 了解表的结构特点
- 了解MySQL的基本数据类型
- 了解空值的概念
- 掌握使用SQL语句创建数据库和表的方法

## 实验内容
### 1 实验题目
创建用于企业管理的员工管理数据库，数据库名为YGGL，包含员工的信息、部门信息及员工的薪水信息。数据库YGGL包含下列3个表：
- Employees:员工信息表
- Departments:部门信息表
- Salary:员工薪水情况表

各表的结构如下：
- Employees表结构

|列名|数据类型|长度|是否允许空值|说明|
|:--:|:--:|:--:|:--:|:--:|
|EmployeeID|char|6|N|员工编号，主键|
|Name|char|10|N|姓名|
|Education|char|4|N|学历|
|Birthday|date|16|N|出生日期|
|Gender|char|2|N|性别|
|WorkYear|tinyint|1|Y|工作时间|
|Address|varchar|20|Y|地址|
|PhoneNumber|char|12|Y|电话号码|
|DepartmentID|char|3|N|员工部门号，外键|

- Departments表结构

|列名|数据类型|长度|是否允许空值|说明|
|:--:|:--:|:--:|:--:|:--:|
|DepartmentID|char|3|N|部门编号，主键|
|DepartmentName|char|20|N|部门名|
|Note|text|16|Y|备注|

- Salary表结构

|列名|数据类型|长度|是否允许空值|说明|
|:--:|:--:|:--:|:--:|:--:|
|EmployeeID|char|6|N|员工编号，主键|
|InCome|float|8|N|收入|
|OutCome|float|8|N|支出|

### 2 实验要求
- 数据库字符集utf8
- 表存储引擎InnoDB
- 将表Employees中的Address列删除，增加EmailAddress列，并将gender列的默认值修改为male

### 3 实验步骤
- 登录数据库
- 创建数据库
- 查看数据库
- 使用数据库
- 创建表
- 修改表
- 备份数据库
- 删除数据库
- 恢复数据库
