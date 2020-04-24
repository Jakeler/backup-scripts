#!/bin/bash
MNT=/tmp/MOUNT

sh=$(basename $0)
if [ -f $sh ] 
then
    echo "In Utils folder! Going up..."
    cd ..
fi
pwd

mkdir -p $MNT
simple-mtpfs $MNT

if [ "$(ls -A $MNT)" ]; then
borg create -svp -C lz4 "Phone::TitaniumBackup-{now:%y.%j}" "$MNT/Interner gemeinsamer Speicher/TitaniumBackup" "$MNT/disk/TitaniumBackup/"
borg create -svp -C lz4 "Multimedia::G6.DCIM-{now:%y.%j}" "$MNT/Interner gemeinsamer Speicher/DCIM/" "$MNT/disk/DCIM/"
#borg create -svp -C lz4 "Phone::TWRP-{now:%y.%j}" $MNT/TWRP/

#borg umount TMP_MOUNT/
fusermount -u $MNT
else
echo "simple-mtpfs mount did not work!"
exit 1
fi
