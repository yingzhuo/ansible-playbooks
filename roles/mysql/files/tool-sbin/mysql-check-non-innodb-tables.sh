#!/usr/bin/env bash
# 检查mysql实例中不使用"InnoDB"引擎的非系统表
# 作者: 应卓

sql="
  SELECT
  	TABLE_SCHEMA,
  	TABLE_NAME,
  	ENGINE,
  	FORMAT_BYTES(DATA_LENGTH) AS DATA_SIZE
  FROM
  	information_schema.TABLES
  WHERE
  	TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
  AND
  	ENGINE <> 'InnoDB';
"

mysql -e "$sql" | awk '
{
  if (NR == 1) {
    next
  }

  printf("[warning] [non innodb table] database: %s | table: %s | size: %s kB \n", $1, $2, $4)
}
'
