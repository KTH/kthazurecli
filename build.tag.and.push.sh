#!/bin/bash
CURRENT=$(date "+%Y%m%d%H%M")

docker build --compress -t kthazurecli:$CURRENT -t kthazurecli:latest .

#Tagging images for publishing to dockerhub
docker image tag kthazurecli:$CURRENT  kthse/kthazurecli:$CURRENT
docker image tag kthazurecli:latest  kthse/kthazurecli:latest

#Pushing images to dockerhub
docker push kthse/kthazurecli:$CURRENT
docker push kthse/kthazurecli:latest
