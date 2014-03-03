# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

[[ -n $BASH_VERSION ]] && shopt -s extglob

SELF=${0##*/}

if [[ -z $prefix ]]; then
	echo >&2 "$SELF: strip command not defined ('prefix' variable not set)"
	exit 1
fi

if [[ $1 = +keep ]]; then
	stripcomm=
	shift
else
	stripcomm=" -R .comment"
fi

TARGETS=$*

if [[ -z $TARGETS ]]; then
	echo >&2 "$SELF: no directories / files specified"
	echo >&2 "usage: $SELF [PATH...]"
	exit 1
fi

find $TARGETS -type f -a -exec file {} \; | \
    while IFS= read -r line; do
	F=${line%%:*}
	D=${TARGETS}-dbg
	V=${F##*/fake-+([!/])/}
	P=${F##*/pkg-+([!/])/}
	Q=${P%/*}
	R=${P##*/}
	T="${prefix}strip"
	O="${prefix}objcopy"
	T=$T$stripcomm
	case $line in
	*ELF*executable*statically\ linked*)
		;;
	*ELF*relocatable*,\ not\ stripped*)
		;;
	esac
	case $line in
	*ELF*executable*,\ not\ stripped*)
		S=executable ;;
	*/lib/modules/3.*.o:*ELF*relocatable*,\ not\ stripped* | \
	*/lib/modules/3.*.ko:*ELF*relocatable*,\ not\ stripped*)
		# kernel module parametres must not be stripped off
		T="$T --strip-unneeded $(echo $(${prefix}nm $F | \
		    sed -n -e '/__param_/s/^.*__param_/-K /p' \
		    -e '/__module_parm_/s/^.*__module_parm_/-K /p'))"
		S='kernel module' ;;
	*ELF*shared\ object*,\ not\ stripped*)
		S='shared object' ;;
	*)
		continue ;;
	esac
	echo "$SELF: $V:$S"
	echo "-> $T $F"
	eval "chmod u+w $F"
	if [[ $debug -ne 0 ]];then
		echo "mkdir for $D" >> /tmp/debug
		eval "mkdir -p $D/usr/lib/debug/$Q"
		eval "$O --only-keep-debug $F $D/usr/lib/debug/$P.debug"
	fi
	eval "$T $F"
	if [[ $debug -ne 0 ]];then
		eval "cd $D/usr/lib/debug/$Q && $O --add-gnu-debuglink=$R.debug $F"
	fi
done
exit 0
