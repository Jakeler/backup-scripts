#!/bin/bash

FOLDER=$1
rclone sync -P --transfers 32 /mnt/backup/BorgRepos/$FOLDER backup:Borg-all/$FOLDER 
