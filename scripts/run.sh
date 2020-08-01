#!/bin/sh

f1 () {
  while :
  do
  echo "Do you want to use the local docker daemon or current kubernetes context?"
  echo "[d]ocker - Version: $(docker version --format '{{.Server.Version}}')"
  echo "[k]ubernetes - Context: $(kubectl config current-context)"
  read input
  case $input in

  d) echo "[repo/image:tag] or [repo/image] or [image]"
    read image
    echo "[/path/to/bin] or [inpathbin]"
    read cmd
    echo "Starting Ephemerial Host Network Container. Working dir mounted under /host"
    echo "(docker run --rm -ti --network host -v $PWD:/host $image $cmd)"
    docker run --rm -ti --network host -v $PWD:/host $image $cmd
    break;;
  k) echo "[repo/image:tag] or [repo/image] or [image]"
    read image
    echo "[/path/to/bin] or [inpathbin]"
    read cmd
    echo "Starting Ephemerial Pod in $(kubectl config current-context)"
    echo "kubectl run -i -rm --restart=Never --tty debug --image=$image -- cmd"
    kubectl run -i -rm --restart=Never --tty debug --image=$image -- $cmd
    break;;

  *) echo "Invalid Choice"

  echo "Press Enter to continue: " ; read ;;
  esac
  done
}

#f6 () {
#echo "Starting Ephemerial Host Network Container. Working dir mounted under /host"
#if [[ -z $1 && -z $2 && -z $3 ]]; then
#    echo "usage './run.sh repo image:tag cmd' ie './run.sh schmillin parrot:latest zsh'"
#    exit 1
#fi
#docker run --rm -ti --network host -v $PWD:/host $1/$2 $3
#}

#f7 () {
#echo "Starting Ephemerial Pod in $(kubectl config current-context)"
#if [[ -z $1 && -z $2 && -z $3 ]]; then
#    echo "usage './run.sh repo image:tag cmd' ie './run-kube.sh schmillin parrot:latest zsh'"
#    exit 1
#fi
#kubectl run -i -rm --restart=Never --tty $2 --image=$1/$2 -- $3
#}
f2 () {
  docker images --filter "dangling=false"
}

f3 () {
  mkdir bin && cd bin
  wget -q https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh
  wget -q https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean
  wget -q https://github.com/genuinetools/img/releases/download/v0.5.10/img-linux-amd64
  wget -qO- https://github.com/jesseduffield/lazydocker/releases/download/v0.9/lazydocker_0.9_Linux_x86_64.tar.gz | tar xvz -
  wget -qO- https://github.com/derailed/k9s/releases/download/v0.21.4/k9s_Linux_x86_64.tar.gz | tar xvz -
  wget -q https://github.com/lensapp/lens/releases/download/v3.5.1/Lens-3.5.1.AppImage
  wget -q https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  wget -q https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.tar.gz | tar xvz -
  chmod +x * cd ..
}

f4 () {
  ./docker-clean
}

echo "Enter Choice:

1) Run a ephemeral container
2) List local images
3) Container Tools
4) Docker Kill and Clean"

read choice

set -- $choice

for i in $@
do
  f${i}
done
