FROM centos:centos8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y 

RUN yum install httpd -y

COPY ./index.html /var/www/html

RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

RUN httpd -k restart

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
