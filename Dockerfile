FROM ubuntu:14.04

MAINTAINER Micheal Waltz <ecliptik@gmail.com>

#Setup basic environment
ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US.UTF-8

#Install squid3 package
RUN apt-get -q update && \
    apt-get -qy upgrade && \
    apt-get -qy install squid3 && \
    apt-get clean

#Copy in squid.conf
COPY [ "/squid.conf", "/app/" ]

#Expose squid proxy port
EXPOSE 3128

#Run squid in non-daemon mode
ENTRYPOINT [ "/usr/sbin/squid3", "-a", "3128", "-N", "-f", "/app/squid.conf", "-d2" ]
