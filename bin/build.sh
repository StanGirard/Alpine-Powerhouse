#!/bin/bash
set -e 
export RELEASE=`cat VERSION`
if [[ -z $RELEASE ]]; then
    echo "Error: undefined RELEASE environment variable."
    exit 1
fi

docker build --build-arg RELEASE="$RELEASE" -t stangirard/alpine-powerhouse .
docker tag stangirard/alpine-powerhouse:latest stangirard/alpine-powerhouse:"$RELEASE"