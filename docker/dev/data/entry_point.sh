#!/bin/bash

home_dir=/home/user00
sudo chown -R user00:users ${home_dir}
if [ ! -f ${home_dir}/.bashrc ]; then
    cp /tmp/docker_build_data/home/bashrc ${home_dir}/.bashrc
fi
if [ ! -f ${home_dir}/.vimrc ]; then
    cp /tmp/docker_build_data/home/vimrc ${home_dir}/.vimrc
fi

exec "$@"
