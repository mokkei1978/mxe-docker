FROM python:3.10.7-slim-bullseye

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE-base"

# same with mricom-docker
RUN sed -i "1ideb http://ftp.jp.debian.org/debian/ buster main contrib non-free" /etc/apt/sources.list
RUN apt-get update && apt-get install -y gfortran make git bc time openmpi-bin libopenmpi-dev libnetcdff-dev

# for MXE tools
RUN apt-get install -y liblapack-dev libfftw3-3 libfftw3-dev libfftw3-doc

# Python main libraries
RUN python -m pip install --upgrade pip
RUN pip install numpy pandas matplotlib scipy f90nml numba cmocean ipython xarray

# for cartopy
#https://stackoverflow.com/questions/53697814/using-pip-install-to-install-cartopy-but-missing-proj-version-at-least-4-9-0/71799642#71799642

RUN apt-get install -y libproj-dev proj-data proj-bin libgeos-dev g++ python3-dev cmake sqlite3 curl
RUN apt-get upgrade -y
WORKDIR /tmp
RUN curl -sSL https://download.osgeo.org/proj/proj-9.0.0.tar.gz | tar -xvz -C /tmp
RUN mkdir /tmp/proj-9.0.0/build
WORKDIR /tmp/proj-9.0.0/build
RUN cmake .. && cmake --build . && cmake --build . --target install
RUN projsync --system-directory --list-files
RUN pip install cartopy
RUN pip uninstall -y shapely
RUN pip install shapely --no-binary shapely
#- original shapely => segmentation fault occur in cartopy

COPY cartopy_feature_download.py /root/
RUN python /root/cartopy_feature_download.py physical
RUN mkdir -p /usr/local/share/cartopy/shapefiles/natural_earth/physical && ln /root/.local/share/cartopy/shapefiles/natural_earth/physical/ne_* /usr/local/share/cartopy/shapefiles/natural_earth/physical/ && chmod a+r /usr/local/share/cartopy/shapefiles/natural_earth/physical/ne_*


ENV OMPI_MCA_btl_vader_single_copy_mechanism none
#- OpenMPI v3 のエラーメッセージを止めるのに必要らしい

CMD ["/bin/bash"]
