# ベースイメージとしてPHP 7.4とApacheを使用
FROM php:8.1-apache

# Laravelで必要となる拡張機能をインストール
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip git unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql \
    && a2enmod rewrite

# Composerをインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# アプリケーションのソースコードをコンテナ内の/var/www/htmlディレクトリにコピー
COPY . /var/www/html/

# Composerを使用して依存関係をインストール
RUN composer install

# Apacheの設定を変更して、Laravelが正常に動作するようにする
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf
