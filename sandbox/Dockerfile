FROM mokkei1978/mxe-base:latest

LABEL maintainer="Kei Sakamoto <ksakamot@mri-jma.go.jp>"
LABEL title="sandbox"

ARG user=dev
ARG uid=1
ARG group=M201
ARG gid=6020
RUN groupadd -g $gid $group
RUN useradd -m -u $uid -g $group $user

USER $user
WORKDIR /home/${user}
CMD ["/bin/bash"]
