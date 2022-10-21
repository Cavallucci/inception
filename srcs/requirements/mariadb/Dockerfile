#https://www.youtube.com/watch?v=Ik_mC7JSJ-A
#https://mariadb.com/kb/en/creating-a-custom-docker-image/

FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

#create directory
RUN mkdir -p /run/mysql /var/lib/mysql
#give permission
RUN chown -R mysql:mysql /run/mysql /var/lib/mysql

# mysql_install_db inits the database and creates a 'root@localhost' account with no initial password set
RUN	mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/create_database.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_database.sh

EXPOSE 3306

ENTRYPOINT ["create_database.sh"]

CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]