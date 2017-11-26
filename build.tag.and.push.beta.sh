#!/bin/bash
CURRENT=$(date "+%Y%m%d%H%M")

docker build --compress -t kthazurecli:$CURRENT-beta -t kthazurecli:latest Dockerfile.beta

#Tagging images for publishing to dockerhub
#docker image tag kthazurecli:$CURRENT-beta  kthse/kthazurecli:$CURRENT-beta
#docker image tag kthazurecli:latest  kthse/kthazurecli:latest

#Pushing images to dockerhub
#docker push kthse/kthazurecli:$CURRENT-beta
#docker push kthse/kthazurecli:latest
