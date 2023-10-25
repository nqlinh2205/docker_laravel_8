FROM php:8.1-fpm
 
# Add user for laravel application
# Node v-16.12.0

ENV COMPOSER_OPTIONS="--no-plugins --no-interaction"

RUN mkdir -p /home/webike/.composer \
    && mkdir -p /var/www/html \
    && groupadd -g 1000 webike \
    && useradd -u 1000 -ms /bin/bash -g webike -G www-data,root -d /home/webike webike \
    && chown -R webike:webike /home/webike \
    && chown -R webike:webike /var/www/html \
;echo "Add docker alias for development" \
    ;touch /etc/bashrc \
    ;echo '###################################################' >> /etc/bashrc \
    ;echo 'alias ..="cd .."' >> /etc/bashrc \
    ;echo 'alias ll="ls -lh"' >> /etc/bashrc \
    ;echo 'alias artisan="php artisan"' >> /etc/bashrc \
    ;source /etc/bashrc \
;echo "Install system dependencies" \
    ;cd /usr/local/src/ \
    ;apt-get update && apt-get install -y \
    git curl build-essential \
    libpng-dev libonig-dev libxml2-dev libpq-dev libjpeg-dev libfreetype6-dev libmagickwand-dev libgd-dev \
    zip unzip locales vim \
    jpegoptim optipng pngquant gifsicle \
;echo "Install PHP dependencies" \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd pdo pdo_pgsql \ 
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-enable imagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
;echo "Install pecl dependencies" \
    && pecl install imagick \
;echo "Install composer" \
    && cd /usr/local/src/ \
    && curl -sSL https://getcomposer.org/installer | php \
    && mv composer.phar /bin/composer \
    && echo 'export PATH="$PATH:$(composer config --global --absolute home)/vendor/bin"' >> /etc/bashrc \
    ;composer self-update --2 \
    ;composer global config repo.packagist composer https://packagist.org \
;echo "Clean up" \
    ;rm -Rf /tmp/* \
    ;rm -Rf /usr/local/src/* \
    ;rm -Rf /var/cache/dnf \
    ;rm -Rf /var/cache/yum \
    ;rm -Rf /var/lib/rpm/__db.* \
    ;rm -Rf /var/lib/rpm/*.lock \
    ;rm -Rf /var/tmp/dnf-* \
    ;rm -Rf /var/tmp/yum-* \
    ;rm -rf ~/.composer/cache* 

# Setup working directory
WORKDIR /var/www/html
 
USER webike

EXPOSE 9000

CMD ["php-fpm"]
