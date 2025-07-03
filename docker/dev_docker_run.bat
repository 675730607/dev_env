docker run -itd --name=number_qa --privileged --network=host  --init ^
    -v E:\workspace\projects\number_qa\docker_env\home:/home ^
    675730607/ubuntu_dev:25.10 /bin/sh
