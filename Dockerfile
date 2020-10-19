FROM php:7.4-fpm AS build

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions \
  bcmath \
  gd \
  opcache \
  pdo_mysql \
  xdebug \
  zip;

WORKDIR "/var/www/"
