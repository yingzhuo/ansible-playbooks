#!/usr/bin/env bash
# 检查mysql实例中不使用"utf8mb4"字符集的database
# 作者: 应卓

sql="
SELECT
	SCHEMA_NAME,
	DEFAULT_CHARACTER_SET_NAME,
	DEFAULT_COLLATION_NAME
FROM
	information_schema.SCHEMATA
WHERE
	SCHEMA_NAME NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
AND
(
	DEFAULT_CHARACTER_SET_NAME <> 'utf8mb4'
OR
	DEFAULT_COLLATION_NAME <> 'utf8mb4_bin'
);
"

mysql -e "$sql" | awk '
{
  if (NR == 1) {
    next
  }

  printf("[warning] [non innodb table] database: %s | character-set: %s | collation: %s\n", $1, $2, $3)
}
'