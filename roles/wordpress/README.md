## 说明

* 要先准备好MySQL数据库

```sql
CREATE DATABASE wordpress CHARACTER SET utf8mb4 collate utf8mb4_bin;
CREATE USER wordpress@'%' IDENTIFIED BY 'wordpress';
GRANT ALL ON wordpress.* TO wordpress@'%';
```

* 要将`wordpress-5.9.2-zh_CN.tar.gz`预先解压到`/var/lib/wordpress`
