# Proxy node

FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install epel-release 

RUN yum -y install nginx supervisor httpd-tools

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf
COPY nginx.ini /etc/supervisord.d/nginx.ini
