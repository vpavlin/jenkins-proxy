FROM registry.centos.org/kbsingh/openshift-nginx:1.10.2
MAINTAINER "Vašek Pavlín <vasek@redhat.com>"

ENV LANG=en_US.utf8

USER root

RUN yum -y install gettext && yum clean all

# Clear out the default config
RUN rm -rf /etc/nginx/conf.d/default.conf

RUN rm /usr/share/nginx/html/*

RUN chgrp -R 0 /usr/share/nginx/html &&\
    chmod -R g+rwX /usr/share/nginx/html &&\
    chmod +x /usr/share/nginx/html

RUN chgrp -R 0 /var/log/nginx &&\
    chmod -R g+rwX /var/log/nginx &&\
    chmod +x /var/log/nginx

ADD root /
ADD health_check.sh /opt/jenkins-proxy/health_check.sh
RUN chmod +x /opt/jenkins-proxy/health_check.sh

