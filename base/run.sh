#!/bin/bash

set -e

name=base

docker run -e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY} \
       --rm -it --name ${name} mokkei1978/mxe-base:latest

exit 0
