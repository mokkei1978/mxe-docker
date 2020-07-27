MXE-Docker
========

MXE を Docker で利用するためのツール。
気象研での利用を想定し、 HTTP_PROXY を使ってネット上のリソースにアクセスする。


ツール
--------

  * base/build_image.sh  mxe-base イメージを作る
                         (Debian + Python + ミドルソフトウェア + ライブラリ)
  * build_image.sh       mxe イメージを作る
                         (mxe-base + MXE パッケージ)
  * run_docker.sh        MXE Dockerイメージからコンテナを起動する
  * login.sh             稼働中のMXEコンテナにログインする
  * save_image.sh        作成したイメージをファイルに保存する
