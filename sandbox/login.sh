#!/bin/bash
#- 稼働中のsandboxコンテナにログインする


args=""
while getopts s option ; do
    case ${option} in
        s) args="${args} -u root" ;;
        \?) exit 1 ;;
    esac
done
shift `expr ${OPTIND} - 1`

docker exec -it ${args} sandbox /bin/bash

exit 0
