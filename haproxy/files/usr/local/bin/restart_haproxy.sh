#!/bin/bash
# http://serverfault.com/questions/580595/haproxy-graceful-reload-with-zero-packet-loss
# http://engineeringblog.yelp.com/2015/04/true-zero-downtime-haproxy-reloads.html
# https://github.com/jwilder/docker-discover/blob/master/reload-haproxy.sh
# https://medium.com/@Drew_Stokes/actual-zero-downtime-with-haproxy-18318578fde6#.7edt1jc1n

# hold/pause new requests
iptables -I INPUT -p tcp --dport 8080 --syn -j DROP
sleep 0.5

if [ -f "/var/run/haproxy.pid" ] ; then
    # gracefully restart haproxy
    /usr/local/sbin/haproxy -f /usr/local/etc/haproxy/haproxy_2.cfg -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid) &
else
    /usr/local/sbin/haproxy -f /usr/local/etc/haproxy/haproxy_2.cfg -p /var/run/haproxy.pid &
fi

# allow new requests to come in again
iptables -D INPUT -p tcp --dport 8080 --syn -j DROP
