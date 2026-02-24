#!/bin/bash
source chg_dir.sh

# Backup into PC repo, because influx db / grafana dumps are already in Hobby folder
borg create -svp -C zstd "PC::NAS-DB+conf-{now:%y.%j}" /mnt/software/backup-scripts/docker/monitoring/backup/
