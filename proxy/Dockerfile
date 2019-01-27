# Proxy node

FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install epel-release 

RUN yum -y install nginx supervisor

COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy-pass.conf /etc/nginx/conf.d/proxy-pass.conf

COPY nginx.ini /etc/supervisord.d/nginx.ini
