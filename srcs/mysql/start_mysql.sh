#!/usr/bin/env sh

if [ ! -d /var/lib/mysql/server_db ]; then
  openrc-init
  openrc boot
  rc-update add mariadb
  mysql_install_db --datadir=/var/lib/mysql
  rc-service mariadb start
  option --skip-name-resolve
  mysql -u root < /tmp/create_db.sql
  mysql server_db -u root < /tmp/server_db.sql
  service mariadb stop
  /usr/bin/mysqld_safe
else
  /usr/bin/mysqld_safe
fi

