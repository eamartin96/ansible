#!/bin/bash

docker build -f Docker/Dockerfile.ubuntu -t custom-ubuntu .
docker build -f Docker/Dockerfile.debian -t custom-debian .
