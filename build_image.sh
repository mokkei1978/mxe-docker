#!/bin/bash
#- Dockerfile を使ってイメージを構築する

set -e

read tag < tag.txt

docker build --build-arg http_proxy=${HTTP_PROXY} -t mxe:${tag} .

exit 0
