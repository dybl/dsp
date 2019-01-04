# 实验六 触发器
## 实验目的
- 掌握触发器的含义和作用
- 掌握触发器的使用方法

## 实验内容
- 创建触发器，在Employees表中删除员工信息的同时将Salary表中该员工的信息删除，以确保数据完整性。
- 假设Department2表和Department表的结构和内容都相同，在Departments上创建一个触发器，如果添加一个新的部门，该部门也会添加到Departments2表中。
- 当修改表Employees时，若将Employees表中员工的工作时间增加1年，则将收入增加500，增加2年则增加1000，依次增加。若工作时间减少则无变化。

## 实验代码
```sql
create trigger delete_em after delete 
	on employees for each row
	delete from salary
		where employeeid=old.employeeid;
```
```sql
delimiter $$
create trigger departments_ins after insert
	on departments for each row
	begin
		insert into departments2 values(new.departmentid,new.departmentname,new.note);
	end$$
delimiter ;
```
```sql
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
	
```