#!/bin/bash
#- mxe-base イメージを作る

set -e

cd `dirname $0`

#args="--build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY}"
# (気象研での利用を想定し、 HTTP_PROXY を使ってネット上のリソースにアクセスする。)
args=""

docker build ${args} -t mokkei1978/mxe-base:3.13.3 . --no-cache=true

#docker push mokkei1978/mxe-base:latest

exit 0
