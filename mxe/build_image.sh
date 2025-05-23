#!/bin/bash
#- 自分のユーザー設定を行った mxe イメージを作る (通信なし)
#- 事前に ~/mxe/ にMXEをgit cloneしておく

set -e

if [ ! -d ~/mxe ]; then
    echo "ERROR: ~/mxe is not found."
    exit 1
fi

if [ ! "docker image ls -q mxe-base" ]; then
    echo "ERROR: base image is not found: See README.md"
    exit 1
fi

dir=`pwd`
uid=`id -u`
gid=`id -g`
user=`id -nu`
group=`id -ng`

rm -f mxe.tar

mkdir -p temp
cd temp/
rm -fr mxe
rm -f mxe.tar
git clone -b master ~/mxe/
(cd mxe/setting/; ln -s sh/print.sh . ; ln -s machine/docker-main/macros.make .)
(cd mxe/; ln -s setting/sh/test.sh . )
echo "/home/${user}/stream.txt" > mxe/setting/stream.conf
tar -cf mxe.tar mxe/
rm -fr mxe
mv mxe.tar ${dir}/
cd ${dir}/

docker build --build-arg user=${user} --build-arg uid=${uid} \
       --build-arg group=${group} --build-arg gid=${gid} \
       -t mxe:${user} --no-cache=true .

exit 0
