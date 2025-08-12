#/bin/sh

arch=`uname -m`
echo "arch $arch"

image_repo=docker.io
image_name=675730607/ubuntu_24.04_dev.${arch}
image_tag=20250812v1

image_fullname="${image_repo}/${image_name}:${image_tag}"

container_cmd=docker
${container_cmd} build --rm -t "${image_fullname}"  -f Dockerfile .
${container_cmd} push "${image_fullname}"

