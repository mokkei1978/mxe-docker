#!/bin/bash
#- 自分の設定ファイルをコンテナ内にコピーする

set -e

name="mxe"

docker cp ${HOME}/.gitconfig ${name}:/root/
docker cp myconf/test.sh ${name}:/root/MXE/

exit 0
