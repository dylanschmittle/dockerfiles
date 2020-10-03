#!/bin/sh
mkdir macos14 && cd macos14
vagrant init yzgyyang/macOS-10.14
cd ..

mkdir macos13 && cd macos13
vagrant init jhcook/macos-sierra
cd ..

mkdir macos15 && cd macos15
vagrant init ramsey/macos-catalina --box-version 1.0.0
cd ..

