# Combo Alerta/Mongo Docker Image

FROM centos:latest

ARG ALERTAD_VERSION=6.6.1
ARG ALERTA_VERSION=6.5.0

RUN yum -y update; yum clean all
RUN yum -y install epel-release

RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u python36u-devel supervisor gcc git nginx vim net-tools which wget

RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Install and configure MongoDB
COPY mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo
RUN yum -y install mongodb-org mongodb-org-shell
COPY mongod.conf /etc/mongod.conf
RUN mkdir -p /data/db; chown mongod:mongod /data/db

RUN python3.6 -m venv venv
RUN . venv/bin/activate
RUN /venv/bin/pip3 install uwsgi
RUN /venv/bin/pip3 install alerta-server==${ALERTAD_VERSION} alerta==${ALERTA_VERSION}

# Configure NGINX
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-alerta.conf /etc/nginx/conf.d/alerta.conf
RUN chown nginx:nginx /etc/nginx/nginx.conf; chmod 644 /etc/nginx/nginx.conf
RUN chown nginx:nginx /etc/nginx/conf.d/alerta.conf; chmod 644 /etc/nginx/conf.d/alerta.conf

RUN mkdir -p /var/www/html; chown nginx:nginx /var/www/html
RUN mkdir -p /var/run/alerta; chown nginx:nginx /var/run/alerta
RUN mkdir -p /var/log/alerta; chown nginx:nginx /var/log/alerta

# Install proper version of Alerta front end
RUN wget -O alerta-web.tgz https://github.com/alerta/angular-alerta-webui/tarball/master
RUN tar zxvf alerta-web.tgz; cp -r alerta-angular-alerta-webui-*/app/* /var/www/html/
COPY config.json /var/www/html/config.json

# Configure UWSGI
COPY wsgi.py /var/www/wsgi.py
RUN chmod 755 /var/www/wsgi.py && chown nginx:nginx /var/www/wsgi.py
COPY uwsgi.ini /etc/uwsgi.ini

# Alerta configuration files
COPY alertad.conf /etc/alertad.conf
COPY alerta.conf /root/.alerta.conf

# Supervisord
COPY supervisord.conf /etc/supervisord.conf
COPY supervisord.d/mongod.ini /etc/supervisord.d/mongod.ini
COPY supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
COPY supervisord.d/uwsgi.ini /etc/supervisord.d/uwsgi.ini
