FROM mysql:5.6.35

MAINTAINER  zhanglin_csd@si-tech.com.cn

WORKDIR /tmp

ADD rm_docker.sql rm_docker.sql 

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh 

