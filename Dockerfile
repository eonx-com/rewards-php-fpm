FROM php:7.1-fpm-stretch

RUN apt-get update; \
    apt-get install --no-install-recommends -y \
        libzip-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libwebp-dev \
        libjpeg62-turbo-dev \
        libxpm-dev \
        zlib1g-dev; \
    rm -rf /var/lib/apt/lists/*;

RUN docker-php-ext-configure gd \
        --with-gd \
        --with-webp-dir \
        --with-jpeg-dir \
        --with-png-dir \
        --with-zlib-dir \
        --with-xpm-dir \
        --with-freetype-dir \
        --enable-gd-native-ttf; \
    docker-php-ext-install gd; \
    docker-php-ext-install bcmath; \
    docker-php-ext-install opcache; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install zip;

RUN pecl install xdebug-2.7.2;

WORKDIR "/var/www/"
