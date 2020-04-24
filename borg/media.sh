#!/bin/bash
sh=$(basename $0)
if [ -f $sh ] 
then
    echo "In Utils folder! Going up..."
    cd ..
fi
pwd

# udisksctl mount -b /dev/sdb2

borg create -svp -C lz4 "Multimedia::Bilder-{now:%y.%j}" /mnt/media/Bilder/
