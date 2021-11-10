#!/usr/bin/env bash

openrc boot
openrc-init
rc-update add influxdb
influxd --config /etc/influxdb.conf
