FROM mricom-base:4.5.16

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE"

### MRI.COM-rect パッケージの追加

ADD mxe.tar /root/

#- 事前に ./ に mxe.tar を作成しておく

WORKDIR /root
COPY config/.* ./
RUN mkdir -p mxe/linkdir/mxe-data mxe.git
WORKDIR /root/MXE/setting
RUN cp machine/gfortran-6_2/macros.make ./

CMD ["/bin/bash"]
