FROM vmware/photon:1.0
MAINTAINER  zhanglin_csd@si-tech.com.cn

ADD ./jdk1.8.0_91 /

ADD ./k8s_monitor /

RUN  chmod u+x  /k8s_monitor/bin/startMonitor.sh
CMD ["sh","/k8s_monitor/bin/startMonitor.sh"]
