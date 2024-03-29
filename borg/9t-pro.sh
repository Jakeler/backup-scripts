#!/bin/bash
MNT=/tmp/MOUNT
BASE_MTP='Internal shared storage'

source chg_dir.sh

### simple-mtpfs does not work anymore, uses go-mtpfs from Google dev instead
mkdir -p $MNT
go-mtpfs $MNT & sleep 3

exclude_apk=() # default include apks
[ $# -eq 1 ] && exclude_apk=('--pattern' '- **/*.apk')


if [ "$(ls -A $MNT)" ]; then
#    borg create -svp -C lz4 --pattern '- **/*.apk' "Phone::OABX+Signal-{now:%y.%j}" "$MNT/$BASE_MTP/OABX" "$MNT/$BASE_MTP/Signal"
    borg create -svp -C lz4 "${exclude_apk[@]}" "Phone::OABX+Signal-{now:%y.%j}" "$MNT/$BASE_MTP/OABX" "$MNT/$BASE_MTP/Signal"

    borg create -svp -C lz4 --pattern '- **/*.mp4' "Multimedia::9T.DCIM-{now:%y.%j}" "$MNT/$BASE_MTP/DCIM/"

    #borg create -svp -C lz4 "Phone::TWRP-{now:%y.%j}" $MNT/TWRP/

    fusermount -u $MNT
else
    echo "MTP mount did not work!"
    exit 1
fi
