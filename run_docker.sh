#!/bin/bash
#- MXE Dockerイメージからコンテナを起動する

set -e

dir_git_repos="${HOME}/repos/mxe.git"
dir_data="/worka/ocpublic/mxe-data"
name="mxe"

docker run -e http_proxy=${HTTP_PROXY} \
       -v ${dir_git_repos}:/root/MXE/linkdir/mxe.git \
       -v ${dir_data}:/root/MXE/linkdir/mxe-data \
       --rm -it --name ${name} mxe:4.5.06

exit 0
