#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/05/12 18:57:47 by achopper          #+#    #+#             */
#/*   Updated: 2021/05/12 18:57:47 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM  alpine:3.12

RUN     apk update && apk upgrade && apk add nginx openrc php7-common php7-session php7-fpm php7-mcrypt php7-soap \
        php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu \
        php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader \
        php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype vim wget supervisor

RUN     mkdir -p /var/www/html/wordpress && mkdir -p /run/nginx

RUN     wget http://wordpress.org/latest.tar.gz \
        && tar -xzvf latest.tar.gz -C /var/www/html/ \
        && rm latest.tar.gz

COPY    ./nginx_selfsigned.crt /etc/ssl/certs/
COPY    ./nginx_selfsigned.key /etc/ssl/private/

RUN     adduser -D 'www' -g www
COPY    nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./wp-config.php /var/www/html/wordpress/
RUN     chown -R www:www /var/www/html/wordpress \
        && chmod -R 777 /var/www/html/wordpress \
        && chown -R www:www /var/www \
        && chmod -R 777 /var/www

COPY    ./wp_start.sh .
COPY    ./supervisord.conf /etc/supervisord.conf
RUN     chmod +x ./wp_start.sh

EXPOSE	5050

CMD     ./wp_start.sh

