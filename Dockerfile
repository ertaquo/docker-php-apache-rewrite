FROM php:apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmcrypt-dev --no-install-recommends && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install -j$(nproc) pdo_mysql mcrypt iconv
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd
