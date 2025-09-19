#!/bin/bash

home_dir=/home/user00
sudo chown -R user00:users ${home_dir}
if [ ! -f ${home_dir}/.bashrc ]; then
    cp /tmp/docker_build_data/home/bashrc ${home_dir}/.bashrc
fi
if [ ! -f ${home_dir}/.bash_profile ]; then
    cp /tmp/docker_build_data/home/bash_profile ${home_dir}/.bash_profile
fi
if [ ! -f ${home_dir}/.vimrc ]; then
    cp /tmp/docker_build_data/home/vimrc ${home_dir}/.vimrc
fi
# 为个人用户安装 nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

sudo service ssh start

exec "$@"
