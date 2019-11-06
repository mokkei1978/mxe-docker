#!/bin/bash
#- MXEの全ての単体テストを実行する

set -e

(cd setting; ./print.sh "Unit test start.")

cd prep
make check
if [ $? -ne 0 ]; then
    (cd ../setting; ./print.sh "Unit test fail.")
    exit 1
fi

cd ../anl
make check
if [ $? -ne 0 ]; then
    (cd ../setting; ./print.sh "Unit test fail.")
    exit 1
fi

(cd ../setting; ./print.sh "Unit test succeed.")

exit 0
