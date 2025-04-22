#!/bin/bash
#- 稼働中のsandboxコンテナにログインする

user=`id -nu`
docker exec -it ${user} /bin/bash

exit 0
