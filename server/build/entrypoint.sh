#!/bin/sh
set -e

case $1 in
start)
    openvpn --config /vpn/server.conf
    ;;
init)
    /init.sh
    ;;
create_client)
    cd /easy-rsa/easyrsa3
    ./easyrsa build-client-full $2 nopass
    ;;
*)
    echo $"Usage: $0 {start|init|create_client <CLIENT_NAME>}"
    ;;
esac
