#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#*   Created: 2021/05/27 17:12:21 by achopper          #+#    #+#             */
#/*   Updated: 2021/05/27 17:12:21 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM       alpine:3.12

RUN        apk update && apk upgrade && apk add mysql mysql-client openrc vim

RUN        adduser -D 'Achopper' -g mysql
COPY       ./my.cnf /etc/
COPY       ./start_mysql.sh ./create_db.sql server_db.sql /tmp/

RUN        chmod 777 ./tmp
EXPOSE     3306

ENTRYPOINT ["sh", "/tmp/start_mysql.sh"]