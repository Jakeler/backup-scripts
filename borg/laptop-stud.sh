#!/bin/bash
sh=$(basename $0)
if [ -f $sh ] 
then
    echo "In Utils folder! Going up..."
    cd ..
fi
pwd

borg create -svp -C lz4 "Laptop::Home_t440s-{now:%y.%j}" ~/ --keep-exclude-tags --exclude-caches --exclude-if-present PUB_DL.TAG --exclude-if-present VM.TAG
