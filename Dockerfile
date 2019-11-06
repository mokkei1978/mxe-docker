FROM mxe-base:4.5.18

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE"

### MRI.COM-rect パッケージの追加

ADD mxe.tar /root/

#- 事前に ./ に mxe.tar を作成しておく

WORKDIR /root
COPY config/.* ./
COPY config/macros.make MXE/setting/
WORKDIR /root/MXE

CMD ["/bin/bash"]
