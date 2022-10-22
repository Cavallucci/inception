FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl
RUN rm -rf /var/lib/apt/lists/*


#Generate New certificate
#Generate New key with RSA key
#self-signed certificate
#365days valid
#no password request
#		||
#		||
#		||
#		vv
RUN		openssl req -new -newkey rsa:4096 -x509 -sha512 -days 365 -nodes  \
		-subj "/C=FR/ST=Paris/O=42/CN=lcavallu.42.fr"  \
		-out /etc/ssl/certs/nginx_certificate.crt  \
		-keyout /etc/ssl/private/nginx_certificate.key

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]