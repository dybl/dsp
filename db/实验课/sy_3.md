# 实验三 数据库的查询
## 目的与要求
- 掌握select语句的基本语法
- 掌握子查询的表示
- 掌握连接查询的表示
- 掌握select语句的group by子句的作用和使用方法
- 掌握select语句的order by子句的作用和使用方法
- 掌握select语句的limit子句作用和使用方法

## 实验内容
### 单表查询
- 查询每个雇员的所有数据
- 查询每个雇员的姓名、电话和地址
- 查询EmployeeID为000001的雇员的地址和电话
- 查询Employees表中女雇员的地址和电话，使用AS子句将结果中各列的标题分别指定为地址、电话
- 查询Employees表中员工的姓名和性别，要求gender值为1时显示为‘男’，为0时显示为‘女’
- 计算每个员工的实际收入
- 获得员工总数
- 找出所有王姓员工的部门号
- 找出所有收入在2000~3000元之间的员工号码

### 思考题
- 查询月收入高于2000的员工号码
- 查询1970以后出生的员工的姓名和住址
- 查询所有财物部的员工的号码和姓名
- 查询Employees员工的姓名、住址和收入水平，2000以下显示为低收入，2000~3000为中等收入，3000以上显示为高收入
- 计算salary表中员工月收入的平均数
- 获得Empoyees表中最大的员工号码
- 计算salary表中所有员工的总支出
- 查询财务部雇员的最高和最低实际收入
- 找出所有地址含有“中山”的雇员和号码及部门号
- 查找员工号码中倒数第二个数字为0的姓名、地址和学历
- 找出所有在部门1或2工作的雇员的号码

### 子查询
- 查找在财务部工作的雇员的情况
- 查找研发部年龄不低于市场部所有雇员年龄的雇员的姓名
- 查找比财务部所有的雇员收入都高的雇员的姓名

### 连接查询
- 查询每个雇员的情况及其薪水的情况
- 使用内连接的方法查询名字为“王林”的员工所在的部门
- 查找财务部收入在2000元以上的雇员姓名及其薪水详情

### GROUP BY、ORDER BY和LIMIT子句的使用
- 查找Employees中男性和女性的人数
- 查找员工数超过2人的部门名称和员工数量
- 将Employees表中的员工号码由大到小排列
- 返回Employees表中的前5位员工的信息

## 参考命令
### 单表查询
```sql
select * from employees;
select name,address,phonenumber from employees;
select address,phonenumber from employees where employeeid="000001";
select address as "地址",phonenumber as "电话" from employees where sex = "0";
select name as "姓名",
 case 
  when sex="1" then "男"
  when sex="0" then "女"
 end as gender
from employees;
select employeeid,income-outcome as "实际收入" from salary;
select count(*) from employees;
select departmentid from employees where name like "王%";
select employeeid from salary where income between 2000 and 3000;
```

### 子查询
```sql
select * from employees where departmentid = (select departmentid from departments where departmentname="财务部");
select name from employees where departmentid in (select departmentid from departments where departmentname="研发部") and birthday <= all(select birthday from employees where departmentid in(select departmentid from departments where departmentname="市场部"));
select name from employees where employeeid in (select employeeid from salary where income > all(select income from salary where employeeid in (select employeeid from employees where departmentid = (select departmentid from departments where departmentname="财务部"))));
```

### 连接查询
```sql
select employees.*,salary.* from employees,salary where employees,salary where employees.employeeid=salary.employeeid;
select departmentname from departments join employees on departments.departmentid=employees.departmentid where employees.name="王林";
select name,income,outcome from employees,salary,departments where employees.employeeid=salary.employeeid and employees.departmentid=departments.departmentid and departmentname="财务部" and income>=2000;
```

### 分组查询
```sql
select sex,count(sex) from employees group by sex;
select departmentname,count(*) as "人数" from employees,departments where employees.departmentid=departments.departmentid group by employees.departmentid having count(*)>2;
select employeeid from employees order by employeeid desc;
select * from employees limit 5;
```