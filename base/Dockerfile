FROM python:3.13.3-slim-bookworm

LABEL maintainer="Kei Sakamoto <sakamoto.kei.6f@kyoto-u.ac.jp>"
LABEL title="MXE-base"

# same with mricom-docker
RUN apt-get update && apt-get install -y gfortran make git bc time openmpi-bin libopenmpi-dev libnetcdff-dev netcdf-bin

# for MXE fortran tools
RUN apt-get install -y liblapack-dev libfftw3-double3 libfftw3-dev libfftw3-doc

# Python main libraries
RUN apt-get install -y expat libudunits2-dev python3-tk
RUN python -m pip install --upgrade pip
RUN pip install numpy pandas matplotlib scipy f90nml numba cmocean ipython xarray cf-python "dask[complete]" docopt xgrads

#- python3-tk   - plt.show() で図を表示させる
#- xgrads       - grads ctlからxarrayを作る

# for cartopy
RUN apt-get install -y libproj-dev proj-data proj-bin libgeos-dev g++ python3-dev cmake sqlite3 curl
RUN apt-get upgrade -y
RUN projsync --system-directory --list-files
RUN pip install cartopy shapely

COPY cartopy_feature_download.py /root/
RUN python /root/cartopy_feature_download.py physical
RUN mkdir -p /usr/local/share/cartopy/shapefiles/natural_earth/physical && ln /root/.local/share/cartopy/shapefiles/natural_earth/physical/ne_* /usr/local/share/cartopy/shapefiles/natural_earth/physical/ && chmod a+r /usr/local/share/cartopy/shapefiles/natural_earth/physical/ne_*

ENV OMPI_MCA_btl_vader_single_copy_mechanism=none
#- OpenMPI v3 のエラーメッセージを止めるのに必要らしい

CMD ["/bin/bash"]
