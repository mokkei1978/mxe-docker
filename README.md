MXE-Docker
========

MXEをDockerで利用するためのツール。
気象研での利用を想定し、HTTP_PROXYを使ってネット上のリソースにアクセスする。


ツール
--------

  * build_image.sh   Dockerfile を使ってイメージを構築する
  * run_docker.sh    MXE Dockerイメージからコンテナを起動する
  * copy_myconf.sh   自分の設定ファイルをコンテナ内にコピーする