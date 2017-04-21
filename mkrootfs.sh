#!/bin/bash

if [ ! -e "rootfs.tar.gz" ]
then
    echo "rootfs.tar.gz not found, pulling from upstream"
    wget http://mirror.es.its.nyu.edu/archlinux/iso/2017.04.01/archlinux-bootstrap-2017.04.01-x86_64.tar.gz

    # TODO: we may want to check the hash of the resulting tar.gz file
    tar xf archlinux-bootstrap-2017.04.01-x86_64.tar.gz

    # we fix the root path of the tarball and built a new one
    cd root.x86_64 && tar -zcf ../rootfs.tar.gz *
else
    echo "it seems rootfs.tar.gz already exists, try running docker build -t archlinux ."
fi
