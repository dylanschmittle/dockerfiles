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

[docker] (https://github.com/sickcodes/Docker-OSX)


[qemu quickstart] (https://github.com/foxlet/macOS-Simple-KVM)

[qemu] (https://github.com/kholia/OSX-KVM)
