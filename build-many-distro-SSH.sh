#!/bin/bash

AUTHOR="ccy1219"
TARGET='docker-img-base'
TAG_PREFIX='SSH'
DOCKERFILE_NAME="Dockerfile.many-distro-SSH"

REPO=$AUTHOR/$TARGET

while read DISTRO; do
  echo "------------------------"
  echo "Build docker image: $DISTRO"
  TAG_POSTFIX=$(echo "$DISTRO" | tr : -)  
  IMAGE_TAG=$REPO:$TAG_PREFIX-$TAG_POSTFIX
  echo "Image Tag : $IMAGE_TAG"
  

  echo docker build --build-arg DISTRO_ARG=$DISTRO --file $DOCKERFILE_NAME -t $IMAGE_TAG .
  docker build --build-arg DISTRO_ARG=$DISTRO --file $DOCKERFILE_NAME -t $IMAGE_TAG .

  echo "------------------------"
  echo ""
done < build-many-distro-SSH.txt