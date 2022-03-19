## 说明

* 要先准备好MySQL数据库

```sql
DROP DATABASE IF EXISTS wordpress;
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
DROP USER IF EXISTS wordpress@'%';
CREATE USER wordpress@'%' IDENTIFIED WITH mysql_native_password BY 'wordpress';
GRANT ALL ON wordpress.* TO wordpress@'%';
```

* 要将`wordpress-5.9.2-zh_CN.tar.gz`预先解压到`/var/lib/wordpress`
