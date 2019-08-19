FROM mricom-base:4.5.16

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE"

RUN apt-get install -y liblapack-dev libfftw3-3 libfftw3-dev libfftw3-doc

### MRI.COM-rect パッケージの追加

ADD mxe.tar /root/

#- 事前に ./ に mxe.tar を作成しておく

WORKDIR /root
COPY config/.* ./
COPY config/macros.make MXE/setting/
WORKDIR /root/MXE

CMD ["/bin/bash"]
