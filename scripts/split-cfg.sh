# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
# Note: this is slow, but it's not the "progress stuff" which cau-
# ses the slow-down.

TOPDIR=$1
TARGET=$2
LIBC=$3
(( x_cols = (COLUMNS > 10) ? COLUMNS - 2 : 80 ))
typeset -L$x_cols pbar

grep -v '^BUSYBOX\|^# BUSYBOX' $TOPDIR/.config > $TOPDIR/.config.split

mkdir -p $TOPDIR/.cfg_${TARGET}_${LIBC}
cd $TOPDIR/.cfg_${TARGET}_${LIBC}

oldfiles=$(print -r -- *)
newfiles=:

print -nu2 'autosplitting main config...'
while read line; do
	oline=$line
	[[ -n $line ]] && if [[ $line = @(\# [A-Z])* ]]; then
		line=${line#? }
		if [[ $line = *@( is not set) ]]; then
			line=${line% is not set}
		else
			# some kind of comment
			line=
		fi
	elif [[ $line = @([A-Z])*@(=)* ]]; then
		line=${line%%=*}
	elif [[ $line = \#* ]]; then
		# valid comment
		line=
	else
		# invalid non-comment
		print -u2 "\nWarning: line '$oline' invalid!"
		line=
	fi
	# if the line is a valid yes/no/whatever, write it
	# unless the file already exists and has same content
	if [[ -n $line ]]; then
		if [[ $line != ADK_HAVE_DOT_CONFIG && -s $line ]]; then
			fline=$(<$line)
		else
			fline=
		fi
		[[ $oline = $fline ]] || print -r -- "$oline" >$line
		if [[ $newfiles = *:$line:* ]]; then
			print -u2 "\nError: duplicate Config.in option '$line'!"
			exit 1
		fi
		newfiles=$newfiles$line:
	fi
done <$TOPDIR/.config.split

# now handle the case of removals
print -nu2 ' removals...'
for oldfile in $oldfiles; do
	[[ $newfiles = *:$oldfile:* ]] || rm -f $oldfile
done
print -nu2 '\r'

# now scan for dependencies of packages; the information
# should probably be in build_mipsel because it's generated
# at build time, but OTOH, soon enough, parts of Makefile
# and the entire Config.in will be auto-generated anyway,
# so we're better off placing it here
#XXX this is too slow @868 configure options
cd $TOPDIR/.cfg_${TARGET}_${LIBC}
rm -f $TOPDIR/package/*/info.mk
for option in *; do
	pbar="$option ..."
	print -nu2 "$pbar\r"
	ao=:
	fgrep -l $option $TOPDIR/package/*/{Makefile,Config.*} 2>&- | \
	    while read line; do
		print -r -- ${line%/*}/info.mk
	done | while read fname; do
		[[ $ao = *:$fname:* ]] && continue
		ao=$ao$fname:
		echo "\${_IPKGS_COOKIE}: \${TOPDIR}/.cfg_${TARGET}_${LIBC}/$option" >>$fname
	done
done
pbar=done
print -u2 "$pbar"

exit 0
