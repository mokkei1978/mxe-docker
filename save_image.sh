#!/bin/bash
#- 作成したイメージをファイルに保存する

set -e

tag=4.5.06

docker save mxe:${tag} -o mxe-docker-${tag}.tar

#- 保存したイメージを読み込むには docker load -i [tar file]

exit 0
