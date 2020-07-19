FROM alpine:3.11
MAINTAINER fnndsc "keshari.nandan2@gmail.com"

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates && \
    echo "https://dl.bintray.com/php-alpine/v3.11/php-7.4" >> /etc/apk/repositories

# Add Curl
RUN apk --no-cache add curl

# install php and some extensions
RUN apk add --update \
    php \
    php-bcmath \
    php-ctype \
    php-json \
    php-mbstring \
    php-openssl \
    php-pdo \
    php-curl \
    php-gd \
    php-ldap \
    php-mysqli \
    php-fpm \
    php-zip \
    php-xdebug


# Install Git
RUN apk add git

# Install Composer
RUN apk add composer

# AWS cli
RUN apk add --no-cache python py-pip
RUN pip install awscli

# Install Docker
RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libseccomp
RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community docker

ENTRYPOINT ["git", "composer", "php", "docker"]