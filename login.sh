#!/bin/bash
#- 稼働中のMXEコンテナにログインする

user=`id -nu`
docker exec -it mxe-${user} /bin/bash

exit 0
