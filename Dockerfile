FROM docker:latest
MAINTAINER fnndsc "contact@thenandan.dev"

## AWS cli
RUN apk add --no-cache python3
RUN apk add --no-cache docker-compose
RUN apk add --no-cache py3-setuptools
RUN apk add --no-cache --update curl jq python3 py-pip
RUN pip install awscli
RUN pip install wheel

CMD sh