FROM php:7.1.8-apache

# APT 自动安装 PHP 相关的依赖包,如需其他依赖包在此添加
RUN apt-get update \
    && apt-get install -y \
        libmcrypt-dev \
        libz-dev \
        git \
        wget \
        libpcre3-dev \

    # 官方 PHP 镜像内置命令，安装 PHP 依赖
    && docker-php-ext-install \
        mcrypt \
        mbstring \
        pdo_mysql \
        zip \


    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    # 安装 Composer，此物是 PHP 用来管理依赖关系的工具
    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer

# 开启 URL 重写模块
# 配置默认放置 App 的目录
RUN a2enmod rewrite \
    && mkdir -p /laravel_conf \
    && rm -fr /var/www/html \
    && ln -s /app/public /var/www/html

WORKDIR /laravel_conf

# 预先加载 Composer 包依赖，优化 Docker 构建镜像的速度
COPY ./composer.json /laravel_conf/
COPY ./composer.lock /laravel_conf/
RUN composer install  --no-autoloader --no-scripts

