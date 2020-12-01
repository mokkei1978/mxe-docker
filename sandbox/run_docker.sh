#!/bin/bash
#- 自分の sandbox コンテナを立ち上げる (共有ディレクトリ: ~/temp/)

set -e

user=`id -nu`
home="/home/${user}"
name="${user}"

docker run -e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY} \
       -v ${home}/temp:${home}/temp \
       --rm -itd --name ${name} sandbox:${user}
# HTTPS_PROXY is used by pip

docker cp myconf/.bashrc ${name}:${home}/
docker cp ${HOME}/.gitconfig ${name}:${home}/

docker exec -it ${name} /bin/bash

#docker stop ${name}

exit 0
