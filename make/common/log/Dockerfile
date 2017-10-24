FROM vmware/rsyslog-photon:8.15.0
MAINTAINER  zhanglin_csd@si-tech.com.cn
ADD ./rsyslog.conf /etc/rsyslog.conf

# rotate logs weekly
# notes: file name cannot contain dot, or the script will not run
ADD ./rotate.sh /etc/cron.daily/rotate

# rsyslog configuration file for docker
ADD ./rsyslog_docker.conf /etc/rsyslog.d/

VOLUME /var/log/docker/

EXPOSE 514

CMD crond && rm -f /var/run/rsyslogd.pid && rsyslogd -n
