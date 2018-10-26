#!/bin/bash
#- MXE Dockerイメージからコンテナを起動する

set -e

read tag < tag.txt

dir_git_repos="${HOME}/repos/mxe.git"
dir_data="/worka/ocpublic/mxe-data"
name="mxe"

docker run -e http_proxy=${HTTP_PROXY} \
       -v ${dir_git_repos}:/root/mxe.git \
       -v ${dir_data}:/root/MXE/linkdir/mxe-data \
       --rm -it --name ${name} mxe:${tag}

exit 0
