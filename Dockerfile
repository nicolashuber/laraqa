FROM php:8.2

# Install build dependencies
RUN set -eux \
	&& apt-get update \
	&& apt-get install -qy \
        ca-certificates \
        git \
        curl \
        zip \
        unzip \
        libmcrypt-dev

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install PHP CS
RUN set -eux \
	&& composer global require "squizlabs/php_codesniffer=*"

# Install PHP Larastan
RUN set -eux \
	&& composer global require nunomaduro/larastan

# Install PHP MD
RUN set -eux \
	&& composer global require phpmd/phpmd

# Copy config
RUN mkdir /phpqa
COPY config/* /phpqa

WORKDIR /app

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
