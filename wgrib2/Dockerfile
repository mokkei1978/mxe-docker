FROM mokkei1978/mxe-base:3.13.3

LABEL maintainer="Kei Sakamoto <sakamoto.kei.6f@kyoto-u.ac.jp>"
LABEL title="MXE-base + wgrib2"

WORKDIR /root/
RUN git clone https://github.com/NOAA-EMC/wgrib2.git -b v3.7.0
RUN mkdir /root/wgrib2/build
WORKDIR /root/wgrib2/build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DUSE_NETCDF=ON -DMAKE_FTN_API=ON && make && make install

WORKDIR /root/
CMD ["/bin/bash"]
