#!/bin/bash

# https://github.com/CentOS/CentOS-Dockerfiles/blob/master/httpd/centos7/run-httpd.sh


# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
#rm -rf /run/apache2/* /tmp/apache2*

echo "ServerName localhost" >> /etc/apache2/httpd.conf
#service apache2 restart
exec /usr/sbin/apache2ctl -DFOREGROUND
