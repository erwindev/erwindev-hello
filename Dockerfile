FROM ealberto/gradle-docker:2.6
MAINTAINER Erwin Alberto

ENV SERVER_PORT 8081
EXPOSE 8081

#Container setup
RUN mkdir /app
RUN mkdir /app-build
COPY . /app-build
WORKDIR /app-build
RUN gradle clean build && \
    mv build/libs/erwindev-hello.jar /app/ && \
    rm -rf /app-build && \
    rm -rf /root/.gradle

WORKDIR /app
CMD java -Dsun.net.inetaddr.ttl=0 -jar erwindev-hello.jar