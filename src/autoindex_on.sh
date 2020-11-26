#!/bin/bash
sed -i '15d' ./etc/nginx/sites-available/nginx.conf
sed -i '15i autoindex on;' ./etc/nginx/sites-available/nginx.conf
service nginx restart
service mysql restart
service nginx start -p root
service php7.3-fpm start
service nginx status
service mysql status
service php7.3-fpm status