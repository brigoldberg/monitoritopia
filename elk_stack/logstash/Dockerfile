# Custom logstash Dockerbuild file

FROM centos:latest

RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Install base and elastic packages
RUN yum -y install epel-release
RUN yum -y install supervisor vim tree which java-1.8.0-openjdk 

COPY elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN yum -y install logstash

# Supervisor configuration
COPY supervisord.conf /etc/supervisord.conf
COPY logstash.ini /etc/supervisord.d/logstash.ini

