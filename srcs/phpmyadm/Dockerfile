#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/05/13 17:46:22 by achopper          #+#    #+#             */
#/*   Updated: 2021/05/13 17:46:22 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM alpine:3.12

RUN      apk update && apk upgrade && apk add nginx openrc vim php7-common php7-session php7-fpm php7-mcrypt php7-soap \
         php7-openssl php7-gmp php7-pdo_odbc php7-json php7-mbstring php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu \
         php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader \
         php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype supervisor

RUN     adduser -D 'www' -g www
RUN     mkdir -p /run/nginx  \
        && chown -R www:www /var/www \
        && chown -R www:www /var/lib/nginx \
        && chmod -R 777 /var/www
COPY    ./nginx_selfsigned.crt /etc/ssl/certs/
COPY    ./nginx_selfsigned.key /etc/ssl/private/
COPY    nginx.conf /etc/nginx/nginx.conf
COPY    ./supervisord.conf etc/supervisord.conf


ADD     https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz /
RUN     tar -xf phpMyAdmin-5.1.0-all-languages.tar.gz && rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz && \
                            mv phpMyAdmin-5.1.0-all-languages phpmyadmin && mv phpmyadmin var/www
COPY    ./config.inc.php /var/www/phpmyadmin/
RUN     mkdir var/www/phpmyadmin/tmp  \
        && chown -R www:www /var/www/phpmyadmin \
        && chmod -R 777 /var/www/phpmyadmin/tmp

COPY    ./php_start.sh .
RUN     chmod +x ./php_start.sh

CMD     ./php_start.sh
