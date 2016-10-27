FROM ubuntu:14.04
MAINTAINER gree2 "hqlgree2@gmail.com"
ENV REFRESHED_AT 2014-06-01
RUN apt-get -yqq update && apt-get -yqq install nginx
RUN mkdir -p /var/www/html/website
ADD nginx/global.conf /etc/nginx/conf.d/global.conf
ADD nginx/nginx.conf /etc/nginx/nginx.conf
# ADD website/index.html /var/www/html/website/index.html
EXPOSE 80