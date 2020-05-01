FROM ccy1219/docker-img-base:ubuntu-1804-tools

LABEL maintainer="ccy1219@gmail.com"

RUN pt-get install docker.io -y
