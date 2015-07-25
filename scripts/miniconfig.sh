#!/bin/sh

# miniconfig.sh copyright 2005 by Rob Landley <rob@landley.net>
# Licensed under the GNU General Public License version 2.
#
# This script aids in building a mini.config from a fully fledged kernel
# config. To do so, change into the kernel source directory and call this
# script with the full config as first parameter. The output will be written to
# a file named 'mini.config' in the same directory.
#
# Beware: This runs for a long time and the output might not be optimal. When
# using it, bring some beer but don't drink too much so you're still able to
# manually review the output in the end.

if [ $# -ne 1 ] || [ ! -f "$1" ]; then
	echo "Usage: miniconfig.sh configfile"
	exit 1
fi

if [ "$1" == ".config" ]; then
	echo "It overwrites .config, rename it and try again."
	exit 1
fi

cp $1 mini.config
echo "Calculating mini.config..."

LENGTH=`cat $1 | wc -l`

# Loop through all lines in the file
I=1
while true; do
	if [ $I -gt $LENGTH ]; then
		exit
	fi
	sed -n "${I}!p" mini.config > .config.test
	# Do a config with this file
	make allnoconfig KCONFIG_ALLCONFIG=.config.test > /dev/null

	# Compare.  The date changes so expect a small difference each time.
	D=`diff .config $1 | wc -l`
	if [ $D -eq 4 ]; then
		mv .config.test mini.config
		LENGTH=$[$LENGTH-1]
	else
		I=$[$I + 1]
	fi
	echo -n -e $I/$LENGTH lines `cat mini.config | wc -c` bytes "\r"
done
echo
