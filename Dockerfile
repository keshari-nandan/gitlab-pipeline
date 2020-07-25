FROM docker:latest
MAINTAINER fnndsc "keshari.nandan2@gmail.com"

## AWS cli
RUN apk add --no-cache python3
RUN apk add --no-cache curl jq python3 py-pip
RUN pip install awscli

CMD ["/bin/sh"]

ENTRYPOINT ["docker", "aws"]