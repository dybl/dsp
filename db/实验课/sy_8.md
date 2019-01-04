# 实验八 用户与权限管理
## 实验目的
- 掌握用户与权限管理的基本原理
- 掌握MYSQL数据库系统配置表：User表、DB表、Table表和Column表
- 掌握管理用户的基本命令
- 掌握权限管理的基本命令

## 实验任务
- 使用root用户创建exam1用户，初始密码设置为123456。
- 授权exam1用户对所有数据库拥有Select、Create、Drop和Grant权限
- 查看exam1的权限
- 创建exam2，该用户没有初始密码
- 用exam2登录，将其密码设置为787878
- 用exam1登录，为exam2授权为YGGL数据库的Employees表查看Name字段的权限
- 用root登录，收回exam1和exam2的所有权限

## 来碗鸡汤
- 不管你曾经是多么的内向,也一定要在全班同学面前,认认真真地讲一次话,或者唱一首歌,即使你和开学时一样,再介绍自己一回
- 一定要对自己喜欢的女生/男生,很认真地告诉她/他,我喜欢过你!别一直闷着，也许她/他也喜欢着你
- 即使从不喝酒,你也要和哥们姐们畅饮一次，要让自己认真地醉一次
- 在校园里，假如有山，请记得再爬一次，假如有水，请记得再游一次
- 认真地在你不喜欢的食堂里,品尝一次食堂的免费汤,它的气味你会在很多年后还能记得
- 在一个太阳还没有升起来的早晨,去操场跑一次步,和大一新生比一下懒觉睡多了后体力上的差距
- 下定决心,班集体的活动这次一定不会借故溜走——如果还有的话
- 很认真的穿一次西装,看看自己和4年前,变化的地方在哪里
- 和你一起睡了4年的床,一定要记得和它留一张影

## 来吨硫酸
- 你当然可以爱一个人到尘埃里，但是没有人会爱尘埃里的你
- 被千夫所指的困难，都是为了淘汰掉懦夫，仅此而已
- 人会长大三次：第一次是发现自己不是世界的中心的时候；第二次是明白即使自己再怎么努力，有些事终究还是无能为力的时候；第三次是明知有些事无能为力，却还是会尽力争取的时候
- 20几岁是用来脱贫的，不是用来脱单的
- 种一棵树最好的时候是10年前，其次是现在
- 不适合就是穷，没感觉就是丑；一见钟情就是好看，深思熟虑就是有钱
- 没有人帮你，说明你一个人也可以
- 年轻就别絮叨平平淡淡才是真，你们的平淡就是懒惰，是贪图安逸，是没见过市面的土狗，趁着年轻就应该拔腿就走、去刀山火海
- 人长大后就要化妆，不为别的，就为无数次想哭的瞬间，还会想到，老娘的妆会不会花

## 实验代码
```sql
create user "exam1"@"localhost" identified by "123456";
grant select,create,drop on *.* to "exam1"@"localhost" with grant option;
show grants for "exam1"@"localhost";
select * from mysql.user where user="exam1" and host="localhost";
create user "exam2"@"localhost";
set password=password("787878");
grant select(name) on yggl.employees to "exam2"@"localhost";
revoke all privileges,grant option from "exam1"@"localhost","exam2"@"localhost";
```