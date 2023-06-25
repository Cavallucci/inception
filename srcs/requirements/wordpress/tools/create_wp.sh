#!/bin/sh

#if wp is install
if [ -f /var/www/html/wp-config.php ]
then
    echo "wordpress already install"
else
#Download wordpress command line interface
	wp core download --allow-root
	wp core install http://wordpress.org/latest.tar.gz

#Wait MariaDB installation
	until mysqladmin --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=mariadb ping; do
		sleep 2
	done

#Import env variables in the wp config file
	wp config create	--dbname=${MYSQL_DATABASE} \
						--dbuser=${MYSQL_USER} \
						--dbpass=${MYSQL_PASSWORD} \
						--dbhost=mariadb \
						--allow-root

#Config wordpress installation
	wp core install		--url=${DOMAIN_NAME} \
						--title=${WP_TITLE} \
						--admin_user=${WP_ADMIN} \
						--admin_password=${WP_ADMIN_PASSWORD} \
						--admin_email=${WP_ADMIN_EMAIL} \
						--skip-email \
						--allow-root

#Create a wordpress user
	wp user create 		${WP_USER} ${WP_USER_EMAIL} \
						--user_pass=${WP_USER_PASSWORD} \
						--role=author \
						--allow-root


#Install theme
	wp theme install "portfoliolite" --activate --allow-root

#Generate article
	wp post generate --count=1 --post_author="lcavallu" --post_title="WELCOOOME :)" --allow-root

fi

exec "$@"