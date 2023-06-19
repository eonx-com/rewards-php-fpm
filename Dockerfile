FROM php:8.1-fpm AS build

RUN apt-get update; \
    apt-get install --no-install-recommends -y \
      'libfreetype6' \
      'libjpeg62-turbo' \
      'libmbedtls[0-9]*$' \
      'libpng[0-9]+-[0-9]+$' \
      'libwebp[0-9]+$' \
      'libxpm4' \
      'libzip[0-9]$'; \
    rm -rf /var/lib/apt/lists/*;

RUN apt-get update; \
    apt-get install --no-install-recommends -y \
      'cmake' \
      'gnutls-dev' \
      'libbz2-dev' \
      'libfreetype6-dev' \
      'libjpeg62-turbo-dev' \
      'libmbedtls-dev' \
      'libpng-dev' \
      'libssl([0-9]+(\.[0-9]+)*)?-dev$' \
      'libwebp-dev' \
      'libxpm-dev' \
      'libzip-dev' \
      'zlib1g-dev'; \
    docker-php-ext-configure gd --enable-gd --with-webp --with-jpeg --with-xpm --with-freetype; \
    docker-php-ext-configure zip --with-zip; \
    docker-php-ext-install gd; \
    docker-php-ext-install bcmath; \
    docker-php-ext-install opcache; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install zip; \
    apt-get purge \
      'cmake' \
      'gnutls-dev' \
      'libbz2-dev' \
      'libfreetype6-dev' \
      'libjpeg62-turbo-dev' \
      'libmbedtls-dev' \
      'libpng-dev' \
      'libssl([0-9]+(\.[0-9]+)*)?-dev$' \
      'libwebp-dev' \
      'libxpm-dev' \
      'libzip-dev' \
      'zlib1g-dev'; \
    rm -rf /var/lib/apt/lists/*;

WORKDIR "/var/www/"
