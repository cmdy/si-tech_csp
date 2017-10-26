FROM vmware/photon:1.0
MAINTAINER  zhanglin_csd@si-tech.com.cn

ADD ./jdk1.8.0_91 /

ADD ./k8s_monitor /

RUN ./k8s_monitor/bin/startMonitor.sh
