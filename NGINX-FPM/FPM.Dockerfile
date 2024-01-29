FROM php:fpm-alpine

# Add mysqli to the available php extensions using provided helper scripts.
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

CMD ["php-fpm"]
