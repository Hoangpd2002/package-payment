# Sử dụng PHP-FPM mới nhất (hiện tại 8.3)
FROM php:8.3-fpm

# Cài extension cần thiết cho Laravel
RUN apt-get update && apt-get install -y \
    git unzip libpq-dev libzip-dev libonig-dev libxml2-dev curl \
    && docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl bcmath

# Cài composer bản mới nhất
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy code vào container
COPY . .

# Fix permission cho Laravel
RUN mkdir -p /var/www/storage /var/www/bootstrap/cache \
    && chmod -R 777 /var/www/storage /var/www/bootstrap/cache

# Expose cổng cho PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
