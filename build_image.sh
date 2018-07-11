#!/bin/bash
#- Dockerfile を使ってイメージを構築する

set -e

docker build --build-arg http_proxy=${HTTP_PROXY} -t mxe:4.5.06 .

exit 0
