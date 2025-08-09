FROM rockylinux/rockylinux:10-ubi

ARG GROUPNAME=users
ARG USERNAME=user00

RUN useradd -g $GROUPNAME $USERNAME \
    && yum update -y \
    && yum install -y sudo \
    && groupadd sudo \
    && usermod -a -G sudo $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && yum install -y nodejs vim git file procps-ng \
    && yum -y clean all  \
    && rm -fr /var/cache


WORKDIR /home/user00
USER user00
ENTRYPOINT ["/bin/bash"]
