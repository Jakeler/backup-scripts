#!/bin/bash
# source chg_dir.sh # use BORG_BASEDIR with ssh

borg create -svp -C zstd --patterns-from pattern.lst --pattern '! /home/*/Hobby/' --pattern '! /home/*/DBs/' "$BORG_BASEDIR/Laptop::Home_zenbook13-{now:%y.%j}" ~/
