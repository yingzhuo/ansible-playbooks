## 说明

#### (1) ~~本角色，安装常用的MySQL DBA工具`percona-toolkit`~~

通过Ansible直接从`percona`[官网](https://www.percona.com/downloads/percona-toolkit/LATEST/)下载并安装`percona-toolkit`着实太慢，建议解压安装二进制包。

#### (2) percona-toolkit 暂时不不支持 MySQL 8.0 的权限认证插件

```sql
create user percona@'%' identified with mysql_native_password by 'percona';
grant all on *.* to percona@'%';
```
