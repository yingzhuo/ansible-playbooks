timestamp           := $(shell /bin/date "+%s")
mysql_install_dir	:= /usr/local/mysql
mysql_data_dir      := /data/mysql
slow_log_name       := slow.log
general_log_name    := general.log

usage:
	@echo "=============================================================="
	@echo "usage                     : 显示本菜单"
	@echo "backup-general-log        : 备份通用日志"
	@echo "truncate-general-log      : 切断通用日志"
	@echo "backup-slow-log           : 备份慢查询文件"
	@echo "truncate-slow-log         : 切断慢查询日志"
	@echo "=============================================================="

backup-slow-log:
	@mv $(mysql_data_dir)/$(slow_log_name) $(mysql_data_dir)/$(slow_log_name).$(timestamp)
	@$(mysql_install_dir)/bin/mysql -e "FLUSH SLOW LOGS;"

truncate-slow-log:
	@rm -rf $(mysql_data_dir)/$(slow_log_name).$(timestamp)

backup-general-log:
	@mv $(mysql_data_dir)/$(general_log_name) $(mysql_data_dir)/$(general_log_name).$(timestamp)

truncate-general-log:
	@rm -rf $(mysql_data_dir)/$(general_log_name).$(timestamp)

.PHONY: usage backup-slow-log truncate-slow-log truncate-general-log backup-general-log