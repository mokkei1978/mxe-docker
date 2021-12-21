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
dir_data="/NasA2020_1/M201/${user}/mxe-data"

docker run -e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY} \
       -v ${dir_git_repos}:${home}/mxe.git \
       -v ${dir_data}:${home}/mxe/linkdir/mxe-data \
       --rm -itd --name ${name} mxe:${user}
# HTTPS_PROXY is used by pip

#- Linux等の設定
docker cp myconf/.bashrc ${name}:${home}/
docker cp myconf/.emacs ${name}:${home}/
docker cp myconf/pre-commit ${name}:${home}/mxe/.git/hooks/
docker cp ${HOME}/.gitconfig ${name}:${home}/

if [ "${user}" = "ksakamot" ] ; then
    docker exec -u ${user} ${name} git remote add bare ~/mxe.git/
    docker exec -it -u ${user} ${name} git fetch bare
    docker exec -it -u ${user} ${name} git pull bare master
fi

docker exec -it ${name} /bin/bash

#docker stop ${name}

exit 0
