#!/bin/bash
WD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
docker build -t openvpn-server-image $WD/build