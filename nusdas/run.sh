#!/bin/bash

set -e

name=nusdas

docker run -e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY} \
       --rm -it --name ${name} mxe-nusdas-base:latest

exit 0
