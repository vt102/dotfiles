#!/bin/bash

for i in `find ~/dotfiles -type f -print | egrep -v '\.git|hide-bin|README' | sed s-$HOME/dotfiles/--` ; do
    SOURCE=$HOME/dotfiles/$i
    TARGET=$HOME/$i
    DPATH=`echo $TARGET | sed s'-\(^.*/\).*$-\1-'`
    echo rm $TARGET ';' mkdir -p $DPATH ';' ln -s $HOME/dotfiles/$i $HOME/$i
done