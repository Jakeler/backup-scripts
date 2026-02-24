#!/bin/bash
source chg_dir.sh

borg create -svp -C zstd --patterns-from pattern.lst --pattern '! /home/*/Hobby/' "Laptop::Home_zenbook13-{now:%y.%j}" ~/
