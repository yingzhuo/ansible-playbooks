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
  OFS = " "
  count = 0
}

{
  if (NR == 1) {
    next
  }

  count ++
  printf("%s@%s | plugin: %s | hashed_pwd: %s\n", $1, $2, $3, $4)
}

END {
  printf("total: %d\n", count)
}
'
