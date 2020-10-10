X11 (Root X11 and Host Networking)

```
docker run --net=host --env="DISPLAY" -it --volume="$HOME/.Xauthority:/root/.Xauthority:rw" docker.io/schmillin/x11-glibc:latest
```

X11 (Container Networking and Temp X11)

```
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox
```

X11 (Xauthority Net Pid and IPC from Host)

```
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host --pid=host --ipc=host
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
sudo {podman,docker} run --device /dev/kvm --device /dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix sickcodes/docker-osx:latest
```

[docker](https://github.com/sickcodes/Docker-OSX)

- podman was used, i assume docker works fine, its more stable
- One Liner That Pulls an Image of qemu with OSX
- speed appears the same, cpu/ram/screen all adjusted fine
- mouse integration is better *shrug* on wayland atleast, 
- adding ssh and going headless also worked fine
- usb over spice was operational, did not test audio through it

[qemu quickstart](https://github.com/foxlet/macOS-Simple-KVM)

[qemu](https://github.com/kholia/OSX-KVM)
