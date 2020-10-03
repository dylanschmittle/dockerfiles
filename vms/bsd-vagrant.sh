#!/bin/sh
mkdir hardenedbsd12 && cd hardenedbsd12
vagrant init generic/hardenedbsd12
cd ..
mkdir netbsd9 && cd netbsd9
vagrant init generic/netbsd9
cd ..
mkdir freebsd12 && cd freebsd12
vagrant init generic/freebsd12
cd ..
