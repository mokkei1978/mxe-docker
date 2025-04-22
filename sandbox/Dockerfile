FROM mxe-base:emacs

LABEL maintainer="Kei Sakamoto <sakamoto.kei.6f@kyoto-u.ac.jp>"
LABEL title="sandbox"

ARG user=dev
ARG uid=1
ARG group=M201
ARG gid=6020
RUN groupadd -f $group
RUN groupmod -g $gid $group
RUN useradd -m -u $uid -g $group $user

USER $user
WORKDIR /home/${user}
CMD ["/bin/bash"]
