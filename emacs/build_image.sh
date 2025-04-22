#!/bin/bash
#- mxe-base w/ emacs イメージを作る

set -e

cd `dirname $0`

docker build -t mxe-base:emacs .
# --build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY} #- If proxy is needed

exit 0
