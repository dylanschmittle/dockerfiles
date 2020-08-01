#!/bin/sh
dir=${PWD##*/}
docker build -t $dir .
docker tag $dir:latest $1/$dir:latest
docker push $1/$dir:latest
