FROM cmdy/alpine-oracle-jdk:8u152
MAINTAINER zhanglin_csd@si-tech.com.cn

RUN mkdir /api-gateway

COPY ./api-gateway-1.0.0-SNAPSHOT.jar /api-gateway
#COPY ./application-production.yml /api-gateway

WORKDIR /api-gateway

CMD ["java","-jar","api-gateway-1.0.0-SNAPSHOT.jar"]
