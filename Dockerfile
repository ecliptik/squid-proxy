FROM alpine
MAINTAINER Micheal Waltz <ecliptik@gmail.com>

#Listen on port 3128
EXPOSE 3128

#Set APP_DIR
ENV APP_DIR /app

#Install squid
RUN apk --no-cache add \
          squid

#Copy in squid.conf
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
COPY squid.conf ${APP_DIR}

#Run squid in non-daemon mode
ENTRYPOINT [ "/usr/sbin/squid" ]
CMD [ "-a", "3128", "-N", "-f", "/app/squid.conf", "-d2" ]
