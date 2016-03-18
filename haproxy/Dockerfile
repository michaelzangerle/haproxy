FROM haproxy:latest

RUN apt-get update && apt-get install iptables -y \
    && apt-get autoclean -y && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

ADD files /

RUN chmod +x /usr/local/bin/restart_haproxy.sh
