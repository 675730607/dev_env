#/bin/sh
set -e

arch=`uname -m`
echo "arch $arch"

image_repo=docker.io
image_name=675730607/ubuntu_24.04_dev.${arch}
image_tag=20250812v1

image_fullname="${image_repo}/${image_name}:${image_tag}"

container_cmd=docker
if  which docker  ; then 
	container_cmd=docker
elif  which podman  ; then 
	container_cmd=podman
else
	echo "no container command found. support docker and podman"
	exit -1
fi
${container_cmd} build --rm -t "${image_fullname}"  -f Dockerfile .
${container_cmd} push "${image_fullname}"

