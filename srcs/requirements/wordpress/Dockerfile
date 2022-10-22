FROM debian:buster
#To use mysqladmin (enables you to interact with your WordPress
#	site directly by using commands in a text-based interface)
RUN apt-get update && apt-get -y install \
	mariadb-client \
	php7.3 \
	curl \
	wget \
	php7.3-fpm \
	php7.3-curl \
	php7.3-mysql \
	php7.3-mbstring \
	php7.3-xml 
#   php7.3-zip 
#   php7.3-gd \
#   php7.3-imap 

RUN	mkdir -p /var/www/html ; mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

#Install Wordpress
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/create_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wp.sh
ENTRYPOINT ["create_wp.sh"]

#We go the html directory
WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]