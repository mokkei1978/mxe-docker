#!/bin/bash
#- mxe-base + wgrib2 イメージを作る

set -e

cd `dirname $0`

#sh download_wgrib2.sh

docker build -t mxe-base:wgrib2 .

exit 0
