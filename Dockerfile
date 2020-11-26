#image is based on debian:buster image
FROM	debian:buster

#owner
MAINTAINER Franken Flores <fflores@student.21-school.ru

#open container ports 8080 and 443
EXPOSE	8080 443

#upgrade and update
RUN	apt-get -y update && apt-get -y upgrade

#setup nginx web-server
RUN	apt-get -y install nginx

#copy nginx config files into container and remove the default one
COPY	./src/config.nginx /etc/nginx/sites-available
RUN	ln -s /etc/sites-available/nginx.conf /etc/sites-enabled/nginx.conf
RUN	rm -f /etc/sites-available/default /etc/sites-enabled/default

#setup php and it's extensions
RUN	apt-get -y install \
	php7.0-cli \
	php7.0-common \
	php7.0-curl \
	php7.0-json \
	php7.0-xml \
	php7.0-mbstring \
	php7.0-mcrypt \
	php7.0-mysql \
	php7.0-pgsql \
	php7.0-sqlite \
	php7.0-sqlite3 \
	php7.0-zip \
	php7.0-memcached \
	php7.0-gd \
	php7.0-fpm \
	php7.0-xdebug \
	php7.1-bcmath \
	php7.1-intl \
	php7.0-dev \

#setup database
RUN	apt-get -y install mariadb-server \
	mariadb-client

#installing some useful tools
RUN	apt-get -y install \
	libcurl4-openssl-dev \
	libedit-dev \
	libssl-dev \
	libxml2-dev \
	xz-utils \
	sqlite3 \
	libsqlite3-dev \
	git \
	curl \
	vim \
	nano \
	net-tools \
	pkg-config \
	iputils-ping \
	wget

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
	-x509 \			#tells openssl to output self-signed certificate
	-sha256 \		#secure hash algorithm
	-nodes \		#tells openssl to not encrypt the private key
	-out ./etc/ssl/certs/nginx_cert.crt \		#certificate
	-keyout ./etc/ssl/certs/nginx_key.key \		#key
	-subj	'/C=RU/ST=MS/L=MOSCOW/O=21-SCHOOL/OU=MIRAGE/CN=fflores'

#copying scripts to manage the web-server
COPY	./src/*.sh /

#command
CMD	bash server.sh
