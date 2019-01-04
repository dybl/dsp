# 实验五 MySQL语言结构
## 目的与要求
- 掌握变量的分类及其使用
- 掌握各种运算符的使用
- 掌握系统内置函数的使用

## 实验内容
### 常量的使用
- 计算194和142的乘积
- 获取以下这串字母的值："I\nlove\nMySQL"

### 系统变量的使用
- 获得现在使用的MySQL版本
- 获得系统当前的时间

### 用户变量的使用
- 对于实验2给出的数据库表结构，创建一个名为female的用户变量，并在SELECT语句中，使用该局部变量查找表中所有女员工的编号、姓名。
- 定义一个变量，用于获取号码为102201的员工的电话号码

### 运算符的使用
- 使用运算符"-"查询员工的实际收入
- 使用比较运算符">"查询Employees表中工作时间大于5年的员工的信息
- 使用逻辑运算符"AND"查看以下语句的结果
```sql
select (7>6) and ('A'='B');
```

### 系统内置函数的使用
- 获得一组数值的最大值和最小值
- 使用ROUND()函数获得一个数的四舍五入的整数值
- 使用ABS()函数获得一个数的绝对值
- 使用SQRT()函数返回一个数的平方根
- 求财务部雇员的总人数
- 使用CONCAT函数连接两个字符串
- 使用ASCII函数返回字符表达式最左端字符的ASCII值
- 获得当前的日期和时间
- 查询YGGL数据库中员工号为000001的员工出生的年份

## 实验代码
### 常量的使用
```sql
select 194*142;
select "I\nlove\nMySQL";
```

### 系统变量的使用
```sql
select @@VERSION;
select CURRENT_TIME;
```

### 用户变量的使用
```sql
set @female=0;
select employeeid,name from employees where sex=@female;
set @phone=(select phonenumber from employees where employeeid="102201");
```

### 运算符的使用
```sql
select income-outcome from salary;
select * from employees where workyear>5;
select (7>6) and ("A"="B");
```

### 系统内置函数的使用
```sql
select greatest(5,76,25.9),least(5,76,25.9);
select count(employeeid) as "财务部人数" from employees where departmentid=(select departmentid from departments where departmentname="财务部");
select concat("I love","MySQL");
select ascii("abc");
select now();
select year(birthday) from employees where employeeid="000001";
```
## 系统内置函数
![](https://gitee.com/uploads/images/2017/1124/082955_8e9cb53c_1572284.png "1.png")

![](https://gitee.com/uploads/images/2017/1124/083033_2bbc5188_1572284.png "2.png")

![](https://gitee.com/uploads/images/2017/1124/083048_9e01b2e6_1572284.png "3.png")

