FROM php:7.4-alpine
MAINTAINER fnndsc "keshari.nandan2@gmail.com"

# Add Curl
RUN apk --no-cache add curl

## Install Git
RUN apk add git

## Install Composer
RUN apk add --no-cache composer

## AWS cli
RUN apk add python3
RUN apk add --no-cache python3 py-pip
RUN pip install awscli
#
## Install Docker
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libseccomp
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community docker

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]