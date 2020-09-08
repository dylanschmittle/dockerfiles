#!/bin/sh
podman login docker.io
d=${PWD##*/}
cp ../scripts/p10k.zsh .
cp ../scripts/zsh-install.sh .
podman build -t $d . 
podman tag $d:latest docker.io/$1/$d:latest
podman push docker.io/$1/$d:latest
rm p10k.zsh
rm zsh-install.sh
