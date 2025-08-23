FROM docker.io/ubuntu:24.04

ARG GROUPNAME=users
ARG USERNAME=user00
ARG docker_build_data_dir=docker_build_data

COPY ./data /tmp/${docker_build_data_dir}

RUN \
    useradd -g $GROUPNAME -s /bin/bash -m $USERNAME  \
 \
# 安装开发环境 \
    && chmod +x /tmp/${docker_build_data_dir}/entry_point.sh \
    && apt-get  update -y \
    && apt-get install --no-install-recommends -y \
        nodejs npm vim git git-lfs file wget curl bzip2 pigz pbzip2 xz-utils \
        openssh-server python3 python3-pip python3-venv net-tools tcpdump  sudo locales \
        telnet iproute2 iputils-ping netcat-openbsd \
        bc pv \
    && usermod -a -G sudo $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
 \
# 修改时区 \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 \
# 下载语言 \
    &&  locale-gen "en_US.UTF-8" \
 \
# 清除缓存和临时文件 \
    && apt-get clean  -y all  \
    && apt-get remove --purge --auto-remove -y \
    && rm -fr /var/cache/apt \
    && rm -fr /var/lib/apt  \
    && find /tmp/ -maxdepth 1 -mindepth 1 ! -name ${docker_build_data_dir} -exec rm -fr {} \; 

# 设置语言 \
ENV LC_ALL en_US.utf8
ENV LANG en_US.utf8



WORKDIR /home/user00
USER user00

ENTRYPOINT ["/tmp/docker_build_data/entry_point.sh"]
CMD ["/bin/bash"]
