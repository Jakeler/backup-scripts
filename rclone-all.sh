#!/bin/bash 
set -e

# Good for interactive use, but not for automatic sync
# read -p 'Rclone config key:' -s RCLONE_CONFIG_PASS
# export RCLONE_CONFIG_PASS

FOLDERS=('PC' 'Phone' 'Laptop' 'Media')
for val in ${FOLDERS[@]}; do
    echo -e "\n ===> Syncing $val folder!"
   ./rclone.sh $val
done
