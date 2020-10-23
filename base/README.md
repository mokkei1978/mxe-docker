mxe-base イメージ
========

mxe-base は MRI.COM, MXE を実行するためのベースイメージである。
作成されたイメージには以下が含まれる。
  * Debian
  * Python3, Pythonの各種ライブラリ, Cartopy地理データ
  * gfortran, MPI, fortranライブラリ
  * git, make


使い方
--------

ターミナル(またはWindows PowerShell)でpullして使う。
(コンテナ内のユーザーはrootのみ)

```
> docker pull mokkei1978/mxe-base:latest
```
