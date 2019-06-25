FROM alpine:3.6
MAINTAINER Tomas Janecek
LABEL Description="A Simple apache/php image using alpine Linux for Web Apps"

# Setup apache and php
RUN apk --no-cache add \
    apache2 \
    php5-apache2 \
    php5-fpm \
    curl \
    tzdata \
    php5-json \
    php5-phar \
    php5-openssl \
    php5-curl \
    php5-mcrypt \
    php5-gd \
    php5-dom \
    && mkdir /run/apache2 \
    && mkdir -p /app/data \
    && mkdir -p /var/www/html/app/config \
    && curl -Lk "https://github.com/janpiter/phpssdbadmin/archive/master.tar.gz" | \
       tar -xz -C /app/data --strip-components=1 \
    && touch /var/www/html/app/config/config.php \
    && ln -sf /var/www/html/app/config/config.php /app/data/app/config/config.php \
    && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime \
    && echo "Asia/Jakarta" >  /etc/timezone \
    && date \
    && rm -rf /var/cache/apk/*

COPY httpd.conf /app/httpd.conf
COPY .htaccess /app/data

CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND", "-f", "/app/httpd.conf" ]
