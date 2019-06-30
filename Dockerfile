FROM alpine:latest

Maintainer Jakub Fridrich <xfridrich@gmail.com>

RUN apk --update add nodejs \
		     wget \
		     curl \
		     lftp \
		     git \
		     zip \
		     php7 \
		     php7-curl \
		     php7-openssl \
		     php7-iconv \
		     php7-json \
		     php7-mbstring \
		     php7-phar \
		     php7-xml \
		     php7-tokenizer \
		     php7-pdo \
		     php7-calendar \
		     php7-xmlwriter \
		     php7-dom --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN npm install gulp-cli -g

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]
