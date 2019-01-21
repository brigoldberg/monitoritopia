# Nagios Dockerfile

FROM centos:latest

RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

RUN yum -y install epel-release
RUN yum -y install httpd supervisor
RUN yum -y install nagios nagios-common nagios-contrib nagios-devel nrpe nsca nagios-plugins-all nagios-plugins-nrpe
RUN yum -y install perl-net-snmp perl-Data-Dumper
RUN yum -y install git curl gcc make libcurl-devel jansson-devel

RUN git clone https://github.com/alerta/nagios-alerta.git
RUN cd nagios-alerta && make nagios4 && make install

COPY supervisord.conf /etc/supervisord.conf
COPY httpd.ini /etc/supervisord.d/httpd.ini
COPY nagios.ini /etc/supervisord.d/nagios.ini
