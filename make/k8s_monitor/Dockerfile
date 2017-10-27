FROM photon:latest
MAINTAINER  zhanglin_csd@si-tech.com.cn

RUN mkdir /k8s_monitor
RUN mkdir /jdk1.8.0_91

COPY ./jdk1.8.0_91/  /jdk1.8.0_91/
RUN chmod -R +x /jdk1.8.0_91

COPY ./k8s_monitor/  /k8s_monitor/

CMD ["sh","/k8s_monitor/bin/startMonitor.sh"]
