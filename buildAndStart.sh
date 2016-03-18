#!/bin/bash

echo "Building images..."
docker build -t mzangerle/nginx-php-fpm nginx
docker build -t mzangerle/haproxy haproxy

echo "Removing container ..."
docker rm -f nginx1 nginx2 nginx3 haproxy

echo "Starting container ..."
docker run --name nginx1 -p 8181:80 -d mzangerle/nginx-php-fpm
docker run --name nginx2 -p 8282:80 -d mzangerle/nginx-php-fpm
docker run --name nginx3 -p 8383:80 -d mzangerle/nginx-php-fpm
docker run --privileged --name haproxy -p 8080:80 -d mzangerle/haproxy
