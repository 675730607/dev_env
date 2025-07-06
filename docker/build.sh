#/bin/sh

docker_repo=675730607
docker_name=rockylinux-10-ubi.arm64
docker_tag=20250706v1

docker_fullname="${docker_repo}/${docker_name}:${docker_tag}"

docker build --rm -t "${docker_fullname}"  -f Dockerfile .
docker push "${docker_fullname}"

