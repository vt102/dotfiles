#!/usr/bin/env bash

# Give me information about the environment I am on here.

DEBUG=0

# Username, FQDN, system running, best guess hosting?  Assumes uname at minimum

SYSTEM=`uname -s`
if [ "$SYSTEM" == "Linux" ] 
then
    if [ $DEBUG == 1 ]
    then
	echo "System is" $SYSTEM
    fi

    USERNAME=`whoami`
    FQDN=`hostname -f`
    KERNEL=`uname -r`
    if [ -e /proc/version ]
    then
	export PROCVER=`cat /proc/version`
	if [ $DEBUG == 1 ]
	then
	    echo "PROCVER is $PROCVER"
	fi

	if `echo $PROCVER | egrep -i ubuntu >/dev/null 2>&1` 
	then
	    DISTRO='ubuntu'
	elif `echo $PROCVER | egrep -i 'Red Hat' >/dev/null 2>&1` 
	then
	    if [ -e /etc/centos-release ]
	    then
		DISTRO='centos'
	    else
		DISTRO='redhat'
	    fi
	fi
    fi

    case $DISTRO in
	centos)
	    DISTROV=`cat /etc/centos-release`
	    ;;
	redhat)
	    DISTROV=`cat /etc/redhat-release`
	    ;;
	ubuntu)
	    DISTROV=`cat /etc/lsb-release | egrep DESCRIP | sed 's/DISTRIB_DESCRIPTION="\(.*\)".*$/\1/'`
	    ;;
	*)
	    DISTROV='unknown'
	    ;;
    esac

    if ` vmware-toolbox-cmd --help > /dev/null 2>&1`
    then
	HYPERV='vmware'
    else
	HYPERV='unknown'
    fi
fi

echo "$USERNAME on $FQDN ($DISTROV)"

# Installed primitives-- perl, python, ruby, git, emacs
