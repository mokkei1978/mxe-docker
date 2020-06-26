FROM mxe-base:4.7.05

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE"

### MRI.COM-rect パッケージの追加

ADD mxe.tar /root/

#- 事前に ./ に mxe.tar を作成しておく

WORKDIR /root
COPY config/.* ./
WORKDIR /root/MXE
RUN cp setting/machine/docker-debug/macros.make setting/

CMD ["/bin/bash"]
