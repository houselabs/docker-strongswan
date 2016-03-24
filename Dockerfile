FROM alpine:3.3
MAINTAINER Chao Shen <shen218@gmail.com>
ADD src /
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.3/main > /etc/apk/repositories;\
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories;\
    apk add --update iptables bash strongswan;\
    rm -rf /var/cache/apk/*
ENV VPN_SUBNET 192.168.2.0/24
CMD ["/start.sh"]

