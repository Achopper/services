#!/usr/bin/env bash

mkdir -p /ftps/achopper \
	&& adduser -h /ftps/achopper -D achopper \
	&& echo 'achopper:123' | chpasswd \
	&& chmod -R 777 /ftps \
	&& chown -R achopper:achopper /ftps

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
