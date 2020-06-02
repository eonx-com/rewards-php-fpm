FROM php:7.1-fpm

RUN apt-get update; \
    apt-get install --no-install-recommends -y \
        libzip-dev \
        libpng-dev \
        zlib1g-dev; \
    rm -rf /var/lib/apt/lists/*;

RUN docker-php-ext-install bcmath; \
    docker-php-ext-install opcache; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install gd; \
    docker-php-ext-install zip;

RUN pecl install xdebug-2.7.2;

WORKDIR "/var/www/"
