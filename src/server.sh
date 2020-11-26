#!/bin/bash
#restart
service nginx restart
service mysql restart

#start
rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
service nginx start
service php7.3-fpm start
service mysql start
mysql -u root < mysql.sql

#status
service nginx status
service mysql status
service php7.3-fpm status
bash
