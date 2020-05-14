#!/bin/bash
sh=$(basename $0)
if [ -f $sh ] 
then
    echo "In Utils folder! Going up..."
    cd ..
fi
pwd

borg create -svp -C lz4 --patterns-from pattern.lst "Laptop::Home_t440s-{now:%y.%j}" ~/
