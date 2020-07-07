MXE-Docker
========

MXE を Docker で利用するためのツール。
気象研での利用を想定し、 HTTP_PROXY を使ってネット上のリソースにアクセスする。


ツール
--------

  * base/build_image.sh  mricom-base イメージに
                         MXEで使うライブラリを追加した mxe-base イメージを作る
  * build_image.sh       mxe-base に MXE パッケージを追加したイメージを作る
  * run_docker.sh        MXE Dockerイメージからコンテナを起動する
  * login_mxe.sh         稼働中のMXEコンテナにログインする
  * save_image.sh        作成したイメージをファイルに保存する
