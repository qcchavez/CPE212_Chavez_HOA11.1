FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    mysql-server \
    php \
    libapache2-mod-php \
    php-mysql \
    && apt-get clean

COPY ./index.html /var/www/html/

EXPOSE 80 3306

CMD service mysql start && \
    service apache2ctl start && \
    tail -f /dev/null
