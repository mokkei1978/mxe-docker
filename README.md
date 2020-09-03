MXE-Docker
========

MXE を Docker で利用するためのツール。
2つのイメージを作り、利用する。

  * mxe-base  MRI.COM, MXE を実行するためのベースイメージ
              Debian + Python3 + gfortran + ミドルソフトウェア + ライブラリ
	      (コンテナ内のユーザーはrootのみ)
  * mxe       mxe-base + MXE パッケージ + ユーザー設定
              (MXE の単体テストに利用)


使い方
--------

各イメージの使い方。


### mxe-base

ターミナル(またはWindows PowerShell)でpullして使う。

> docker pull mokkei1978/mxe-base:latest


### mxe

Linuxのみ対応。

1. 自分のユーザー設定を行ったイメージを作成する。

> git clone [MXE gitリポジトリ] ~/mxe/
> sh build_image.sh
> docker images  ! "mxe:[自分のユーザー名]" のイメージがあれば成功

2. コンテナを起動する

> sh run_docker.sh  ! 設定ファイルや共有ディレクトリの設定は適当に変更してください

3. コンテナを終了する

(コンテナ内)> exit
(外)> docker stop mxe-[ユーザー名]


ツール
--------

  * base/build_image.sh  mxe-base イメージを作る
  * build_image.sh       自分のユーザー設定を行った mxe イメージを作る
  * run_docker.sh        MXE Dockerイメージからコンテナを起動する
  * login.sh             稼働中のMXEコンテナにログインする
  * save_image.sh        作成したイメージをファイルに保存する
