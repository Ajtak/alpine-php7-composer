FROM alpine:latest

Maintainer Jakub F <xfridrich@gmail.com>

RUN apk --update add wget curl git php7 php7-curl php7-openssl php7-json php7-phar php7-dom && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]