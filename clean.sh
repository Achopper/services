#!/usr/bin/env bash
kubectl delete svc nginx-srv
kubectl delete deploy nginx-dep

kubectl delete svc wp-svc
kubectl delete deploy wp-dep

kubectl delete svc php-svc
kubectl delete deploy php-dep

kubectl delete deploy mysql-dep
kubectl delete svc mysql-svc
kubectl delete pvc mysql-pv-claim
kubectl delete pv mysql-pv-storage

kubectl delete svc ftps-srv
kubectl delete deploy ftps-dep

kubectl delete svc influxdb-svc
kubectl delete deploy influxdb-dep
kubectl delete pvc influxdb-pv-claim
kubectl delete pv influxdb-pv-storage

kubectl delete deploy telegraf-dep
kubectl delete secret tg-sec

kubectl delete svc grafana-svc
kubectl delete deploy grafana-dep

docker image rm -f ngx_im
docker image rm -f wp_im
docker image rm -f php_im
docker image rm -f ftps_im
docker image rm -f mysql_im
docker image rm -f inflx_im
docker image rm -f telegraf_im
docker image rm -f graf_im

