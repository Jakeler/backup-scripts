#!/bin/bash

FOLDER=$1
rclone sync -v --stats 10s --stats-one-line --log-format "" --transfers 16 /mnt/archive/backup/BorgRepos/$FOLDER b2:Borg-all/$FOLDER
# rclone sync -P --transfers 16 /mnt/archive/backup/BorgRepos/$FOLDER b2:Borg-all/$FOLDER # interactive 0.5s intervall progress
