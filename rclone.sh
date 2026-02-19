#!/bin/bash

FOLDER=$1
rclone sync -P --transfers 16 /mnt/archive/backup/BorgRepos/$FOLDER backup:Borg-all/$FOLDER 
