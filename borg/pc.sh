#!/bin/bash
sh=$(basename $0)
if [ -f $sh ] 
then
    echo "In Utils folder! Going up..."
    cd ..
fi
pwd

borg create -svp -C lz4 "PC::Home-{now:%y.%j}" /home/jk/ --keep-exclude-tags --exclude-caches --exclude-if-present PUB_DL.TAG --exclude-if-present VM.TAG "$@"
