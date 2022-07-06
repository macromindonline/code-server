FROM lscr.io/linuxserver/code-server:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install apt-utils gnupg libcurl4-openssl-dev pkg-config libssl-dev zlib1g-dev libzip-dev libkrb5-dev libfreetype6-dev libmcrypt-dev libpng-dev unzip build-essential php-cli php-xdebug php-pear php-dev composer nodejs npm -yq
ADD php.ini /etc/php/7.4/cli/php.ini
RUN pecl install mcrypt
RUN echo "extension=mcrypt.so" > /etc/php/7.4/mods-available/mcrypt.ini
RUN ln -s /etc/php/7.4/mods-available/mcrypt.ini /etc/php/7.4/cli/conf.d/30-mcrypt.ini
RUN pecl install mongodb
RUN echo "extension=mongodb.so" > /etc/php/7.4/mods-available/mongodb.ini
RUN ln -s /etc/php/7.4/mods-available/mongodb.ini /etc/php/7.4/cli/conf.d/30-mongodb.ini
