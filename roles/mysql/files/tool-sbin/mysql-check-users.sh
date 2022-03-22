#!/usr/bin/env bash
# 检查mysql的用户
# 作者: 应卓

sql="
SELECT
  user, host, plugin, authentication_string
FROM
  mysql.user
WHERE
  user NOT IN ('mysql.infoschema', 'mysql.session', 'mysql.sys');
"

mysql -e "$sql" | awk '
BEGIN {
  count = 0
}

{
  if (NR == 1) {
    next
  }

  printf("plugin: %s | hashed_pwd: %s | %s@%s \n", $3, $4, $1, $2)
  count ++
}

END {
  printf("total: %d\n", count)
}
'
