#!/bin/bash

###############################
# Delete the containers
###############################

docker rm -f debian1
docker rm -f debian2
docker rm -f ubuntu1
docker rm -f mysql1
docker rm -f mysql2
docker rm -f tomcat1
docker rm -f tomcat2

###############################
# Delete the network
###############################

docker network rm ansible

###########################################
# Create the network and the containers
###########################################

docker network create ansible --subnet=172.18.0.0/16

docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=debian1 --hostname=debian1 --ip 172.18.0.2  --cgroupns=host --network=ansible custom-debian
docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=debian2 --hostname=debian2 --ip 172.18.0.3  --cgroupns=host --network=ansible custom-debian
docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=ubuntu1 --hostname=ubuntu1 --ip 172.18.0.8  --cgroupns=host --network=ansible custom-ubuntu
docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=mysql1  --hostname=mysql1  --ip 172.18.0.10 --cgroupns=host --network=ansible custom-ubuntu
docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=mysql2  --hostname=mysql2  --ip 172.18.0.11 --cgroupns=host --network=ansible custom-ubuntu
docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=tomcat1 --hostname=tomcat1 --ip 172.18.0.12 --cgroupns=host --network=ansible custom-debian
docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --name=tomcat2 --hostname=tomcat2 --ip 172.18.0.13 --cgroupns=host --network=ansible custom-debian
