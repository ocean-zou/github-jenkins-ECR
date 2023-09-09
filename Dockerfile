# 使用 PHP 官方映像作為基底
#FROM php:8.1.21-fpm

FROM --platform=linux/amd64 php:8.1.21-fpm

# 安裝相依套件
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# 安裝 PHP 擴充套件
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip

# 安裝 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 設定工作目錄
WORKDIR /var/www

# 複製 Laravel 應用程式內容
COPY . /var/www

# 安裝 Laravel 相依套件
RUN composer install --no-scripts

# 設置文件權限
RUN chown -R www-data:www-data /var/www
RUN chmod -R 777 /var/www/storage

# 啟動 PHP-FPM
CMD ["php-fpm"]

EXPOSE 9000
