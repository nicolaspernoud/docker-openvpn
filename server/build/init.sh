#!/bin/sh
set -e

cd easy-rsa/easyrsa3/

./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa gen-dh
./easyrsa build-server-full server nopass
openvpn --genkey --secret ./pki/ta.key

# Save data
cp -r pki/* /tmp/pki/
