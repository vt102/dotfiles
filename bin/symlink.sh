#!/bin/bash

for i in `find ~/dotfiles/tsl -type f -print | sed s-$HOME/dotfiles/tsl/--` ; do
    SOURCE=$HOME/dotfiles/$i
    TARGET=$HOME/$i
    DPATH=`echo $TARGET | sed s'-\(^.*/\).*$-\1-'`

    if [ -e "$TARGET" -o -L "$TARGET" ] ; then
	rm $TARGET 
    fi

    if [ ! -d "$DPATH" ] ; then
	mkdir -p $DPATH 
    fi

    ln -s $HOME/dotfiles/tsl/$i $HOME/$i
done