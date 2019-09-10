#!/bin/bash
WD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
$WD/down.sh
docker run \
    -v /etc/localtime:/etc/localtime:ro \
    -v $WD/conf/pki/:/tmp/pki \
    -e EASYRSA_REQ_COUNTRY="CHANGE_THIS" \
    -e EASYRSA_REQ_PROVINCE="CHANGE_THIS" \
    -e EASYRSA_REQ_CITY="CHANGE_THIS" \
    -e EASYRSA_REQ_ORG="CHANGE_THIS" \
    -e EASYRSA_REQ_EMAIL="CHANGE_THIS" \
    -e EASYRSA_REQ_OU="CHANGE_THIS" \
    -e EASYRSA_REQ_CN="CHANGE_THIS" \
    -e EASYRSA_BATCH="true" \
    openvpn-server-image init
