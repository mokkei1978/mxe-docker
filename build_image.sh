#!/bin/bash
#- Dockerfile を使ってイメージを構築する

set -e

tag="latest"
while getopts t option ; do
    case ${option} in
	t) read tag < tag.txt ;;
	\?) exit 1 ;;
    esac
done
shift `expr ${OPTIND} - 1`

if [ ! -d ~/MXE ]; then
    echo "ERROR: ~/MXE is not found."
    exit 1
fi

dir=`pwd`

rm -f mxe.tar
(mkdir -p ~/temp ; cd ~/temp/ ; rm -fr MXE ; rm -f mxe.tar ; git clone -b master ~/MXE/; echo "/root/stream.txt" > MXE/setting/stream.conf ; tar cvf mxe.tar MXE/ ; mv mxe.tar ${dir}/ )

docker build --build-arg http_proxy=${HTTP_PROXY} -t mxe:${tag} --no-cache=true .

rm -f mxe.tar

exit 0
