

FROM debian:buster
#To use mysqladmin (enables you to interact with your WordPress
#	site directly by using commands in a text-based interface)
RUN apt-get update && apt-get -y install \
	mariadb-client \
	php7.3 \
	php7.3-fpm \
	php7.3-curl \
	php7.3-mysql \
	php7.3-mbstring \
	php7.3-xml 
#   php7.3-zip 
#   php7.3-gd \
#   php7.3-imap 

#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

#EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]