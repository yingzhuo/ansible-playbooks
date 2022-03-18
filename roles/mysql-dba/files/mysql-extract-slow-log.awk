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
        # printf("查询时间: %s秒 - 挂起时间: %s秒 - 结果集数: %s - 扫描行数: %s\n", query_time, lock_time, rows_send, rows_examined)
    }

    if ($0 ~ /^select.*$/) {
        sql = $0
        printf("时间戳: %s - 查询时间: %s秒 - 挂起时间: %s秒 - 结果集数: %s - 扫描行数: %s | %s\n", timestamp, query_time, lock_time, rows_send, rows_examined, sql)
    }

}