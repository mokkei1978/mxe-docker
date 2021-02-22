#!/bin/bash
#- mxe-nusdas-base イメージを作る
# (気象研での利用を想定し、 HTTP_PROXY を使ってネット上のリソースにアクセスする。)

set -e

cd `dirname $0`

#sh download_nusdas.sh

docker build --build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY} \
       -t mxe-nusdas-base:latest .

exit 0
