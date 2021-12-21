FROM mokkei1978/mxe-base:latest

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE+NuSDaS-base"

WORKDIR /root/
RUN git clone https://github.com/jasper-software/jasper.git
RUN mkdir /root/temp
WORKDIR /root/jasper
RUN cmake -G "Unix Makefiles" -H/root/jasper/ -B/root/temp -DCMAKE_INSTALL_PREFIX=/usr/local
WORKDIR /root/temp
RUN make clean all && make install
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

ADD nusdas1.4/ /root/nusdas1.4/

WORKDIR /root/nusdas1.4
RUN sh configure --prefix=/usr/local/nusdas1.4 --with-f90=gfortran
RUN make && make install

WORKDIR /root/
CMD ["/bin/bash"]
