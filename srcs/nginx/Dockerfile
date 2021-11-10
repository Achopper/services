#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/05/11 18:15:42 by achopper          #+#    #+#             */
#/*   Updated: 2021/05/11 18:15:42 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM alpine:3.12

RUN     apk update && apk upgrade && apk add nginx openssl openrc vim

RUN     adduser -D 'www' -g www
RUN     mkdir -p /run/nginx && mkdir /www
COPY    nginx-localhost /etc/nginx/nginx.conf
COPY    ./nginx_selfsigned.crt ./dhparam.pem /etc/ssl/certs/
COPY    ./nginx_selfsigned.key /etc/ssl/private/
COPY    ./index.html /www/
RUN     chown -R www:www /var/lib/nginx && \
        chown  -R www:www /www

EXPOSE  80 443

CMD     nginx -g 'daemon off;'
