#!/bin/bash

CLONE_DIR=$HOME/.dotfiles

git clone --bare git@github.com:Jakeler/dotfiles.git $CLONE_DIR

git --git-dir=$CLONE_DIR --work-tree=$HOME checkout -f
git --git-dir=$CLONE_DIR config status.showUntrackedFiles no
