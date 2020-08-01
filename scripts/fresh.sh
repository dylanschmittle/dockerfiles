#!/bin/sh
d=${PWD##*/}
cp ../scripts/p10k.zsh .
cp ../scripts/zsh-install.sh .
docker build --no-cache --compress -t $d . 
docker tag $d:latest $1/$d:latest
docker push $1/$d:latest
rm p10k.zsh
rm zsh-install.sh
