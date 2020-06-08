#!/bin/bash
source chg_dir.sh

# udisksctl mount -b /dev/sdb2

borg create -svp -C lz4 "Multimedia::Bilder-{now:%y.%j}" /mnt/media/Bilder/
