# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
# Note: this is slow, but it's not the "progress stuff" which cau-
# ses the slow-down.

TOPDIR=$1

[[ -n $BASH_VERSION ]] && shopt -s extglob

grep -v '^BUSYBOX\|^# BUSYBOX' $TOPDIR/.config > $TOPDIR/.config.split

mkdir -p $TOPDIR/.cfg
cd $TOPDIR/.cfg

oldfiles=$(echo *)
newfiles=:

echo -n 'autosplitting main config...'
while read line; do
	oline=$line
	[[ -n $line ]] && if [[ $line = @(# [A-Z])* ]]; then
		line=${line#? }
		if [[ $line = *@( is not set) ]]; then
			line=${line% is not set}
		else
			# some kind of comment
			line=
		fi
	elif [[ $line = @([A-Z])*@(=)* ]]; then
		line=${line%%=*}
	elif [[ $line = @(#)* ]]; then
		# valid comment
		line=
	else
		# invalid non-comment
		echo "Warning: line '$oline' invalid!" >&2
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
		[[ $oline = $fline ]] || echo "$oline" >$line
		if [[ $newfiles = *:$line:* ]]; then
			echo "Error: duplicate Config.in option '$line'!" >&2
			exit 1
		fi
		newfiles=$newfiles$line:
	fi
done <$TOPDIR/.config.split

# now handle the case of removals
echo -n ' removals...'
for oldfile in $oldfiles; do
	[[ $newfiles = *:$oldfile:* ]] || rm -f $oldfile
done
printf '\r%60s\r' ''

# now scan for dependencies of packages; the information
# should probably be in build_mipsel because it's generated
# at build time, but OTOH, soon enough, parts of Makefile
# and the entire Config.in will be auto-generated anyway,
# so we're better off placing it here
#XXX this is too slow @868 configure options
cd $TOPDIR/.cfg
rm -f $TOPDIR/package/*/info.mk
for option in *; do
	echo -n "$option ..."
	x=$(( ${#option} + 4 ))
	ao=:
	fgrep -l $option $TOPDIR/package/*/{Makefile,Config.*} 2>&- | \
	    while read line; do
		echo ${line%/*}/info.mk
	done | while read fname; do
		[[ $ao = *:$fname:* ]] && continue
		ao=$ao$fname:
		echo "\${_IPKGS_COOKIE}: \${TOPDIR}/.cfg/$option" >>$fname
	done
	printf '\r%'$x's\r' ''
done

exit 0
