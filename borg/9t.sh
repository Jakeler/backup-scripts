#!/bin/bash
MNT=/tmp/MOUNT

source chg_dir.sh

### simple-mtpfs does not work, use go-mtps from Google dev instead, run manually
mkdir -p $MNT
go-mtpfs $MNT & sleep 3

[ $# -eq 1 ] && exclude_apk="--pattern '- **/TitaniumBackup/*.apk'"

if [ "$(ls -A $MNT)" ]; then
    borg create -svp -C lz4 $exclude_apk "Phone::TitaniumBackup-{now:%y.%j}" "$MNT/Interner gemeinsamer Speicher/TitaniumBackup"
    # borg create -svp -C lz4 --pattern '- **/TitaniumBackup/*.apk' --pattern '- **/TitaniumBackup/*.apk.gz' "Phone::TitaniumBackup-{now:%y.%j}" "$MNT/TitaniumBackup"
    borg create -svp -C lz4 --pattern '- **/*.mp4' "Multimedia::9T.DCIM-{now:%y.%j}" "$MNT/Interner gemeinsamer Speicher/DCIM/"
    #borg create -svp -C lz4 "Phone::TWRP-{now:%y.%j}" $MNT/TWRP/

    fusermount -u $MNT
else
    echo "MTP mount did not work!"
    exit 1
fi
