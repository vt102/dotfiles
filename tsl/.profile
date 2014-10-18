# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
for p in "$HOME/bin/mix" ; do
    if [ -d $p ] ; then
	PATH="$p:$PATH"
    fi
done

# set PATH so it includes custom other stuff
for p in /opt/chefdk/bin /opt/chefdk/embedded/bin ; do
    if [ -d $p ] ; then
	PATH="$p:$PATH"
    fi
done

if [ -d /opt/chefdk ] ; then
  export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.1.0"
  export GEM_HOME=/home/acowell/.chefdk/gem/ruby/2.1.0
  export GEM_PATH=/home/acowell/.chefdk/gem/ruby/2.1.0:/opt/chefdk/embedded/lib/ruby/gems/2.1.0
fi

for p in /opt/chef/bin /opt/chef/embedded/bin ; do
    if [ -d $p ] ; then
	PATH="$p:$PATH"
    fi
done
