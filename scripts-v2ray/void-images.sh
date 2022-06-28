#!/bin/sh
# Builds images rootfs netboot and livecd's for glibc and musllibc
# Tag and push to a s3 when done
git clone git@github.com:void-linux/void-mklive.git
cd void-mklive
make
./mkrootfs.sh x86_64 -o glib.tar.xz
./mkrootfs.sh x86_64 -o musl.tar.xz
./mknet.sh glib.tar.xz
./mknet.sh glib.tar.xz
./mkimage.sh glib.tar.xz
./mkimage.sh musl.tar.xz
./mklive.sh -a x86_64-musl -p "void-repo-nonfree"
./mklive.sh -a x86_64 -p "void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree"
