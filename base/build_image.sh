#!/bin/bash
#- mxe-base イメージを作る
# (気象研での利用を想定し、 HTTP_PROXY を使ってネット上のリソースにアクセスする。)

set -e

cd `dirname $0`

docker build --build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY} \
       -t mokkei1978/mxe-base:latest .
# --no-cache=true

#docker push mokkei1978/mxe-base:latest

exit 0
