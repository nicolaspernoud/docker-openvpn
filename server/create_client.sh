#!/bin/bash
WD="$(
    cd "$(dirname "$0")"
    pwd -P
)"
${WD}/down.sh
if [ "$1" == "" ]; then
    echo $"Usage: $0 <CLIENT_NAME>"
    exit 0
fi
docker run \
    -v /etc/localtime:/etc/localtime:ro \
    -v ${WD}/conf/pki/:/easy-rsa/easyrsa3/pki/ \
    openvpn-server-image create_client $1
