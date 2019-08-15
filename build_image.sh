#!/bin/bash
#- Dockerfile を使ってイメージを構築する

set -e

read tag < tag.txt

dir=`pwd`

rm -f mxe.tar
(mkdir -p ~/temp ; cd ~/temp/ ; rm -fr MXE ; rm -f mxe.tar ; git clone -b master ~/MXE/; echo "/root/stream.txt" > MXE/setting/stream.conf ; tar cvf mxe.tar MXE/ ; mv mxe.tar ${dir}/ )

docker build -t mxe:${tag} --no-cache=true .

rm -f mxe.tar

exit 0
