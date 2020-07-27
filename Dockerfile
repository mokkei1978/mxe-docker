FROM mxe-base:latest

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="MXE"


### Set user/group id

ARG user=dev
ARG uid=1
ARG group=M201
ARG gid=6020
RUN groupadd -g $gid $group
RUN useradd -m -u $uid -g $group $user


### MXE パッケージの追加 (事前に ./mxe.tar を作成)

USER $user
ADD mxe.tar /home/${user}/

WORKDIR /home/${user}/MXE
CMD ["/bin/bash"]
