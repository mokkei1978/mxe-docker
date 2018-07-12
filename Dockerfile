FROM debian:latest

MAINTAINER Kei Sakamoto <ksakamot@mri-jma.go.jp>

RUN echo "deb http://ftp.jp.debian.org/debian/ stretch main contrib non-free" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y gfortran make git

WORKDIR /root
COPY config/.* ./
RUN git clone http://synthesis.jamstec.go.jp/git/MXE.git && cp MXE/setting/machine/gfortran-6_2/macros.make MXE/setting/
RUN mkdir -p MXE/linkdir/mxe-data && mkdir -p MXE/linkdir/mxe.git

CMD ["/bin/bash"]
