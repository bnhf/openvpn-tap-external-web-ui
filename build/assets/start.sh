#!/bin/bash

set -e
OVDIR=/etc/openvpn

cd /opt/

if [ ! -f $OVDIR/.provisioned ]; then
  echo "Preparing vars"
  mkdir -p $OVDIR
  ./scripts/generate_ca_and_server_certs.sh
#  openssl dhparam -dsaparam -out $OVDIR/dh2048.pem 2048
  touch $OVDIR/.provisioned
fi

export PIVPN_SERVER=$(awk -F= '/server/ {print $2}' \
                    /etc/openvpn/easy-rsa/pki/index.txt \
                    | awk -F/ '{print $1}')
cd /opt/openvpn-gui
mkdir -p db
./openvpn-tap-external-web-ui
echo "Starting!"

