#!/bin/bash
source chg_dir.sh

borg create -svp -C zstd "Phone::databases+Backups-{now:%y.%j}" "/mnt/backup/Sync/databases" "/mnt/backup/Sync/PhoneBackups"
