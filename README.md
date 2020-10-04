X11 example

```
docker run --net=host --env="DISPLAY" -it --volume="$HOME/.Xauthority:/root/.Xauthority:rw" docker.io/schmillin/x11-glibc:latest
```

Kube Example

```
kubectl run -i --tty --rm alpine --image=schmillin/alpine --restart=Never -- zsh
```

Docker Example

```
docker run --rm -ti --network host -v $PWD:/host schmillin/blackarch /bin/zsh
```

Mac OS X
```
# One Liner That Pulls an Image of the OSX-KVM running on qemu inside a docker container (speed appears the same, mouse integration is better *shrug*)
sudo {podman,docker} run --device /dev/kvm --device /dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix sickcodes/docker-osx:latest
```
[docker] (https://github.com/sickcodes/Docker-OSX)

[qemu quickstart] (https://github.com/foxlet/macOS-Simple-KVM)

[qemu] (https://github.com/kholia/OSX-KVM)
