#!/bin/sh


param_process_name='process name for the running docker'
param_local_ssh_port='local port for ssh to access docker'
param_local_dir='you local project home directory'


arch=`uname -m`
function run() {
    echo "try to run..."
    # user00's passwd ArSGkqe8EQe
    docker run -itd --name={param_process_name} -p ${param_local_ssh_port}:22 --shm-size=8G \
        -v ${param_local_dir}:/home/user00 \
        docker.io/675730607/ubuntu_24.04_dev.${arch}:20250812v1
}

function start() {
    echo "try to start..."
    docker start -itd ${param_process_name}
}

function attach() {
    echo "try to exec..."
    docker exec -it ${param_process_name} /bin/bash
}
function kill() {
    echo "try to kill..."
    docker kill ${param_process_name}
}
function rm() {
    echo "try to rm..."
    docker rm ${param_process_name}
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
