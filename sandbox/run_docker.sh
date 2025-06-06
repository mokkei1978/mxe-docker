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

#- for X-Window w/ wsl2
args="${args} -v /mnt/wslg:/mnt/wslg -v /tmp/.X11-unix:/tmp/.X11-unix"
args="${args} -e DISPLAY=${DISPLAY} -e WAYLAND_DISPLAY=${WAYLAND_DISPLAY} -e XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR} -e PULSE_SERVER=${PULSE_SERVER}"

#args="${args} -v /mnt/h:/mnt/h"

docker run ${args} -v ${dir_shared}:${dir_shared} \
       --rm -itd --name ${name} sandbox:${user}

docker cp myconf/.bashrc ${name}:${home}/
[ -f ${HOME}/.gitconfig ] && docker cp -L ${HOME}/.gitconfig ${name}:${home}/

docker exec -it ${name} /bin/bash

#docker stop ${name}

exit 0
