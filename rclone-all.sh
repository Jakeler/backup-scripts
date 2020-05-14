#!/bin/bash 
set -e

read -p 'Rclone config key:' -s RCLONE_CONFIG_PASS
export RCLONE_CONFIG_PASS

FOLDERS=('PC' 'Phone' 'Laptop' 'Multimedia')
for val in ${FOLDERS[@]}; do
    echo -e "\n ===> Syncing $val folder!"
   ./rclone.sh $val
done
