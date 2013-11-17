#!/bin/bash

# this will set up aliases on initial login, where our dotfiles .bashrc
# didn't exist yet.  This file must be SOURCED, not run as script.

for i in `find ~/dotfiles/tsl/.aliases -name '*[^~]' -type f -print` ; do
    # echo 'to open:' $i
    source $i
done
