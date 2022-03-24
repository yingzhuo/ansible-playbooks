## 说明

##### (1) 本角色，安装常用的MySQL DBA工具`percona-toolkit`

通过Ansible直接从[percona官网](https://www.percona.com/downloads/percona-toolkit/LATEST/)下载并安装`percona-toolkit`着实太慢，建议解压安装二进制包。配置一下环境变量即可。

##### (2) percona-toolkit 暂时不支持 MySQL 8.0 的权限认证插件，推荐为percona工具创建一个新的用户并使用`mysql_native_password`插件校检密码

```sql
create user percona@'%' identified with mysql_native_password by 'percona';
grant all on *.* to percona@'%';
```

## 附录

#### 附录(1) 常用DDL指南

| 功能                 | 是否锁表 | pt-online-schema-change 指令模板                             | sql                                                          |
| :------------------- | -------- | :----------------------------------------------------------- | ------------------------------------------------------------ |
| 添加索引             | no       | pt-online-schema-change --alter 'ADD INDEX indx_b (b)' D=test,t=x --dry-run | -                                                            |
| 变更数据库默认字符集 | -        | <不支持也不需要>                                             | ALTER DATABASE test CHARACTER SET utf8mb4 COLLATE utf8mb4_bin |
| 变更表字符集         | yes      | pt-online-schema-change --alter 'CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin' D=test,t=x --dry-run | -                                                            |

**注意:** 处理外键时请合理使用`--alter-foreign-keys-method=rebuild_constraints`选项。



#### 附录(2) 本人编写的awk脚本，用于分析慢查询文本日志

```awk
BEGIN {
    IGNORECASE = 1
    timestamp = ""
    query_time = ""
    lock_time = ""
    rows_send = ""
    rows_examined = ""
    sql = ""
}

{
    # 获取日志日期
    if ($0 ~ /^# Time:.*$/) {
        timestamp = $3
    }

    # 获取日志信息
    if ($0 ~ /^# Query_time:.*$/) {
        query_time = $3
        lock_time = $5
        rows_send = $7
        rows_examined = $9
    }

    if ($0 ~ /^select.*$/) {
        sql = $0
        printf("时间戳: %s - 查询时间: %s秒 - 挂起时间: %s秒 - 结果集数: %s - 扫描行数: %s | %s\n", timestamp, query_time, lock_time, rows_send, rows_examined, sql)
    }

}
```