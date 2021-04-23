#!/bin/bash

set -e

time docker run \
    -v "$PWD/../":/go/src/github.com/tyzbit/openvpn-web-ui \
    --rm \
    -w /usr/src/myapp \
    awalach/beego:1.8.1 \
    sh -c "bee run -gendoc=true"
