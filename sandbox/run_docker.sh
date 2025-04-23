#!/bin/bash
#- 自分の sandbox コンテナを立ち上げる (共有ディレクトリ: ~/sandbox/)

set -e

user=`id -nu`
#name="${user}"
name="sandbox"
home=${HOME}  #- ホストとDockerコンテナで同じhome directoryとする
dir_shared=${HOME}/sandbox
mkdir -p ${dir_shared}

#args="-e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY}"
# HTTPS_PROXY is used by pip
args=""

docker run ${args} -v ${dir_shared}:${dir_shared} \
       --rm -itd --name ${name} sandbox:${user}

docker cp myconf/.bashrc ${name}:${home}/
[ -f ${HOME}/.gitconfig ] && docker cp ${HOME}/.gitconfig ${name}:${home}/

docker exec -it ${name} /bin/bash

#docker stop ${name}

exit 0
