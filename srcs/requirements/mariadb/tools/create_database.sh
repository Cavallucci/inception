#https://mariadb.com/kb/en/create-database/


#Use ping to test if mariadb is correctly in service, while sleeping.
#service mysql start
#systemctl status mysql
#while ! mysqladmin -p -u root ping; do
#    sleep 2
#done
#Create database
sudo mysql << EOF
CREATE DATABASE test;
EOF
#mysql --user root --execute "CREATE DATABASE TEST;"