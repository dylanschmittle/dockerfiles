#!/bin/sh
mkdir win7 && cd win7
vagrant init peru/windows-server-2016-standard-x64-eval
echo "vagrant:vagrant" > creds.txt
echo "VAGRANT_DEFAULT_PROVIDER=libvirt vagrant up" > start.sh
cd ..
mkdir win2019 && cd win2019
vagrant init peru/windows-10-enterprise-x64-eval
echo "vagrant:vagrant" > creds.txt
echo "VAGRANT_DEFAULT_PROVIDER=libvirt vagrant up" > start.sh
cd ..

