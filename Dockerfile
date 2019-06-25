FROM richarvey/nginx-php-fpm:latest
LABEL maintainer="Leonard Buskin <leonardbuskin@gmail.com>"

RUN apk add --no-cache --virtual .build-deps curl tar \
    && mkdir -p /var/www/html \
    && rm -rf /var/cache/apk/*

EXPOSE 443 80

COPY app /var/www/html
COPY ./configs/nginx-site.conf /var/www/html/conf/nginx/

CMD ["/start.sh"]