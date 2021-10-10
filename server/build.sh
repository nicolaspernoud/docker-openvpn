#!/bin/bash
WD="$(
    cd "$(dirname "$0")"
    pwd -P
)"
${WD}/down.sh
docker build -t openvpn-server-image ${WD}/build
