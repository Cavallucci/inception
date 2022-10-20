#!/bin/sh

#if wp is install
if [ -f /var/www/html/wp-config.php ]
then
    echo "wordpress already install"
else
	#Download wordpress command line interface
	wp core download --allow-root
#Wait MariaDB installation
	until mysqladmin --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=mariadb ping; do
		sleep 2
	done

# #Update configuration file
# 	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
# 	mv ./www.conf /etc/php/7.3/fpm/pool.d/

#Inport env variables in the config file
 	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
 	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
 	cp wp-config-sample.php wp-config.php

fi

exec "$@"