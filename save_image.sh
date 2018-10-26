#!/bin/bash
#- 作成したイメージをファイルに保存する

set -e

read tag < tag.txt

docker save mxe:${tag} -o mxe-docker-${tag}.tar

#- 保存したイメージを読み込むには docker load -i [tar file]

exit 0
