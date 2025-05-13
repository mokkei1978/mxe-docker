#!/bin/bash
#- 自分のユーザー設定を行った mxe イメージを作る

set -e

uid=`id -u`
gid=`id -g`
user=`id -nu`
group=`id -ng`
home="/home/${user}"
name="mxe-${user}"

dir_git_repos="${HOME}/repos/mxe.git"
args=""
dir_data="${HOME}/mxe-data"  #- for unit test. なくても良い

#- for MRI (HTTPS_PROXY is used by pip)
#dir_data="/NasA2020_1/M201/${user}/mxe-data"
#args="-e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY}"

docker run ${args} \
       -v ${dir_git_repos}:${home}/mxe.git \
       -v ${dir_data}:${home}/mxe/linkdir/mxe-data \
       --rm -itd --name ${name} mxe:${user}

#- Linux等の設定
docker cp myconf/.bashrc ${name}:${home}/
docker cp myconf/.emacs ${name}:${home}/
docker cp myconf/pre-commit ${name}:${home}/mxe/.git/hooks/
if [ -f ${HOME}/.gitconfig ] ; then
    docker cp -L ${HOME}/.gitconfig ${name}:${home}/
fi

if [ "${user}" = "ksakamot" ] ; then
    docker exec -u ${user} ${name} git remote add bare ~/mxe.git/
    docker exec -it -u ${user} ${name} git fetch bare
    docker exec -it -u ${user} ${name} git pull bare master
fi

docker exec -it ${name} /bin/bash

#docker stop ${name}

exit 0
