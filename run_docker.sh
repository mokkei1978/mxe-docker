#!/bin/bash
#- MXE Dockerイメージからコンテナを起動する

set -e

tag="latest"
while getopts t option ; do
    case ${option} in
	t) read tag < tag.txt ;;
	\?) exit 1 ;;
    esac
done
shift `expr ${OPTIND} - 1`

dir_git_repos="${HOME}/repos/mxe.git"
dir_data="/worka/ocpublic/mxe-data"
name="mxe"

docker run -e http_proxy=${HTTP_PROXY} -e HTTPS_PROXY=${HTTP_PROXY} \
       -v ${dir_git_repos}:/root/mxe.git \
       -v ${dir_data}:/root/MXE/linkdir/mxe-data \
       --rm -itd --name ${name} mxe:${tag}
# HTTPS_PROXY is used by pip

#- Copy my config files to container.
docker cp myconf/.bashrc ${name}:/root/
docker cp myconf/test.sh ${name}:/root/MXE/
docker cp ${HOME}/.gitconfig ${name}:/root/
docker cp ${HOME}/.netrc ${name}:/root/
docker cp ${HOME}/.ssl/. ${name}:/root/.ssl

docker exec -it ${name} /bin/bash

docker stop ${name}

exit 0
