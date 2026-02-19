#!/bin/bash
source chg_dir.sh

# Postgres dumps
BACKUP_PATH=/mnt/media/Immich/backups
MOUNT_PATH=/mnt/media/Immich/backup-mounted
# get and mount newest backup gz
NEWEST=$(ls -t ${BACKUP_PATH} | head -n1)

ratarmount --index-file :memory: ${BACKUP_PATH}/$NEWEST $MOUNT_PATH

borg create -svp -C lz4 "Multimedia::Immich-{now:%y.%j}" /mnt/media/Immich/backup-mounted /mnt/media/Immich/library

fusermount -u $MOUNT_PATH
