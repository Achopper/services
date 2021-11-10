#!/usr/bin/env bash

COL='\033[0;32m'
NC='\033[0m'

minikube start --driver=virtualbox --memory 3g --cpus 3

minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb
eval "$(minikube docker-env)"
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
kubectl apply -f ./srcs/metallb_conf.yaml

printf "\n${COL} ----------------------------------BUILDING IMAGES--------------------------------------------\n${NC}"

docker build -t ngx_im ./srcs/nginx/
docker build -t mysql_im ./srcs/mysql/
docker build -t wp_im ./srcs/wordpress/
docker build -t php_im ./srcs/phpmyadm/
docker build -t ftps_im srcs/ftps
docker build -t inflx_im srcs/influxdb
docker build -t telegraf_im srcs/telegraf
docker build -t graf_im ./srcs/grafana

printf "\n${COL} ---------------------------------DEPLOING SERVICES-------------------------------------------\n${NC}"
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/phpmyadm.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/telegraf.yaml
kubectl apply -f ./srcs/grafana.yaml

minikube dashboard
