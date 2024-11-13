FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    libapache2-mod-php \
    php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=exampledb

COPY ./index.html /var/www/html/

EXPOSE 80 3306

CMD service mysql start && apache2ctl -D FOREGROUND

