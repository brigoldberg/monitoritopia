FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install epel-release

COPY influx.repo /etc/yum.repos.d/influx.repo
COPY grafana.repo /etc/yum.repos.d/grafana.repo

RUN yum -y install influxdb telegraf kapacitor grafana supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY influxd.ini /etc/supervisord.d/influxd.ini
COPY grafana.ini /etc/supervisord.d/grafana.ini


