#!/bin/bash
 
##############################################################################
# Выполняет операции обслуживания базы данных MariaDB/MySQL:
#   - Check
#   - Optimize
#   - Analyze
#
# ВНИМАНИЕ:
#   Эти операции заблокируют таблицы! Поэтому скрипт должен выполняться при плановом обслуживании.
#
##############################################################################
 
set -e
 
mysql_username="root"
mysql_password="passsword"
mysql_hostname="localhost"
mysql_database_name="database"
 
echo
echo "Проверка БД \"$mysql_database_name\" на ошибки..."
echo "-----------------------------------------------------------------------"
mysqlcheck -h $mysql_hostname -u $mysql_username -p$mysql_password --check --databases $mysql_database_name
 
echo
echo "Оптимизация БД \"$mysql_database_name\" чтобы освободить неиспользуемое место..."
echo "-----------------------------------------------------------------------"
mysqlcheck -h $mysql_hostname -u $mysql_username -p$mysql_password --optimize --databases $mysql_database_name
 
echo
echo "Анализарование БД \"$mysql_database_name\" для перестроения и оптимизации индексов..."
echo "-----------------------------------------------------------------------"
mysqlcheck -h $mysql_hostname -u $mysql_username -p$mysql_password --analyze --databases $mysql_database_name
 
echo
echo "ГОТОВО."
echo
