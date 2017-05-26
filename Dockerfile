FROM alpine:3.5

LABEL maintainer "Peerasan Buranasanti <peerasan@gmail.com>"
LABEL version="1.0"
LABEL description="Minimalist Alpine + Nginx + PHP (PHP5 & PHP7)"


#RUN apk upgrade -U && apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing --repository=http://dl-4.alpinelinux.org/alpine/edge/main add \
RUN apk upgrade -U && apk --update add \
	nginx \
	php5 php5-fpm php5-json php5-mysqli php5-pdo_mysql php5-openssl\
	php7 php7-fpm php7-session php7-json php7-mysqli php7-mbstring

COPY fs /

RUN mkdir -p /apps; \
	mkdir -p /var/log/php7; \
	mkdir -p /var/log/php5; \
	chown -Rf nginx:nginx /apps
	
RUN rm -fr /var/cache/apk/*

EXPOSE 80 3306
STOPSIGNAL SIGQUIT

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
