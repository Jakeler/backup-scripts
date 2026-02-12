#!/bin/bash
source chg_dir.sh

borg create -svp -C lz4 "Multimedia::Immich-{now:%y.%j}" /mnt/media/Immich/library
