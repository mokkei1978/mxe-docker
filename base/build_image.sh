#!/bin/bash
#- mxe-base イメージを作る

set -e

cd `dirname $0`

#args="--build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY}"
# (気象研での利用を想定し、 HTTP_PROXY を使ってネット上のリソースにアクセスする。)
args=""

docker build ${args} -t mxe-base:latest . --no-cache=true

#docker tag mxe-base:latest mokkei1978/mxe-base:latest
#docker push mokkei1978/mxe-base:latest
#docker tag mxe-base:latest mokkei1978/mxe-base:3.14.3

exit 0
