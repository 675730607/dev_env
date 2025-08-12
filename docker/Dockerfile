FROM docker.io/ubuntu:24.04

ARG GROUPNAME=users
ARG USERNAME=user00

RUN useradd -g $GROUPNAME -s /bin/bash $USERNAME \
    && apt-get  update -y \
    && apt-get install -y sudo \
    && usermod -a -G sudo $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get install --no-install-recommends -y \
        nodejs npm vim git file wget curl bzip2  xz-utils \
        openssh-server python3 net-tools tcpdump \
    && apt-get clean  -y all  \
    && apt-get remove --purge --auto-remove -y \
    && rm -fr /var/cache/apt \
    && rm -fr /var/lib/apt \
    && rm -fr /tmp/*


WORKDIR /home/user00
USER user00
CMD ["tail", "-f", "/dev/null"]
