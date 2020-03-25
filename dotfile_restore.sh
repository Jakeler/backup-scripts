#!/bin/bash

git clone --bare git@github.com:Jakeler/dotfiles.git

git --git-dir=dotfiles.git/ --work-tree=$HOME checkout
