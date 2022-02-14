#!/bin/bash

set -e

time docker run \
    -v "$PWD/../":$HOME/go/src/github.com/bnhf/openvpn-tap-external-web-ui \
    --rm \
    -w /usr/src/myapp \
    tyzbit/beego:1.9.4 \
    sh -c "cd $HOME/go/src/github.com/bnhf/openvpn-tap-external-web-ui/ && bee version && bee pack -exr='^vendor|^data.db|^build|^README.md|^docs'"
cd github.com