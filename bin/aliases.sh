#!/bin/bash

for i in `find ~/dotfiles/aliases -name '*[^~]' -type f -print` ; do
    # echo 'to open:' $i
    source $i
done
