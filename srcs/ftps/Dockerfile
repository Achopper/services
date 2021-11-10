#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: achopper <achopper@student.42.fr>          +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2021/05/28 21:44:25 by achopper          #+#    #+#             */
#/*   Updated: 2021/05/28 21:44:25 by achopper         ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM    alpine:3.12

RUN     apk update && apk upgrade && apk add vsftpd bash openssl openrc vim

COPY    ./vsftpd.pem /etc/ssl/certs/vsftpd.pem
COPY    ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY    ./start.sh .
RUN     chmod +x ./start.sh && chmod 777 /etc/vsftpd/vsftpd.conf

EXPOSE   20 21
CMD     ./start.sh