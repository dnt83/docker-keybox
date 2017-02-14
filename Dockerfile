# Using https://github.com/phusion/baseimage-docker as a base image
FROM openjdk:8-jdk-alpine
MAINTAINER Diego Schmidt <dceschmidt@gmail.com>

RUN mkdir -p /opt \
    && apk add --no-cache wget curl \
    && curl -s "https://api.github.com/repos/skavanagh/KeyBox/releases" \
    | grep "browser_download_url" \
    | head -n 1 \
    | cut -d '"' -f 4 \
    | xargs wget -qO- {} \
    | tar -xzC /opt

EXPOSE 8443/tcp
VOLUME /config

COPY start.sh /a/start.sh
RUN chmod +x /a/start.sh

ENTRYPOINT /a/start.sh
