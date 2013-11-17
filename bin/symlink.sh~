#!/bin/bash

for i in `find ~/dotfiles -type f -print | egrep -v '\.git/|hide-bin|README' | sed s-$HOME/dotfiles/--` ; do
    SOURCE=$HOME/dotfiles/$i
    TARGET=$HOME/$i
    DPATH=`echo $TARGET | sed s'-\(^.*/\).*$-\1-'`

    if [ -e "$TARGET" ] ; then
	rm $TARGET 
    fi

    if [ ! -d "$DPATH" ] ; then
	mkdir -p $DPATH 
    fi

    ln -s $HOME/dotfiles/$i $HOME/$i
done