#https://mariadb.com/kb/en/create-database/


#Use ping to test if mariadb is correctly in service, while sleeping.
service mysql start
while ! mysqladmin ping; do
    sleep 2
done


#Create database
#Create user admin & user and give them all rights
#DELETE anonymous users : in default installation we can have anonymous users
#DELETE root from  database otherwise we can still connect with root without password
#flush indicate that it is necessary to reload the privileges of the tables of rights in the MySQL system database
#       ||
#       ||
#       ||
#       VV
sudo mysql << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
ALTER USER 'root'@'localhost' IDENTIFIED BY ${MYSQL_ROOT_PASSWORD};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
DELETE FROM mysql.user WHERE user='';
DELETE FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILAGES;
EOF

#need to restart
killall mysqld

#run the command given by the command line parameters in such a way that the current process is replaced by it
 exec "$@"