#!/bin/bash
#- Dockerfile を使ってイメージを構築する

set -e

#read tag < ../tag.txt
tag="latest"

docker build --build-arg http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY} \
       -t mxe-base:${tag} --no-cache=true .

exit 0
