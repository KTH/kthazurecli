#!/bin/bash
CURRENT=$(date "+%Y%m%d%H%M")

# Remove unused images
docker image prune -f

# Remove stopped containers.    
docker container prune -f

# Remove unused volumes
docker volume prune -f

# Remove unused networks
docker network prune -f

# Command to run all prunes:  Use with caution
#docker system prune -f

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
