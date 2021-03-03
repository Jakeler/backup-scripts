#!/bin/bash
MNT=/tmp/MOUNT

source chg_dir.sh

mkdir -p $MNT
simple-mtpfs $MNT

[ $# -eq 1 ] && exclude_apk="--pattern '- **/TitaniumBackup/*.apk'"

if [ "$(ls -A $MNT)" ]; then
    borg create -svp -C lz4 $exclude_apk "Phone::TitaniumBackup-{now:%y.%j}" "$MNT/Interner gemeinsamer Speicher/TitaniumBackup" "$MNT/disk/TitaniumBackup/"
    borg create -svp -C lz4 "Multimedia::G6.DCIM-{now:%y.%j}" "$MNT/Interner gemeinsamer Speicher/DCIM/" "$MNT/disk/DCIM/"
    #borg create -svp -C lz4 "Phone::TWRP-{now:%y.%j}" $MNT/TWRP/

    fusermount -u $MNT
else
    echo "simple-mtpfs mount did not work!"
    exit 1
fi
