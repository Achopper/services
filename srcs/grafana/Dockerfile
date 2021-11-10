#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/06/06 16:13:14 by achopper          #+#    #+#             */
#/*   Updated: 2021/06/06 16:13:14 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM    alpine:3.12

RUN     apk update && apk upgrade && apk add vim openrc \
        grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community grafana

COPY    ./dashboards/* usr/share/grafana/conf/dashboards/
COPY    dashboards.yaml  /usr/share/grafana/conf/provisioning/dashboards/
COPY    datasources.yaml /usr/share/grafana/conf/provisioning/datasources/

EXPOSE  3000
CMD     grafana-server -homepath /usr/share/grafana
