#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/06/01 16:26:24 by achopper          #+#    #+#             */
#/*   Updated: 2021/06/01 16:26:24 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM        alpine:3.12

RUN         apk update && apk upgrade && apk add vim openrc telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY        ./telegraf.conf /etc/telegraf/

CMD         telegraf

