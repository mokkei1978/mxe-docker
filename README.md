MXE-Docker
========

MXE を Docker で利用するためのツール集。
基本的な使い方は [mxe/README.md] を参照。


必要要件
--------

  * Linux
  * Docker (which dockerで確認) (+基本的な使い方の習熟)
  * インターネット通信
  * MXE git リポジトリのURL
  * (subversion) - 気象庁内でNuSDaS を取得する場合に必要


ツール
--------

mxe-base (必要なミドルウェアをインストールしたベースイメージ) の作成

  * base/build_image.sh   - [mxe-base](base/README.md) イメージを作る
  * nusdas/build_image.sh - [NuSDaS](nusdas/README.md) をインストール
  * emacs/build_image.sh  - mxe-base に emacs を追加

MXE を載せたイメージの作成と実行

  * [mxe]/(mxe/README.md) - mxe-baseにMXEを加えたイメージを作る

その他

  * sandbox/              - mxe-base + ユーザー設定 のテスト作業用(MXEなし)
