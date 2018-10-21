#!/bin/bash

# Start Mysql server with mysql.server script: https://mariadb.com/kb/en/library/mysqlserver/
mysqld_safe --no-watch

# Make sure mariadb started
sleep 10
mysqladmin ping

# Set mariadb root password from env variable
mysqladmin -u root password $MYSQL_ROOT_PASSWORD

# Create database and schema
php /bookmarks-ws/bin/console doctrine:database:create
php /bookmarks-ws/bin/console make:migration
php /bookmarks-ws/bin/console doctrine:migrations:migrate -n

# Start Symfony server
php /bookmarks-ws/bin/console server:start 0.0.0.0:8000

# Start nginx.
# daemon mode is off, so the container stays up.
nginx -g "daemon off;"