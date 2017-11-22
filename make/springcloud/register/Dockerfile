FROM cmdy/alpine-oracle-jdk:8u152
MAINTAINER zhanglin_csd@si-tech.com.cn

RUN mkdir /register

COPY ./eureka-server-1.0.0-SNAPSHOT.jar /register
#COPY ./application-server2.yml /register

WORKDIR /register

CMD ["java","-jar","eureka-server-1.0.0-SNAPSHOT.jar"]
