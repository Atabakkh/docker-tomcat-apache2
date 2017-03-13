#get ubuntu
FROM ubuntu:16.04

#update and install apache 
RUN apt-get -y update && apt-get clean all
RUN apt-get -y install apache2 \
    && apt-get -y install default-jdk \
    && apt-get -y install wget \
    && apt-get clean all

# create user
RUN groupadd tomcat \
    && useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# install tomcat
RUN wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz \
    && tar -xzvf apache-tomcat-8.5.11.tar.gz \
    && mv apache-tomcat-8.5.11 /opt/tomcat \
    && chgrp -R tomcat /opt/tomcat \
    && chown -R tomcat /opt/tomcat \
    && chmod -R 755 /opt/tomcat

#set config
ADD service.conf .
RUN cat service.conf >> /etc/systemd/system/tomcat.service


# Install mod_jk
#RUN curl -SL https://www.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz -o tomcat-connectors-1.2.42-src.tar.gz \
#    && mkdir -p src/tomcat-connectors \
#    && tar xzf tomcat-connectors-1.2.42-src.tar.gz -C src/tomcat-connectors --strip-components=1 \
#    && cd src/tomcat-connectors/native/ \
#    && ./configure  \
#    && make \
#    && cp apache-2.0/mod_jk.so /usr/lib64/httpd/modules/ \
#    && ./libtool --finish /usr/lib64/httpd/modules/ \
#    && cd / \
#    && rm -rf src/ \
#    && rm -f tomcat-connectors-1.2.42-src.tar.gz

# mod_jk conf files
#ADD mod_jk.conf /etc/apache2/conf.d/
ADD workers.properties /etc/apache2/conf.d/

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
