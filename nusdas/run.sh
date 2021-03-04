#!/bin/bash

set -e

docker run -e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY} \
       --rm -it --name nusdas mxe-nusdas-base:latest

exit 0
