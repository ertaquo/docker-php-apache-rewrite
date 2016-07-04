FROM php:apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng-dev libmcrypt-dev imagemagick-dev libjpeg-turbo-dev --no-install-recommends && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install pdo_mysql gd mcrypt imagick
