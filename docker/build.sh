#/bin/sh

image_repo=675730607
image_name=rockylinux-10-ubi.arm64
image_tag=20250809v2

image_fullname="${image_repo}/${image_name}:${image_tag}"

container_cmd=docker
${container_cmd} build --rm -t "${image_fullname}"  -f Dockerfile .
${container_cmd} push "${image_fullname}"

