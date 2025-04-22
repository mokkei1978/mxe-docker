#!/bin/bash
#- 自分の sandbox コンテナを立ち上げる (共有ディレクトリ: ~/temp/)

set -e

user=`id -nu`
home="/home/${user}"
name="${user}"

#args="-e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY}"
# HTTPS_PROXY is used by pip
args=""

docker run ${args} -v ${home}/temp:${home}/temp \
       --rm -itd --name ${name} sandbox:${user}

docker cp myconf/.bashrc ${name}:${home}/
docker cp ${HOME}/.gitconfig ${name}:${home}/

docker exec -it ${name} /bin/bash

#docker stop ${name}

exit 0
