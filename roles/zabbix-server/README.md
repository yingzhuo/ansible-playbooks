## 说明

安装zabbix-server

#### 先决条件

(1) 必须要MySQL数据库实例支持

(2) 必须导入库和脚本为zabbix配置用户名和密码

```bash
# rpm -ql zabbix-server-mysql
/etc/logrotate.d/zabbix-server
/etc/zabbix/zabbix_server.conf
/usr/lib/systemd/system/zabbix-server.service
/usr/lib/tmpfiles.d/zabbix-server.conf
/usr/lib/zabbix/alertscripts
/usr/lib/zabbix/externalscripts
/usr/sbin/zabbix_server_mysql
/usr/share/doc/zabbix-server-mysql-4.4.10
/usr/share/doc/zabbix-server-mysql-4.4.10/AUTHORS
/usr/share/doc/zabbix-server-mysql-4.4.10/COPYING
/usr/share/doc/zabbix-server-mysql-4.4.10/ChangeLog
/usr/share/doc/zabbix-server-mysql-4.4.10/NEWS
/usr/share/doc/zabbix-server-mysql-4.4.10/README
/usr/share/doc/zabbix-server-mysql-4.4.10/create.sql.gz  <- yum安装后自带初始化脚本
/usr/share/man/man8/zabbix_server.8.gz
/var/log/zabbix
/var/run/zabbix
```

```sql
# 创建用户
create user 'zabbix'@'%' identified with mysql_native_password by 'zabbix';
grant all privileges on zabbix.* to 'zabbix'@'%';
flush privileges;
```
