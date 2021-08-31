#image is based on debian:buster image
FROM	debian:buster

#owner
MAINTAINER Franken Flores <fflores@student.21-school.ru>

#open container ports 8080 and 443
EXPOSE	8080 443

#upgrade and update
RUN	apt-get -y update && apt-get -y upgrade

#setup nginx web-server
RUN	apt-get -y install nginx

#copy nginx config files into container and remove the default one
COPY	./src/nginx.conf /etc/nginx/sites-available
RUN	ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

#setup php and it's extensions
RUN apt-get install -y php7.3 \
php7.3-common php7.3-fpm php7.3-mysql \
php7.3-gmp php7.3-curl php7.3-intl \
php7.3-mbstring php7.3-gd php7.3-xml \
php7.3-cli php7.3-zip php7.3-soap \
php7.3-imap php7.3-json php7.3-pdo \
php-pear php-bcmath

#setup database
RUN	apt-get -y install mariadb-server \
	mariadb-client

#installing some useful tools
RUN	apt-get -y install \
git curl vim \
nano net-tools pkg-config \
iputils-ping wget

#installing phpmyadmin
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz
RUN	tar -xzvf phpMyAdmin-4.9.5-english.tar.gz -C /var/www/ && rm phpMyAdmin-4.9.5-english.tar.gz
RUN	mv /var/www/phpMyAdmin-4.9.5-english/ /var/www/phpmyadmin/
COPY	./src/config.inc.php /var/www/phpmyadmin/

#setup Wordpress
RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar -zxvf latest.tar.gz -C ./var/www/ && rm latest.tar.gz
COPY	./src/wp-config.php /var/www/wordpress/

#provide accsess
RUN	chmod -R 755 /var/www/*
RUN	chown -R www-data:www-data /var/www/*

#getting self signed certificate
RUN	openssl req \
-days 365 \
-newkey rsa:4096 \
-x509 \	
-sha256 \
-nodes \
-out ./etc/ssl/certs/nginx_cert.crt \
-keyout ./etc/ssl/certs/nginx_key.key \
-subj	'/C=RU/ST=MS/L=MOSCOW/O=21-SCHOOL/OU=MIRAGE/CN=fflores'

#copying scripts to manage the web-server
COPY	./src/*.sh /

#database configuration
COPY ./src/mysql.sql /

#command
CMD	bash server.sh
