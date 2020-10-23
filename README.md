MXE-Docker
========

MXE を Docker で利用するためのツール。


必要要件
--------

  * Linux
  * Docker (which dockerで確認) (+基本的な使い方の習熟)
  * インターネット通信
  * MXE git リポジトリのURL


使い方
--------

MXEを載せたDockerイメージを作成し、コンテナを起動、終了するまでの使い方。
全てここのディレクトリで作業する。


### 1. イメージの作成

まず、以下のコマンドで、自分のユーザー設定を行ったイメージを作成する。

```
> git clone [MXE gitリポジトリURL] ~/mxe/  !- 本パッケージとは別にMXEを~/mxe/に取得しておく
> sh build_image.sh
> docker images         !- "mxe:[自分のユーザー名]" のイメージがあれば成功
```

イメージの作成は1度だけで良い。MXEのバージョンを更新する場合には作り直す。


### 2. コンテナの起動

以下のコマンドで、1で作成したイメージからコンテナ(仮想マシン)を起動する。

```
> edit run_docker.sh  ! 設定ファイルや共有ディレクトリを設定
> sh run_docker.sh
```
成功すれば、ターミナルがコンテナ内に移動する。


### 3. コンテナ内の作業

コンテナには以下が設定されている。
エディターは用意していないので、自分でインストールするなりする。

  * Debian linux
  * Python3, Pythonの各種ライブラリ, Cartopy地理データ
  * gfortran, MPI, fortranライブラリ
  * git, make
  * MXE パッケージ
  * ユーザー設定 (uid, gidなど)


### 4. コンテナの終了

作業が終われば以下のコマンドでコンテナを終了する。
作業したファイルは、共有ディレクトリ以外は全て消えることに注意。

```
(コンテナ内)> exit
(外)> docker stop mxe-[ユーザー名]
```


ツール
--------

  * base/build_image.sh  [mxe-base](base/README.md) イメージを作る 
  * build_image.sh       自分のユーザー設定を行った mxe イメージを作る
  * run_docker.sh        MXE Dockerイメージからコンテナを起動する
  * login.sh             稼働中のMXEコンテナにログインする
  * save_image.sh        作成したイメージをファイルに保存する
