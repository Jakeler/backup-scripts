#!/bin/bash
source chg_dir.sh

borg create -svp -C zstd --patterns-from pattern.lst --pattern '! /home/*/Doks/' "PC::Home-{now:%y.%j}" /home/jk/
