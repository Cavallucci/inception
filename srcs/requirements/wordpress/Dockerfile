

FROM debian:buster

RUN apt-get update && apt-get -y install \
	#To use mysqladmin (enables you to interact with your WordPress
	#	site directly by using commands in a text-based interface)
	0mariadb-client \
	0php7.3 \
	0php-fpm \
	php-cli \
	wget \
	0curl \
	0php-mysql \
	0php-mbstring \
	0php-xml \
	sendmail

#Commande pour installer mysql client :
        apt-get update -y && \
        apt-get upgrade -y && \
        apt-get -y install mariadb-client
    
    Commande pour acceder au serveur mysql:
        mysql -u wben-far -pstudent42 -h 172.18.0.2(ip du hostname Mariadb)
    
    Commande pour installer les packages php-fpm :
        apt-get update -y && \
        apt-get upgrade -y && \
        apt-get -y install \
        php7.3 \
        php-fpm \
        php-cli \
        wget \
        curl \
        php-mysql \
        php-mbstring \
        php-xml \
        sendmail \
        vim

RUN rn -rf /var/lib/apt/lists/*

RUN		openssl req -new -newkey rsa:4096 -x509 -sha512 -days 365 -nodes  \
		-subj "/C=FR/ST=Paris/O=42/CN=lcavallu.42.fr"  \
		-out /etc/ssl/certs/nginx_certificate.crt  \
		-keyout /etc/ssl/private/nginx_certificate.key

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 433

CMD ["nginx", "-g", "deamon off;"]