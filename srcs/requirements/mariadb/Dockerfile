#https://www.youtube.com/watch?v=Ik_mC7JSJ-A
#https://mariadb.com/kb/en/creating-a-custom-docker-image/

FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

#create directory
RUN mkdir -p /run/mysql /var/lib/mysql
#give permission
RUN chown -R mysql:mysql /run/mysql /var/lib/mysql


EXPOSE 3306

COPY ./tools/create_database.sh /usr/local/bin/
COPY ./conf/my.cnf /etc/mysql/my.cnf
ENTRYPOINT ["create_database.sh"]

CMD ["mysqld", "--bin-adress=0.0.0.0"]