FROM lscr.io/linuxserver/code-server:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt dist-upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update
RUN apt install apt-utils -y
RUN apt install gnupg -y
RUN apt install libcurl4-openssl-dev -y
RUN apt install pkg-config -y
RUN apt install libssl-dev -y
RUN apt install zlib1g-dev -y
RUN apt install libzip-dev -y
RUN apt install libkrb5-dev -y
RUN apt install libfreetype6-dev -y
RUN apt install libmcrypt-dev -y
RUN apt install libpng-dev -y
RUN apt install unzip -y
RUN apt install build-essential -y
RUN apt install php-pear -y
RUN apt install php7.4-cli -y
RUN apt install php7.4-xdebug -y
RUN apt install php7.4-dev -y
RUN apt install php7.4-mysql -y
RUN apt install php7.4-curl -y
RUN apt install php7.4-intl -y
RUN apt install php7.4-gd -y
RUN apt install php7.4-imap -y
RUN apt install php7.4-xml -y
RUN apt install php7.4-zip -y
RUN apt install composer -y
RUN apt install nodejs -y
RUN apt install npm -y
ADD php.ini /etc/php/7.4/cli/php.ini
RUN pecl install mcrypt
RUN echo "extension=mcrypt.so" > /etc/php/7.4/mods-available/mcrypt.ini
RUN ln -s /etc/php/7.4/mods-available/mcrypt.ini /etc/php/7.4/cli/conf.d/30-mcrypt.ini
RUN pecl install mongodb
RUN echo "extension=mongodb.so" > /etc/php/7.4/mods-available/mongodb.ini
RUN ln -s /etc/php/7.4/mods-available/mongodb.ini /etc/php/7.4/cli/conf.d/30-mongodb.ini
RUN update-alternatives --set php /usr/bin/php7.4
