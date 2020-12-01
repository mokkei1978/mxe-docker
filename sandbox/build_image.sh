#!/bin/bash
#- 自分のユーザー設定を行った mxe-base イメージ(sandbox)を作る (通信なし)

set -e

if [ ! "docker image ls -q mokkei1978/mxe-base" ]; then
    docker pull mokkei1978/mxe-base:latest
fi

uid=`id -u`
gid=`id -g`
user=`id -nu`
group=`id -ng`

docker build --build-arg user=${user} --build-arg uid=${uid} \
       --build-arg group=${group} --build-arg gid=${gid} \
       -t sandbox:${user} .

exit 0
