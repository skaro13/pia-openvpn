FROM alpine:latest
MAINTAINER Simon Caron <simon.caron@protonmail.com>

RUN apk add --no-cache openvpn

WORKDIR /tmp
RUN wget https://www.privateinternetaccess.com/openvpn/openvpn.zip 
RUN mkdir /pia && unzip openvpn.zip -d /pia

WORKDIR /pia
COPY openvpn.sh /usr/local/bin/openvpn.sh

ENV REGION="US East"
ENTRYPOINT ["openvpn.sh"]