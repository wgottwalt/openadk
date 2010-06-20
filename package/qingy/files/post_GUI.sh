#!/bin/sh

filename="/tmp/qingy_restart_gpm"

if [ -f $filename ]; then

	/etc/init.d/gpm start >/dev/null 2>/dev/null
	rm $filename

fi
