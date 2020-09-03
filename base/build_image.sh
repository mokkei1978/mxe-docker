#!/bin/bash
#-mxe-base イメージを作る

set -e

cd `dirname $0`

#read tag < ../tag.txt
tag="latest"

docker build --build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY} \
       -t mxe-base:${tag} --no-cache=true .

exit 0
