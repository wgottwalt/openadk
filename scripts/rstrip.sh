# $Id: rstrip.sh 440 2009-05-13 16:09:54Z wbx $
#-
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
	V=${F##*/fake-+([!/])/}
	T="${prefix}strip"
	T=$T$stripcomm
	case $line in
	*ELF*executable*statically\ linked*)
		echo >&2 "$SELF: *WARNING* '$V' is not dynamically linked!"
		;;
	esac
	case $line in
	*ELF*executable*,\ not\ stripped*)
		S=executable ;;
	*/lib/modules/2.*.o:*ELF*relocatable*,\ not\ stripped* | \
	*/lib/modules/2.*.ko:*ELF*relocatable*,\ not\ stripped*)
		# kernel module parametres must not be stripped off
		T="$T --strip-unneeded $(echo $(${prefix}nm $F | \
		    sed -n -e '/__param_/s/^.*__param_/-K /p' \
		    -e '/__module_parm_/s/^.*__module_parm_/-K /p'))"
		S='kernel module' ;;
	*ELF*relocatable*,\ not\ stripped*)
		S=relocatable ;;
	*ELF*shared\ object*,\ not\ stripped*)
		S='shared object' ;;
	*)
		continue ;;
	esac
	echo "$SELF: $V:$S"
	#echo "+ $T $F"
	eval "$T $F"
done
