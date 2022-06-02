#!/bin/sh

#ver=catalina
ver=mojave
#ver=high-sierra

git clone https://github.com/foxlet/macOS-Simple-KVM
cd macOS-Simple-KVM
./jumpstart.sh --${ver}
qemu-img create -f qcow2 ${ver}.qcow2 64G

## local
echo "-drive id=SystemDisk,if=none,file=${ver}.qcow2 \\" >> basic.sh
echo "-device ide-hd,bus=sata.4,drive=SystemDisk" >> basic.sh
#./basic.sh

## vnc
#echo "-drive id=SystemDisk,if=none,file=${ver}.qcow2 \\" >> basic.sh
#echo "-device ide-hd,bus=sata.4,drive=SystemDisk \\" >> basic.sh
#echo "-nographic -vnc :0 -k en-us" >> basic.sh
#HEADLESS=1 MEM=1G CPUS=2 SYSTEM_DISK=${ver}.qcow2 ./headless.sh

