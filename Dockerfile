FROM alpine:3.4
MAINTAINER Chao Shen <shen218@gmail.com>
ADD src /
RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.4/main > /etc/apk/repositories;\
    echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories;\
    apk add --update iptables bash strongswan;\
    rm -rf /var/cache/apk/*
ENV VPN_SUBNET 192.168.2.0/24
CMD ["/start.sh"]

