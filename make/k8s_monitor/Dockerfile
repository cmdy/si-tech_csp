FROM openshift/base-centos7:latest
MAINTAINER  zhanglin_csd@si-tech.com.cn

COPY ./jdk1.8.0_91 /

COPY ./k8s_monitor /

#RUN  chmod u+x  /k8s_monitor/bin/startMonitor.sh
#CMD ["sh","/k8s_monitor/bin/startMonitor.sh"]
CMD ["/bin/sh","/k8s_monitor/bin/startMonitor.sh"]
