#!/bin/bash
MNT=MTP_MOUNT

sh=$(basename $0)
if [ -f $sh ] 
then
    echo "In Utils folder! Going up..."
    cd ..
fi
pwd

simple-mtpfs $MNT

if [ "$(ls -A $MNT)" ]; then
borg create -svp -C lz4 "Phone::TitaniumBackup-Nexus6P-{now:%y.%j}" "$MNT/TB/"
borg create -svp -C lz4 "Multimedia::G6.DCIM-{now:%y.%j}" "$MNT/DCIM/"
#borg create -svp -C lz4 "Phone::TWRP-{now:%y.%j}" $MNT/TWRP/

#borg umount TMP_MOUNT/
fusermount -u $MNT
else
echo "simple-mtpfs mount did not work!"
exit 1
fi
