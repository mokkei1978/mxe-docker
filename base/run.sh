#!/bin/bash

set -e

name=base

#args="-e http_proxy=${HTTP_PROXY} --build-arg HTTPS_PROXY=${HTTP_PROXY}"
args=""

docker run ${args} --rm -it --name ${name} mokkei1978/mxe-base:3.13.3

exit 0
