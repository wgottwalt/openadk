#!/bin/sh

filename="/tmp/qingy_restart_gpm"
status=`pgrep gpm`

if [ "$status" != "" ]; then

	/etc/init.d/gpm stop >/dev/null 2>/dev/null
	touch $filename

fi
