# 实验七 存储过程与存储函数
## 实验目的
- 掌握存储过程创建和调用的方法
- 掌握游标的使用方法
- 掌握存储函数创建和调用的方法

## 实验内容
### 存储过程
- 创建存储过程，使用Employees表中的员工人数来初始化一个局部变量，并调用这个存储过程
- 创建存储过程，比较两个员工的实际收入，若前者比后者高就输出0，否则输出1
- 创建存储过程，使用游标确定一个员工的实际收入是否排在前三名。结果为TRUE表示是，结果为FALSE表示否

### 存储函数
- 创建一个存储函数，返回员工的总人数
- 创建一个存储函数，删除在Salary表中有但在Employees表中不存在的员工号。若在Employees表中存在返回FALSE，若不存在则删除该员工号并返回TRUE

## 实验代码
### 存储过程
```sql
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
```
```sql
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
```
```sql
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
```
### 存储函数
```sql
create function em_num()
	returns int
	return (select count(*) from employees);
select em_num();
```
```sql
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
```
