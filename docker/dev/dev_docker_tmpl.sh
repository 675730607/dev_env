#!/bin/sh


param_local_ssh_port='local port for ssh to access docker'
param_local_dir=‘you local project home directory’


arch=`uname -m`
function run() {
    echo "try to run..."
    # user00's passwd ArSGkqe8EQe
    docker run -itd --name=manual_llm -p ${param_local_ssh_port}:22 --shm-size=8G \
        -v ${param_local_dir}:/home/user00 \
        docker.io/675730607/ubuntu_24.04_dev.${arch}:20250812v1
}

function start() {
    echo "try to start..."
    docker start -itd manual_llm
}

function attach() {
    echo "try to exec..."
    docker exec -it manual_llm /bin/bash
}
function kill() {
    echo "try to kill..."
    docker kill manual_llm
}
function rm() {
    echo "try to rm..."
    docker rm manual_llm
}

case $1  in
    run)
        run
    ;;
    exec)
        attach
    ;;
    kill)
        kill
    ;;
    rm)
        rm
    ;;
    restart)
        kill
        rm
        run
    ;;
    *)
        echo "$0 [run|attach|kill|rm]"
    ;;
esac
