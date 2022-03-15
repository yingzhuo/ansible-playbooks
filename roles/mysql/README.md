## 说明

* 单节点MySQL实例不可用于生产环境
* 由于网络因素MySQL需要的二进制包不从网上下载，在执行本role前，必须把mysql解压到/usr/local/mysql目录。切记!
* 安装好以后root账号为空密码，依次执行一下sql语句设置密码，并允许root账户远程访问

```sql
-- 在非生产环境下，建议使用以下脚本 
alter user 'root'@'localhost' identified by 'root';

update mysql.user
set host = '%'
where host = 'localhost'
  and user = 'root';

flush privileges;
```
