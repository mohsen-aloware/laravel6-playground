FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
    supervisor \
    cron \
    vim \
    nano \
    git \
    unzip \
    pkg-config \
    zlib1g-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libicu-dev \
    g++

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime

RUN docker-php-ext-install pdo pdo_mysql zip sockets intl opcache bcmath

RUN pecl install redis \
    && docker-php-ext-enable redis

# Install xdebug
#RUN pecl install xdebug
#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug
#RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

ADD cron /etc/cron.d/api-cron
RUN chmod 0644 /etc/cron.d/api-cron
RUN crontab /etc/cron.d/api-cron

ADD ./supervisord.conf /etc/supervisord.conf
ADD ./entrypoint.sh /var/local/entrypoint.sh

RUN chmod +x /var/local/entrypoint.sh

WORKDIR /www

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]

