#!/bin/bash
CURRENT=$(date "+%Y%m%d%H%M")

# Remove unused images
docker image prune

# Remove stopped containers.    
docker container prune

# Remove unused volumes
docker volume prune

# Remove unused networks
docker network prune

# Command to run all prunes:  Use with caution
#docker system prune

#Pulling the latest debian:jessie
docker pull debian:jessie

#Building
docker build --compress -t kthazurecli:$CURRENT -t kthazurecli:latest .

#Tagging images for publishing to dockerhub
docker image tag kthazurecli:$CURRENT  kthse/kthazurecli:$CURRENT
docker image tag kthazurecli:latest  kthse/kthazurecli:latest

#Pushing images to dockerhub
docker push kthse/kthazurecli:$CURRENT
docker push kthse/kthazurecli:latest
