docker export -o container.tar number_qa 
docker import container.tar container:tmp
del container.tar 
docker build -t 675730607/ubuntu_dev:25.10 -f .\Dockerfile .
docker image rm container:tmp
docker push 675730607/ubuntu_dev:25.10 
