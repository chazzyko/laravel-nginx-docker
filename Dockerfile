FROM php:7.4-fpm-alpine

# Copy composer.lock and composer.json
COPY src/composer.lock src/composer.json /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib

# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Xdebug installation
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# Copy the configuration file into xdebug, if running phpinfo() you see the loaded file is not this one, change the path accordingly. 
# COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Change current user to www
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

