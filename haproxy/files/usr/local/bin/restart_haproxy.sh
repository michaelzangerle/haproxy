#!/bin/bash

# hold/pause new requests
iptables -I INPUT -p tcp --dport 8080 --syn -j DROP
sleep 1

if [ -f "/var/run/haproxy.pid" ] ; then
    # gracefully restart haproxy
    /usr/local/sbin/haproxy -f /usr/local/etc/haproxy/haproxy_2.cfg -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid) &
else 
    /usr/local/sbin/haproxy -f /usr/local/etc/haproxy/haproxy_2.cfg -p /var/run/haproxy.pid & 
fi

# allow new requests to come in again
iptables -D INPUT -p tcp --dport 8080 --syn -j DROP
