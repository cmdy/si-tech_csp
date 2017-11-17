FROM  cmdy/alpine-oracle-jdk:8u152
MAINTAINER  zhanglin_csd@si-tech.com.cn

RUN mkdir /k8s_monitor

COPY ./k8s_monitor/  /k8s_monitor/

CMD ["sh","/k8s_monitor/bin/startMonitor.sh"]
