#!/bin/bash
#- mxe-nusdas-base w/ emacs イメージを作る

set -e

cd `dirname $0`

docker build --build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY} \
       -t mxe-nusdas-base:emacs .

exit 0
