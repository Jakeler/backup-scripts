#!/bin/bash
# source chg_dir.sh # use BORG_BASEDIR with ssh

# recommeded prep:
# delete browser cache (chrome, firefox) and close
# clear cache in Thunderbird settings, right click on account - compact all folders
# clear dolphin trash can

borg create -svp -C zstd --patterns-from pattern.lst --pattern '! /home/*/Doks/' "$BORG_BASEDIR/PC::Home-{now:%y.%j}" /home/jk/
# might exlude DBs here, but it's small and important, maybe good to have 2x
