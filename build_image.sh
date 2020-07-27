#!/bin/bash
#- Dockerfile を使ってイメージを構築する (通信なし)

set -e

if [ ! -d ~/MXE ]; then
    echo "ERROR: ~/MXE is not found."
    exit 1
fi

dir=`pwd`
uid=`id -u`
gid=`id -g`
user=`id -nu`
group=`id -ng`

rm -f mxe.tar

mkdir -p ~/temp
cd ~/temp/
rm -fr MXE
rm -f mxe.tar
git clone -b master ~/MXE/
(cd MXE/setting/; ln -s sh/print.sh . ; ln -s machine/docker-debug/macros.make .)
(cd MXE/; ln -s setting/sh/test.sh . )
echo "/home/${user}/stream.txt" > MXE/setting/stream.conf
tar -cf mxe.tar MXE/
mv mxe.tar ${dir}/
cd ${dir}/

docker build --build-arg user=${user} --build-arg uid=${uid} \
       --build-arg group=${group} --build-arg gid=${gid} \
       -t mxe:${user} --no-cache=true .

exit 0
