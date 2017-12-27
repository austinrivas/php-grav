FROM phusion/baseimage:0.9.22

MAINTAINER Austin Rivas <austinrivas@gmail.com>

CMD ["/sbin/my_init"]

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Install core packages
RUN apt-get update -q
RUN apt-get upgrade -y -q
RUN apt-get install -y -q build-essential \
    ca-certificates \
    git-core \
    php \
    php-apcu \
    php-cli \
    php-curl \
    php-fpm \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip

# Clean up apt packages
RUN apt-get clean -q && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup Php service
RUN mkdir -p /run/php/
RUN touch /run/php/php7.0-fpm.sock
RUN mkdir -p /etc/service/php-fpm
RUN touch /etc/service/php-fpm/run
RUN chmod +x /etc/service/php-fpm/run
RUN echo '#!/bin/bash \n\
    exec /usr/sbin/php-fpm7.0 -F' >> /etc/service/php-fpm/run

# Setup Grav Directory
RUN mkdir -p /root/grav

# Expose configuration and content volumes
VOLUME /root/grav

# Public ports
EXPOSE 80 22