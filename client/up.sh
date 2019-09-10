#!/bin/bash
WD="$(
    cd "$(dirname "$0")"
    pwd -P
)"
$WD/down.sh
docker run -d --name openvpn-client \
    -v /etc/localtime:/etc/localtime:ro \
    -v $WD:/vpn \
    --restart unless-stopped \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun \
    --net=host \
    openvpn-client-image --config /vpn/client.conf
