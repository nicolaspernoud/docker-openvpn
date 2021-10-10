#!/bin/bash
WD="$(
    cd "$(dirname "$0")"
    pwd -P
)"
${WD}/down.sh
docker run -d --name openvpn-server \
    -v /etc/localtime:/etc/localtime:ro \
    -v ${WD}/conf/openvpn/:/vpn/ \
    -v ${WD}/conf/pki/:/easy-rsa/easyrsa3/pki/ \
    --restart unless-stopped \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun \
    --net=host \
    openvpn-server-image start
