#!/bin/bash
source chg_dir.sh

borg create -svp -C lz4 --patterns-from pattern.lst "PC::Home-{now:%y.%j}" /home/jk/ "$@"
