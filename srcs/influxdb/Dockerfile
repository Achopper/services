#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/06/01 15:46:01 by achopper          #+#    #+#             */
#/*   Updated: 2021/06/01 15:46:01 by achopper         ###   ########.fr       */
#/*                                                                            */
#* ************************************************************************** */

FROM        alpine:3.12

RUN         apk update && apk upgrade && apk add vim openrc curl bash \
            influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/


RUN         mkdir -p etc/influxdb/

RUN         mkdir -p /var/lib/influxdb
RUN         chown -R influxdb:influxdb /var/lib/influxdb

COPY        ./db/* /var/lib/influxdb/

COPY        ./start_influx.sh ./infx_create_db.iql  /tmp/
RUN         chmod 755 /tmp/start_influx.sh

EXPOSE      8086
ENTRYPOINT  ["bash", "/tmp/start_influx.sh"]



