FROM richarvey/nginx-php-fpm:latest

RUN apk add --no-cache --virtual .build-deps curl tar \
    && mkdir -p /var/www/html \
    && curl -Lk "https://github.com/PBWebMedia/phpssdbadmin/archive/master.tar.gz" | \
       tar -xz -C /var/www/html --strip-components=1 \
    && rm -rf /var/cache/apk/*

EXPOSE 443 80

COPY ./configs/nginx-site.conf /var/www/html/conf/nginx/

CMD ["/start.sh"]